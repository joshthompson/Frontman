class Enemies.BinMonster extends Enemies.Enemy {
	
	var projective_count:Number = 0;

	function BinMonster() {
		var frame = Math.ceil(Math.random() * this["sprites"]._totalFrames);
		this["sprites"].gotoAndPlay(frame);
	}

	function onEnterFrame() {
		this.moveMe();
		this.checkCollision();
		this.checkRemove();
	}

	function throwRubbish() {
		if (_x < Stage.width + 200) {
			this.throwProjectile("rubbish", 65, 40, -20, 10);
		}
	}

	function checkRemove() {
		if (_x < - 100) {
			remove();
		}
	}

}
