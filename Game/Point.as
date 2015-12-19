class Point {

	var x:Number = 0;
	var y:Number = 0;

	function Point(x:Number, y:Number) {
		this.x = x;
		this.y = y;
	}

	function distance(p) {
		var xd = x - p.x;
		var yd = y - p.y;
		return Math.sqrt(xd * xd + yd * yd);
	}

	function angle(p) {
		return Math.atan2(x - p.x, y - p.y);
	}

	function toString() {
		return "[" + x + ", " + y + "]";
	}

}