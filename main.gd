extends Node

var target_distance = 10.0
var hysteresis = 1.0
var current_lod = 0
var mesh_instances = []

func _ready():
    # Example: Add MeshInstance3D nodes to the mesh_instances array
    # mesh_instances.append($MeshInstance1)
    # mesh_instances.append($MeshInstance2)

func _process(delta):
    for mesh_instance in mesh_instances:
        var distance = mesh_instance.global_transform.origin.distance_to(get_global_transform().origin)
        var lod = get_lod(distance)
        if lod != current_lod:
            current_lod = lod
            update_mesh_lod(mesh_instance, lod)

func get_lod(distance):
    if distance < target_distance - hysteresis:
        return 0
    elif distance < target_distance + hysteresis:
        return 1
    else:
        return 2

func update_mesh_lod(mesh_instance, lod):
    # Example: Switch LOD based on the lod value
    # mesh_instance.mesh = lod_meshes[lod]