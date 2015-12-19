class Collectables.Token extends Collectable {
	
	var ys:Number;
	var yy:Number = 5;
	var mode:String;

	function Token() {
		this.ys = this._y;
		this.selectMode();
		this.value = 250;
		Game.register("tokens", this);
	}

	function onEnterFrame() {
		// Select mode
		if (typeof mode == "undefined") {
			this.selectMode();
		}

		// Change
		this.gotoAndStop(this.mode);

		// Hover
		this.hover();
	}

	function selectMode() {
		// Load possible Modes
		var possible_modes = [];
		for (var i in _root.game.party.getParty()) {
			if (!_root.game.party.getParty()[i].alive) {
				possible_modes.push(_root.game.party.getParty()[i].instrument);
			}
		}
		if (possible_modes.length) {
			this.mode = possible_modes[Math.floor(Math.random() * possible_modes.length)];
		} else {
			this.mode = "heart";
		}
	}

	function collect(collector:Player) {
		Game.addPoints(this.value, _x, _y);
		if (this.mode == "heart") {
			collector.hp = collector.max_hp;
		} else {
			var new_character = _root.game.party.addByInstrument(this.mode, _root.game.level);
			new_character.sound("shout");
		}
		this.swapDepths(0);
		this.removeMovieClip();
	}

}