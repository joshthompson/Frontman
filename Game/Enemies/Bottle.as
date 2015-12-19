class Enemies.Bottle extends Enemies.Enemy {
	
	var projective_count:Number = 0;

	function Bottle() {
	}

	function onEnterFrame() {
		this.checkRemove();
	}

	function throwBottle() {
		if (_x < Stage.width + 400) {
			this.throwProjectile("throwing_bottle", 65, 40, -20, 40);
		}
	}

	function checkRemove() {
		if (_x < - 100) {
			remove();
		}
	}

}
