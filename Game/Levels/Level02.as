class Levels.Level02 extends Level {

	function next() {
		if (game_over) {
			game.setupLevel("level_02", this.game.party.currentPlayers());
		} else if (completed) {
			game.setupLevel("level_03", ["jeff", "claire", "josh", "matilda"]);
		}
	}

}