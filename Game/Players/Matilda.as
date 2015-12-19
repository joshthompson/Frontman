class Players.Matilda extends Player {

	var name:String = "matilda";
	var instrument:String = "vocals";

	var sound_effects = {
		die: ["matilda_die_01", "matilda_die_02"],
		hit: ["matilda_hit_01", "matilda_hit_02"],
		jump: ["matilda_jump_01"],
		shout: ["shout_vocals"],
		attack: ["matilda_attack_01", "matilda_attack_02", "matilda_attack_03", "matilda_attack_04", "matilda_attack_05"]
	};

	var attack_cooldown_max:Number = 13;

	function attack() {
		if (attack_cooldown <= 0) {
			sound("attack");
			animate("attack", true);
			var matilda_attack = throwProjectile("matilda_attack", 0, 175, 0, this.yy);
			matilda_attack.setMatilda(this);
			attack_cooldown = attack_cooldown_max;
		}
	}

	function attackEnd() {
		this.unlockAnimation();
		this.animate("run");
	}
	
}
