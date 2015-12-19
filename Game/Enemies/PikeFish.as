class Enemies.PikeFish extends Enemies.Enemy {
	
	var projective_count:Number = 0;

	function PikeFish() {
		var frame = Math.ceil(Math.random() * this["sprites"]._totalFrames);
		this["sprites"].gotoAndPlay(frame);
		xx = -2;
	}

	function onEnterFrame() {
		this.moveMe();
		this.checkCollision();
		this.checkRemove();
	}

	function throwFish() {
		this.throwProjectile("fish", 65, 60, -20, 10);
	}

	function checkRemove() {
		if (_x < - 100) {
			remove();
		}
	}

}
