class CharacterSprite extends Sprite {

	var alive:Boolean = true;
	var hp:Number = 1;
	var max_hp:Number = 1;

	var attack_cooldown:Number = 0;

	function throwProjectile(projectile, offset_x, offset_y, xx, yy, move):Projectile {
		var projectile = Tools.newMovieClip(projectile, _x - offset_x, _y - offset_y, _root.game.level);
		projectile.xx = xx;
		projectile.yy = yy;
		return projectile;
	}

	function attackCooldown() {
		attack_cooldown--;
	}

	function hit() {
		hp--;
		sound("hit");
		if (hp <= 0) {
			this.die();
		}
	}

	function die() {
		if (this.alive) {
			this.alive = false;
			this.fixed = false;
			this.solid = false;
			this.yy = 15;
			this.rr = -2;
			sound("die");
			animate("dead");

			Game.unregister(this, "characters");

			if (typeof this["dieExtra"] == "function") {
				this["dieExtra"]();
			}
		}
	}

}