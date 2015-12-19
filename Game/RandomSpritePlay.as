class RandomSpritePlay extends Sprite {

	function onLoad() {
		Tools.gotoRandomFrame(this);
		this.play();
	}

}