class Players.Josh extends Player {

	var name:String = "josh";
	var instrument:String = "drums";

	var sound_effects = {
		die: ["josh_die_01", "josh_die_02", "josh_die_03"],
		hit: ["josh_hit_01", "josh_hit_02", "josh_hit_03", "josh_hit_04"],
		jump: ["josh_jump_01", "josh_jump_02"],
		shout: ["shout_drums"],
		attack: ["block"]
	};

	var attack_cooldown_max:Number = 12;

	function attack() {
		if (attack_cooldown <= 0) {
			sound("attack");
			var drum_stick = throwProjectile("drum_stick", -40, 40, 30, 20 + Math.random() * 20);
			Tools.gotoRandomFrame(drum_stick);
			drum_stick.setTarget("enemy");
			attack_cooldown = attack_cooldown_max;
		}
	}
	
}
