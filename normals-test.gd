tool
extends MeshInstance2D

export var outerSize:float = 100 setget set_outer_size, get_outer_size
func set_outer_size(value:float)->void:
  outerSize = value
  _update_mesh()
func get_outer_size()->float:
  return outerSize


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  _update_mesh()

func _update_mesh()->void:
  var newMesh = ArrayMesh.new()

  var verts = PoolVector3Array()
  var uvs = PoolVector2Array()
  var normals = PoolVector3Array()
  var indices = PoolIntArray()
  var colors = PoolColorArray()

  verts.append(Vector3(0, 0, 0))
  uvs.append(Vector2(0,0))
  normals.append(Vector3(-1, 0, 1))

  verts.append(Vector3(1, 0, 0))
  uvs.append(Vector2(1,0))
  normals.append(Vector3(1, 0, 1))

  verts.append(Vector3(1, 1, 0))
  uvs.append(Vector2(1,1))
  normals.append(Vector3(1, 0, 1))

  verts.append(Vector3(0, 1, 0))
  uvs.append(Vector2(0,1))
  normals.append(Vector3(-1, 0, 1))

  indices.append_array([0, 3, 1])
  indices.append_array([1, 3, 2])

  # convert normals to colors
  colors = PoolColorArray();
  for n in normals:
    var c = (n.normalized() + Vector3(1, 1, 1)) / 2.0
    colors.append(Color(c.x, c.y, c.z))

  var arr = [];
  arr.resize(Mesh.ARRAY_MAX)
  arr[Mesh.ARRAY_VERTEX] = verts
  arr[Mesh.ARRAY_COLOR] = colors
  arr[Mesh.ARRAY_TEX_UV] = uvs
  arr[Mesh.ARRAY_NORMAL] = normals
  arr[Mesh.ARRAY_INDEX] = indices
  newMesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr)
  set_mesh(newMesh)
  prints('normal test mesh generated.')
