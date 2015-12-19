class RandomSprite extends Sprite {

	function onLoad() {
		Tools.gotoRandomFrame(this);
		this.stop();
	}

}