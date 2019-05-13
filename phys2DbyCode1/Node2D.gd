extends Node2D

var bod:RigidBody2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	if bod!=null:
		print (bod.position) # the body moves
		
func _input(event):
	if (event.is_pressed() and event.button_index == BUTTON_LEFT):
		bod=RigidBody2D.new()
		bod.position=event.position
		
		var shap=ConvexPolygonShape2D.new()
		var vpool=PoolVector2Array()
		vpool.append(Vector2(20,70))
		vpool.append(Vector2(80,70))
		vpool.append(Vector2(50,20))
		shap.set_point_cloud(vpool)
		
		var ownerID=bod.create_shape_owner(bod) #bod twice?
		bod.shape_owner_add_shape(ownerID,shap)
		
		add_child(bod)
		
		print (bod.position)
		print (bod.visible)
