class Levels.Level01 extends Level {

	function next() {
		if (game_over) {
			game.setupLevel("level_01", this.game.party.currentPlayers());
		} else if (completed) {
			game.setupLevel("level_02", this.game.party.currentPlayers());
		}
	}

}