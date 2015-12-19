class Sprite extends GameObject {

	var fixed = false;
	var solid:Boolean = true;
	var yy:Number = 0;
	var xx:Number = 0;
	var rr:Number = 0;
	var locked:Boolean = false;
	var lock_animation:Boolean = false;
	var target_scale:Number = 100;
	var bounciness:Number = 0;

	function Sprite() {
		_parent.objects[_name] = this;
	}

	function moveMe() {
		if (!locked) {
			// Rotation
			_rotation += rr;
			// Horizontal
			_x += xx;
			// Vertical
			if (!fixed) {
				_y -= yy;
				yy -= Game.getLevel().getGravity();
			}
		}
	}

	function adjustScale() {
		var current_scale = this._xscale = this._yscale;

		if (Math.abs(current_scale - this.target_scale) < 2) {
			this._xscale = this._yscale = this.target_scale;
		} else if (current_scale != this.target_scale) {
			this._xscale = this._yscale = (current_scale + this.target_scale) / 2;
		}

	}

	function checkCollision() {
		if (!solid) {
			fixed = false;
			return false;
		}
		if (fixed) {
			// Check we're still fixed to platform
			if (!fixed.hitTest(_x, _y + 0.5)) {
				fixed = false;
			}
		} else {
			// Check if we connect to new platform
			if (yy < 0) {
				var hitarea_mc = typeof this["hitarea"] == "object" ? this["hitarea"] : this;
				for (var i in Game.get("solid_objects")) {
					if (Game.get("solid_objects")[i].hitTest(hitarea_mc) && _y + yy < Game.get("solid_objects")[i]._y) {
						if (this.bounciness == 0 || Math.abs(this.yy) < 1.5) {
							fixed = Game.get("solid_objects")[i];
							animate("run");
							yy = 0;
							_y = Game.get("solid_objects")[i]._y;
						} else {
							this.yy *= -this.bounciness;
							_y = Game.get("solid_objects")[i]._y;
						}
					}
				}
			}
		}
	}

	function action(action:String) {
		if (typeof this[action] == "function") {
			this[action]();
		}
	}

	function animate(frame, lock) {
		if (!this.lock_animation) {
			this.gotoAndStop(frame);
			if (lock === true) {
				this.lock_animation = true;
			}
		}
	}

	function unlockAnimation() {
		this.lock_animation = false;
	}

	function sound(sound, vol) {
		if (typeof this["sound_effects"] == "object" && typeof this["sound_effects"][sound] == "object") {
			var sound_id = this["sound_effects"][sound][Math.floor(Math.random() * this["sound_effects"][sound].length)];
			var s = new SoundPlayer(sound_id, typeof vol == "number" ? vol : 100);
		}
	}

}
