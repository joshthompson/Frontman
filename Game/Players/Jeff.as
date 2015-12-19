class Players.Jeff extends Player {

	var name:String = "jeff";
	var instrument:String = "guitar";

	var sound_effects = {
		die: ["jeff_die_01", "jeff_die_02", "jeff_die_03"],
		hit: ["jeff_hit_01", "jeff_hit_02", "jeff_hit_03", "jeff_hit_04"],
		jump: ["jeff_jump_01", "jeff_jump_02"],
		shout: ["shout_guitar"],
		zap: ["zap"]
	};

	var attack_cooldown_max:Number = 12;

	function attack() {
		if (attack_cooldown <= 0) {

			// Set start point
			var start = new Point(_x + 37, _y - 37);
			var end = new Point(_x + 37 + 100 + Math.random() * 30, _y - 37 - 50 + Math.random() * 30);
			var enemy = false;

			var max_distance = 250;
			var max_angle =  Math.PI * 1 / 9;
			var min_angle = -Math.PI * 8 / 9;

			// Get closest enemy
			var distance = false;
			for (var i in Game.get("enemies")) {
				var point = new Point(Game.get("enemies")[i]._x, Game.get("enemies")[i]._y - Game.get("enemies")[i]._height / 2);
				var angle = start.angle(point);
				var enemy_distance = start.distance(point);
				if ((distance === false || enemy_distance < distance) && enemy_distance < max_distance && angle < max_angle && angle > min_angle) {
					end = point;
					enemy = Game.get("enemies")[i];
					distance = enemy_distance;
				}
			}

			// Create lightning
			if (enemy) {
				var lightning = new Lightning(start, end);
				enemy.hit();
			} else {
				var lightning = new Lightning(start, end);
			}
			sound("zap", 200);

			// Reset cooldown
			attack_cooldown = attack_cooldown_max;
		}

	}

}
