class Enemies.Groupie extends Enemies.Enemy {
	
	var projective_count:Number = 0;

	function Groupie() {
		var frame = Math.ceil(Math.random() * this["sprites"]._totalFrames);
		this["sprites"].gotoAndPlay(frame);
		this.xx = -5;
	}

	function onEnterFrame() {
		if (_x < Stage.width + 100) {
			this.moveMe();
		}
		this.checkCollision();
		this.checkRemove();
		this.checkHitTarget();
		this.talk();
	}

	function checkRemove() {
		if (_x < - 100) {
			remove();
		}
	}

	function checkHitTarget() {
		if (this.alive) {
			for (var i in Game.get("players")) {
				if (Game.get("players")[i].hitTest(this)) {
					Game.get("players")[i].trip();
					die();
				}
			}
		}
	}

	var phrases:Array = ["I LUV U!", "AUTOGRAPH!", "AHHH", "!!!!", "ENCORE!", "OMG!"];
	function talk() {
		if (Math.floor(Math.random() * 100) == 0) {
			_root.game.level.text(this.phrases[Math.floor(Math.random() * this.phrases.length)], _x, _y - this._height - 10);
		}
	}

}

