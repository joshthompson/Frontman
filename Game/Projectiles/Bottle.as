class Projectiles.Bottle extends Projectile {

	var sound_effects = {
//		smash: ["smash"]
	};

	function Bottle() {
		Game.register("enemies", this);
	}

	function onEnterFrame() {
		this.moveMe();
		this.checkCollision();
		this.checkHitTarget();
		this.checkRemove();
		_xscale = _yscale = _yscale + 2;
	}

	function hit() {
		this.die();
		this.active = false;
	}
	function die() {
		this.animate("smash");
		// this.sound("smash");
	}

}