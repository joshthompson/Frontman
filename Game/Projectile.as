class Projectile extends Sprite {

	var solid:Boolean = false;
	var object_target:String = "player";
	var active:Boolean = true;

	function Projectile(x, y, speed, object_target) {
		_x = x;
		_y = y;
		xx = speed;
		this.object_target = object_target == "enemy" ? "enemy" : "player";
	}

	public function setTarget(object_target) {
		this.object_target = object_target == "enemy" ? "enemy" : "player";
	}

	function onEnterFrame() {
		this.moveMe();
		this.checkCollision();
		this.checkHitTarget();
		this.checkRemove();
	}

	function onLoad() {
		if (!locked) {
			Game.register("level_objects", this);
		}
	}

	function lock() {
		this.locked = true;
		Game.unregister(this, "level_objects");
	}

	function checkHitTarget() {
		if (this.active) {
			var targets = object_target == "player" ? Game.get("players") : Game.get("enemies");
			for (var i in targets) {
				if (targets[i].hitTest(this)) {
					this.hit();
					targets[i].hit();
				}
			}
		}
	}

	function checkRemove() {
		if (// (xx > 0 && _x > Stage.width + 100) ||
			// (xx < 0 && _x < -100) ||
			(-yy > 0 && _y > Stage.height + 100) ||
			(-yy < 0 && _y < -100)) {
			this.remove();
		}
	}

	function hit() {
		this.remove();
	}

	function remove() {
		this.removeMovieClip();
	}

}