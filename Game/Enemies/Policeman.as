class Enemies.Policeman extends Enemies.Enemy {
	
	var projective_count:Number = 0;

	var sound_effects = {
		die: ["jeff_die_01", "jeff_die_02", "jeff_die_03"]
	}

	function Policeman() {
		var frame = Math.ceil(Math.random() * this["sprites"]._totalFrames);
		this["sprites"].gotoAndPlay(frame);
	}

	function onEnterFrame() {
		this.moveMe();
		this.checkCollision();
		this.checkRemove();
	}

	function throwBaton() {
		if (_x < Stage.width + 200) {
			this.throwProjectile("baton", 65, 40, -20, 10);
		}
	}

	function checkRemove() {
		if (_x < - 100) {
			remove();
		}
	}

}