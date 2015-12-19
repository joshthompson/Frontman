class Level extends MovieClip {

	static function create(name, game) {
		var level = Tools.newMovieClip(name, 0, 0, _root);
		level.swapDepths(Game.depths.level);
		level.setGame(game);
		level.setName(name);
		return level;
	}

	var game:Game;
	var party:PlayerParty;
	var completed:Boolean = false;
	var game_over:Boolean = false;
	var name:String;
	var speed:Number = 10;
	private var gravity:Number = 3;

	// Object Lists
	var object_lists:Object = {
		solid_objects: {},
		level_objects: {},
		collectables: {},
		characters: {},
		enemies: {},
		players: {},
		tokens: {}
	};

	function Level() {
		this.anchor();
	}

	function setGame(game:Game) {
		this.game = game;
	}

	function setName(name:String) {
		this.name = name;
	}

	function onEnterFrame() {
		// Fade out
		if (_alpha > 0 && (this.completed || this.game_over)) {
			_alpha -= 5;
		}
		if (_alpha <= 0) {
			this.next();
		}

		// Move level
		this.moveLevel();
	}

	function moveLevel() {
		// Move all level objects
		for (var i in Game.get("level_objects")) {
			Game.get("level_objects")[i]._x -= this.speed;
		}
	}

	function move(v) {
		_x += v;
	}

	function anchor() {
		// this._x -= this.anchor._x;
		// this._y -= this.anchor._y;
		// this.anchor.swapDepths(0);
		// this.anchor.removeMovieClip();
	}


	function complete() {
		this.completed = true;
	}

	function gameOver() {
		this.game_over = true;
	}

	function next() {
		// Should be overriden by sub class
		game.setupLevel(this.name, this.game.party.currentPlayers()); // Restarts current level for game over and complete level
	}

	function text(text, x, y) {
		var text_mc = Tools.newMovieClip("game_text", x, y, this);
		text_mc.text = text;
	}

	function toJSON() {
		return {
			background: [],
			foreground: [],
			fixed: []
		};
	}

	var right_down:Boolean = false;
	var left_down:Boolean = false;
	function togglePartyCheck() {
		// Right
		if (Game.checkKey("right") && !this.right_down) {
			game.party.changeFrontman(1);
			this.right_down = true;
		} else if (!Game.checkKey("right")) {
			this.right_down = false;
		}

		// Left
		if (Game.checkKey("left") && !this.left_down) {
			game.party.changeFrontman(-1);
			this.left_down = true;
		} else if (!Game.checkKey("left")) {
			this.left_down = false;
		}
	}

	public function getGravity():Number {
		return this.gravity;
	}

	public function setupParty(starting_players) {
		this.party = new PlayerParty();
		this.party.setParty(starting_players, this);
		return this.party;
	}
	
}