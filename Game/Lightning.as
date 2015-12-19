class Lightning {

	var start:Point;
	var end:Point
	var points_number:Number = 10;
	var points:Array;
	var mc:MovieClip;

	var lineStyles:Array = [
		{thickness: 1, colour: 0xFFFFFF},
		{thickness: 2, colour: 0x33C9FC}
	];
	var lineWeightMultiplier:Number = 8;
	var variance_amount:Number = 50;

	function Lightning(start:Point, end:Point) {
		this.start = start;
		this.end = end;
		
		points = [];
		points.push(start);
		for (var i = 1; i < points_number -1; i++) {
			var percentage = i / (points_number - 1);
			points.push(new Point(
				start.x + percentage * (end.x - start.x),
				start.y + percentage * (end.y - start.y)
			));
		}
		points.push(end);

		mc = Tools.newMovieClip();
		mc.container = this;
		mc.lineStyles = lineStyles;
		mc.lineWeightMultiplier = lineWeightMultiplier;
		mc.points = points;
		mc.variance_amount = variance_amount;
		mc.variance = function() {
			return Math.random() * variance_amount - variance_amount / 2;
		};
		mc.render = function() {
			this.clear();
			var points_adjusted = this.pointsAdjusted();
			for (var style in lineStyles) {
				this.lineStyle(lineStyles[style].thickness * lineWeightMultiplier, lineStyles[style].colour, 100, true);
				this.moveTo(points[0].x, points[0].y);
				for (var i = 1; i < points_adjusted.length; i++) {
					this.lineTo(points_adjusted[i].x, points_adjusted[i].y);
				}
			}
		};
		mc.pointsAdjusted = function() {
			var temp = [];
			temp.push(points[0]);
			for (var i = 1; i < points.length - 1; i++) {
				temp.push(new Point(
					points[i].x + this.variance(),
					points[i].y + this.variance()
				));
			}
			temp.push(points[points.length - 1]);
			return temp;
		}
		mc.render();

		mc.onEnterFrame = function() {
			this.lineWeightMultiplier -= 1;
			if (lineWeightMultiplier <= 0) {
				this.container.remove();
			} else {
				this.render();
			}
		};

	}

	function remove() {
		mc.removeMovieClip();
		delete this;
	}

}