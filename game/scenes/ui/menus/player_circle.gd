extends Control
## 플레이어를 나타내는 파란 원 플레이스홀더.
## 실제 플레이어 이미지가 준비되면 TextureRect로 교체하면 됩니다.

func _draw() -> void:
	var center := size / 2.0
	var radius := minf(size.x, size.y) / 2.0

	# 그림자
	draw_circle(center + Vector2(4, 6), radius, Color(0, 0, 0, 0.25))
	# 몸통 (파란 원)
	draw_circle(center, radius, Color(0.22, 0.46, 0.9))
	# 하이라이트 (왼쪽 위 작은 원)
	draw_circle(center + Vector2(-radius * 0.28, -radius * 0.3), radius * 0.22, Color(0.6, 0.78, 1.0, 0.55))
