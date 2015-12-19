class Players.Vicki extends Player {

	var name:String = "vicki";
	var instrument:String = "decks";

	var sound_effects = {
		die: ["claire_die_01", "claire_die_02"],
		hit: ["claire_hit_01", "claire_hit_02"],
		jump: ["claire_jump_01"]
	};

	var positions = [50];

	var cd:Projectile;
	function attack() {
		if (typeof this.cd != "movieclip" || typeof this.cd.active != "boolean" || !this.cd.active) {
			this.cd = throwProjectile("cd", -40, 40, 15, 10);
			this.cd.setTarget("enemy");
			this.cd.solid = true;
			this.cd.rr = 20;
			attack_cooldown = 999;
		} else if (this.cd.fixed) {
			this.cd.yy = 30;
			this.cd.fixed = false;
		}
	}

}
