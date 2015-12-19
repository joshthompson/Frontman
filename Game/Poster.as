class Poster extends RandomSprite {

	function Poster() {
		_alpha = 80;

		if (Math.random() * 8 < 1) {
			_rotation = Math.random() * 30 - 15;
		}
	}

}