class Projectiles.BassBlast extends Projectile {
	
	function checkHitTarget() {
		var targets = object_target == "player" ? Game.get("players") : Game.get("enemies");
		for (var i in targets) {
			if (targets[i].hitTest(this)) {
				targets[i].hit();
			}
		}
	}

}