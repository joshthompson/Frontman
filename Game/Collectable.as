class Collectable extends Sprite {

	var value:Number = 25;
	var ys:Number;
	var yy:Number = 5;

	function Collectable() {
		this.ys = this._y;
	}

	function onLoad() {
		Game.register("collectables", this);
		Game.register("level_objects", this);
	}

	function setValue(value) {
		this.value = value;
	}

	function collect(collector:Player) {
		Game.addPoints(this.value, _x, _y);
		if (typeof this["collectExtra"] == "function") {
			this["collectExtra"]();
		}
		this.remove();
	}

	function onEnterFrame() {
		this.hover();
	}

	function hover() {
		_y += yy;
		if (_y > ys) {
			yy--;
		} else if (_y < ys) {
			yy++;
		}
	}

}