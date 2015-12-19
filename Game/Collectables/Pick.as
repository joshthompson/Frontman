class Collectables.Pick extends Collectable {

	var guitar_sounds:Array = [
	//	"C2", "D2", "E2", "F2", "G2", "A2", "B2", "C3"
		"C2", "E2", "G2", "C3", "G2", "E2", "F2", "D2", "G2"
	];

	function collectExtra() {
// Remove sound for now - need to find new one
//		var key = _root.game.level_flag("next_pick_sound");
//		key = key ? key : 0;
//		new SoundPlayer(this.guitar_sounds[key], 100);
//		_root.game.level_flag("next_pick_sound", (key + 1) % this.guitar_sounds.length);
	}

}