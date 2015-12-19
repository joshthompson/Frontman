class GameText extends LevelObject {
	
	var text:String = "";
	var mode:String;
	var speed:Number = 2;

	function GameText() {
		_alpha = 0;
		mode = "fade_in";
	}

	function onEnterFrame() {
		if (mode == "fade_in") {
			_alpha += 10;
			if (_alpha >= 100) {
				mode = "fade_out";
			}
		} else {
			_alpha -= 5;
			if (_alpha <= 0) {
				this.remove();
			}
		}
		_y -= speed;
	}

}