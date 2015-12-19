import flash.filters.GlowFilter;

class Obstacle extends GameObject {

	var state:String = "good";
	var penalty:Number = 10;

	function onLoad() {
		// Game.register("solid_objects", this);
		Game.register("level_objects", this);
		this.gotoAndStop(state);
		this.filters = [new GlowFilter(0xCC0000, 0.5, 10, 10, 2, 3)];
	}

	function trip() {
		this.filters = [];
		this.gotoAndStop(state = "bad");
	}

	function onEnterFrame() {
		if (state == "good") {
			for (var i in Game.get("players")) {
				if (Game.get("players")[i].fixed && this.hitTest(Game.get("players")[i]._x, Game.get("players")[i]._y)) {
					trip();
					Game.get("players")[i].trip();
					Game.addPoints(-this.penalty, _x, _y);
				}
			}
		}
	}

}