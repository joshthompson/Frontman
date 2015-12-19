class Projectiles.MatildaAttack extends Projectile {

	var matilda:Players.Matilda;
	
	function MatildaAttack() {
		this.setTarget("enemy");
		this.solid = true;
	}

	function setMatilda(matilda:Players.Matilda) {
		this.matilda = matilda;
	}

	function checkHitTarget() {
		var targets = object_target == "player" ? Game.get("players") : Game.get("enemies");
		for (var i in targets) {
			if (targets[i].hitTest(this["hit"])) {
				targets[i].hit();
			}
		}
	}

	function moveMe() {
		this._x = this.matilda._x - 45;
		this._y = this.matilda._y - 160;
	}

}