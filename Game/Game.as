class Game {

	var party:PlayerParty;
	var level:Level;
	var gui:GUI;
	var song:Song;
	var frame:Number = 0;
	var score:Number = 0;

	public static var depths:Object = {
		level: 50,
		gui: 100
	}

	// Game logic
	var game_flags:Object = {};
	var level_flags:Object = {};

	function init() {

		// Setup GUI
		this.setupGUI();

		// Setup Level
		if (_root.debug_mode) {
			this.setupLevel(_root.debug_level, _root.debug_characters);
		} else {
			this.setupLevel("test_01", ["jeff"]);
		}

		// Start song
		this.song = Song.init("Song01", this.party);
		
	}

	function onEnterFrame() {
		song.updateVolumes();
		this.party.clean();
		this.level.togglePartyCheck();
		this.frame++;
	}

	function setupLevel(level_name:String, starting_players:Array) {

		// Remove old stuff
		this.reset();
		if (this.level) {
			this.level.removeMovieClip();
		}
		if (this.party) {
			this.party.remove();
		}

		// Load level
		this.level = Level.create(level_name, this);

		// Setup party and players
		this.party = this.level.setupParty(starting_players);
		this.party.fullHealth();
		this.party.clean();

		// Setup song
		if (this.song) {
			this.song.updateVolumes();
			this.song.setParty(this.party);
			// this.song.start(); // Start / Restart - Doesn't work - Do we want it to work this way?
		}

	}

	function setupGUI() {
		this.gui = Tools.newMovieClip("gui", 0, 0, _root);
		this.gui.swapDepths(Game.depths.gui);
		this.gui.setGame(this);
	}

	function reset() {
		this.level_flags = {};
	}

	function checkAllDead() {
		if (this.party.getNumberOfAliveCharacters() == 0) {
			this.level.gameOver();
		}
	}

	function gameOver() {
		this.level.gameOver();
	}

	function levelComplete() {
		this.level.complete();
	}

	function game_flag(key, value) {
		return typeof value == "undefined" ? this.game_flags[key] : this.game_flags[key] = value;
	}

	function level_flag(key, value) {
		return typeof value == "undefined" ? this.level_flags[key] : this.level_flags[key] = value;
	}

	static function register(type:String, mc:GameObject) {
		_root.game.level.object_lists[type][mc._name] = mc;
		mc.registers[type] = type;
	}

	static function unregister(mc:GameObject, type) {
		if (typeof type == "undefined") {
			for (var i in mc.registers) {
				delete _root.game.level.object_lists[mc.registers[i]][mc._name];
			}
		} else {
			delete _root.game.level.object_lists[type][mc._name];
			delete mc.registers[type];
		}
		
	}

	static function get(type:String) {
		return _root.game.level.object_lists[type];
	}

	static function checkKey(key) {
		switch (key) {
			case "left": return Key.isDown(Key.LEFT) || Key.isDown(65);
			case "right": return Key.isDown(Key.RIGHT) || Key.isDown(68);
			case "up": return Key.isDown(Key.UP) || Key.isDown(87);
			case "down": return Key.isDown(Key.DOWN) || Key.isDown(83);
			case "space": return Key.isDown(Key.SPACE);
			default: return false;
		}
	}

	static function addPoints(points:Number, x, y) {
		var score_start = _root.game.score;
		_root.game.score = Math.max(0, _root.game.score + points);
		if (score_start != _root.game.score) {
			_root.game.gui.pulseScore();
		}
		if (typeof x == "number" && typeof y == "number") {
			_root.game.level.text(points > 0 ? "+" + points : points, x, y);
		}
		return _root.game.score;
	}

	static function getLevel() {
		return _root.game.level;
	}

}