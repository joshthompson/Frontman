class Dial extends MovieClip {

	var instrument:String;
	var dial_min:Number = -140;
	var dial_max:Number = 135;
	var target_rotation:Number = 135;

	function Dial() {
		instrument = _name.substr(5);
	}

	function onEnterFrame() {
		this.update();
	}

	function update() {
		var stats = _root.game.party.getByInstrument(instrument).mc;
		var percentage = stats.hp / stats.max_hp;
		this["cover"]._visible = stats.alive ? false : true;
		this["warning"]._visible = stats.alive && percentage < 0.4 ? true : false;
		this.target_rotation = percentage * (dial_max - dial_min) + dial_min;

		if (Math.abs(this["dial"]._rotation - this.target_rotation) < 2) {
			this["dial"]._rotation = this.target_rotation;
		} else if (this["dial"]._rotation != this.target_rotation) {
			this["dial"]._rotation = (this["dial"]._rotation + this.target_rotation) / 2;
		}
	}

}