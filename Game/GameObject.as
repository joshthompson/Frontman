class GameObject extends MovieClip {

	var registers:Object = {};

	public function remove() {
		Game.unregister(this);
		this.swapDepths(0);
		this.removeMovieClip();
	}

};