class Tools {

	public static var mcn:Number = 0;

	public static function newMovieClip(type:String, x:Number, y:Number, target_mc:MovieClip, name) {
		Tools.mcn++;
		var target_mc = typeof target_mc == "undefined" ? _root : target_mc;
		var mc_name = typeof name == "string" ? name : (type ? type : "empty") + "_" + Tools.mcn;
		if (type) {
			var new_mc = target_mc.attachMovie(type, mc_name, target_mc.getNextHighestDepth());
		} else {
			var new_mc = target_mc.createEmptyMovieClip(mc_name, target_mc.getNextHighestDepth());
		}
		new_mc._x = x;
		new_mc._y = y;
		return new_mc;
	}

	public static function gotoRandomFrame(mc:MovieClip) {
		var frame = Math.ceil(Math.random() * mc._totalFrames);
		mc.gotoAndPlay(frame);
	}

	public static function shuffleArray(input:Array) {
		for (var i = input.length - 1; i >= 0; i--) {
			var randomIndex = Math.floor(Math.random() * (i + 1));
			var itemAtIndex = input[randomIndex];
			input[randomIndex] = input[i];
			input[i] = itemAtIndex;
		}
	}

}