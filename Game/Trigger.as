class Trigger extends GameObject {

	var triggered:Boolean = false;

	function Trigger() {
		Game.register("level_objects", this);
		_visible = false;
	}

	function onEnterFrame() {
		if (!this.triggered) {
			for (var i in Game.get("players")) {
				if (Game.get("players")[i].fixed && this.hitTest(Game.get("players")[i])) {
					_root.game.levelComplete();
					this.triggered = true;
					break;
				}
			}
		}
	}

}