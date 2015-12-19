class Players.Claire extends Player {

	var name:String = "claire";
	var instrument:String = "bass";

	var sound_effects = {
		die: ["claire_die_01", "claire_die_02"],
		hit: ["claire_hit_01", "claire_hit_02"],
		jump: ["claire_jump_01"],
		shout: ["shout_bass"],
		attack: ["bass_note_D", "bass_note_E", "bass_note_F"]
	};

	var attack_cooldown_max:Number = 10;

	function attack() {
		if (attack_cooldown <= 0) {
			sound("attack");
			var bass_blast = throwProjectile("bass_blast", -40, 40, 0, this.yy);
			bass_blast.setTarget("enemy");
			bass_blast.lock();
			attack_cooldown = attack_cooldown_max;
		}
	}

}
