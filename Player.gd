extends RigidBody2D
export (int) var speed
export (float) var traverse = 0.1
export (int) var fuel

func _ready():
	self.angular_damp = 10


func _process(delta):
	
	
	$Flame.hide()
	var velocity = Vector2() # player's moment
	if Input.is_action_pressed("ui_right"):
#		velocity.x += 1
#		self.rotate(1.0 * traverse)
		self.angular_velocity += 1
	if Input.is_action_pressed("ui_left"):
#		velocity.x -= 1
#		self.rotate(-1.0 * traverse)
		self.angular_velocity -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		$Flame.show()
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		fuel -= speed
		self.apply_impulse(Vector2(), velocity.rotated(self.rotation))
#		$AnimatedSprite.play()
#	else:
#		$AnimatedSprite.stop()
	
#	position += velocity * delta
#	position.x = clamp(position.x, 0, screensize.x)
#	position.y = clamp(position.y, 0, screensize.y)
	
#	if velocity.x != 0:
#		$AnimatedSprite.animation = "right"
#		$AnimatedSprite.flip_v = false
#		$AnimatedSprite.flip_h = velocity.x < 0
#	elif velocity.y != 0:
#		$AnimatedSprite.animation = "up"
#		$AnimatedSprite.flip_v = velocity.y > 0
