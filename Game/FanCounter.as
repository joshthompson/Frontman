class FanCounter extends MovieClip {

	var ss:Number = 0;
	var scale:Number = 100;

	function pulse() {
		ss = 3;
	}

	function onEnterFrame() {
		if (this.ss != 0 || scale != 100) {
			scale += ss;
			ss--;
			if (scale <= 100) {
				ss = 0;
				scale = 100;
			}
			_xscale = _yscale = scale;
		}
	}

}