extends Control

# - VARIABLES - ################################################################


# - SIGNALS - ##################################################################


# - METHODS - ##################################################################

func _ready() -> void:
	GameManager.current_enemy.changed.connect(updateEnemyHealth)
	GameManager.current_enemy.emit_changed()
	GameManager.character_class.changed.connect(updatePlayerHealth)
	GameManager.character_class.emit_changed()
	

func updateEnemyHealth() -> void:
	$Control/EnemyHealthText.text = str(GameManager.current_enemy.enemy_current_health,"/",GameManager.current_enemy.enemy_max_health)
	$Control/EnemyHealth.value = GameManager.current_enemy.enemy_current_health
	$Control/EnemyHealth.max_value = GameManager.current_enemy.enemy_max_health


func updatePlayerHealth() -> void:
	$Control/PlayerHealthText.text = str(GameManager.character_class.current_health,"/",GameManager.character_class.max_health)
	$Control/PlayerHealth.value = GameManager.character_class.current_health
	$Control/PlayerHealth.max_value = GameManager.character_class.max_health
