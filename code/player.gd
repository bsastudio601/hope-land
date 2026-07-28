extends CharacterBody2D

const SPEED = 50
var facing_left = false
var facing_up = false
const OFFSET = 12
var dialouge_active = false

@onready var sprite = $AnimatedSprite2D
@onready var action_finder: Area2D = $ActionFinder

func _ready() -> void:
	DialogueManager.dialogue_started.connect(on_dialouge_start)
	DialogueManager.dialogue_ended.connect(on_dialouge_end)
	
	
	
func on_dialouge_start(_resource)-> void:
	dialouge_active = true
	velocity = Vector2.ZERO
	if facing_up:
		sprite.play("idleup")
	elif facing_left:
		sprite.play("idleleft")
	else:
		sprite.play("idleright")

func on_dialouge_end(_resource)-> void:
	dialouge_active = false 
	

func _physics_process(delta: float) -> void:
	if dialouge_active:
		return
	var direction = Vector2.ZERO
	
	if Input.is_action_just_pressed("next"):
		var actionable = action_finder.get_overlapping_areas()

		if actionable.size() > 0:
			if actionable[0].has_method("action"):
				actionable[0].action()
				print(actionable)


	if Input.is_action_pressed("move_left"):
		direction.x = -1

	if Input.is_action_pressed("move_right"):
		direction.x = 1

	if Input.is_action_pressed("move_up"):
		direction.y = -1
		

	if Input.is_action_pressed("move_down"):
		direction.y = 1

	if direction != Vector2.ZERO:
		velocity = direction.normalized() * SPEED

		if direction.x < 0:
			sprite.play("walkleft")
			facing_left = true
			facing_up = false
			action_finder.position = Vector2(-OFFSET, 0)

		elif direction.x > 0:
			sprite.play("walkright")
			facing_left = false
			facing_up = false
			action_finder.position = Vector2(OFFSET, 0)

		elif direction.y < 0:
			sprite.play("walkup")
			facing_up = true
			action_finder.position = Vector2(0, -OFFSET)

		elif direction.y > 0:
			sprite.play("walkdown")
			facing_up = false
			action_finder.position = Vector2(0, OFFSET)

	else:
		velocity = Vector2.ZERO

		if facing_up:
			sprite.play("idleup")
		elif facing_left:
			sprite.play("idleleft")
		else:
			sprite.play("idleright")

	move_and_slide()
