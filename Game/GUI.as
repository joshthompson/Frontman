class GUI extends MovieClip {

	var game:Game;
	var score_increase:Number = 0;
	var score_increment:Number = 7;
	var score_display_length:Number = 6;

	function setGame(game:Game) {
		this.game = game;
		this.score_increase = game.score;
		this.scoreIncrease();
	}

	function onEnterFrame() {
		this.scoreIncrease();
		this.renderCharacterIcons();
	}

	function scoreIncrease() {
		this.score_increase = Math.min(this.game.score, this.game.score > this.score_increase ? this.score_increase + this.score_increment : this.game.score);
		this["fan_counter"].score_zero = this.score_increase;
		for (var i = 0; i < this.score_display_length - (score_increase + "").length; i++) {
			this["fan_counter"].score_zero = "0" + this["fan_counter"].score_zero;
		}
	}

	function renderCharacterIcons() {
		var characters = game.party.getParty();
		for (var n in characters) {
			if (characters[n].unlocked && characters[n].alive) {
				this["lives"][n].gotoAndStop("alive");
			} else if (characters[n].unlocked && !characters[n].alive) {
				this["lives"][n].gotoAndStop("dead");
			} else {
				this["lives"][n].gotoAndStop("locked");
			}
		}
		var target_x = this["lives"][game.party.getSelected()]._x;
		if (this["lives"].selected._x < target_x + 5 && this["lives"].selected._x > target_x - 5) {
			this["lives"].selected._x = target_x;
		} else {
			this["lives"].selected._x -= (this["lives"].selected._x - target_x) / 2;
		}
	}

	function pulseScore() {
		this["fan_counter"].pulse();
	}

}