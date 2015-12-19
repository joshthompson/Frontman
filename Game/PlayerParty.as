class PlayerParty {

	var party_order:Array;

	var party:Object;

	private function setupParty() {
		this.party = {
			jeff: {
				unlocked: false,
				max_hp: 11,
				hp: 11,
				alive: false,
				mc: null,
				instrument: "guitar"
			},
			claire: {
				unlocked: false,
				max_hp: 11,
				hp: 11,
				alive: false,
				mc: null,
				instrument: "bass"
			},
			josh: {
				unlocked: false,
				max_hp: 11,
				hp: 11,
				alive: false,
				mc: null,
				instrument: "drums"
			},
			matilda: {
				unlocked: false,
				max_hp: 11,
				hp: 11,
				alive: false,
				mc: null,
				instrument: "vocals"
			}
		};
	}

	function PlayerParty() {
		party_order = ["jeff", "claire", "josh", "matilda"];
		setupParty();
		for (var i in party) {
			party[i].alive = false;
			party[i].unlocked = false;
		}
	}

	function getByInstrument(instrument) {
		switch (instrument) {
			case "guitar": return this.party.jeff;
			case "bass": return this.party.claire;
			case "drums": return this.party.josh;
			case "vocals": return this.party.matilda;
			default: return null;
		}
	}

	function getParty() {
		return this.party;
	}

	function getNames():Array {
		var names = [];
		for (var i in party) {
			if (party[i].unlocked && party[i].alive) {
				names.push(i);
			}
		}
		return names;
	}

	function changeFrontman(order) {
		if (getNumberOfAliveCharacters() > 1 && order != 0) {
			var before = getSelected();
			// Shift array
			if (order > 0) {
				party_order = party_order.splice(1).concat([party_order[0]]);
			} else {
				var last_element = party_order.pop();
				party_order = [last_element].concat(party_order);
			}
			// Set positions
			setPositions();
			// Check it changed
			if (before == getSelected()) {
				changeFrontman(order);
			}

		}
	}

	function setPositions() {
		var j = 0;

		for (var i = 0; i < party_order.length; i++) {
			if (party[party_order[i]].alive && party[party_order[i]].unlocked) {
				party[party_order[i]].mc.setPosition(j);
				j++;
			}
		}
	}

	function getSelected() {
		for (var i in party_order) {
			if (party[party_order[i]].alive && party[party_order[i]].unlocked) {
				return party_order[i];
			}
		}
	}

	function getNumberOfAliveCharacters() {
		var n = 0;
		for (var i in party_order) {
			if (party[party_order[i]].alive && party[party_order[i]].unlocked) {
				n++;
			}
		}
		return n;
	}

	function add(name, container) {
		if (!this.party[name].alive) {
			var mc = Tools.newMovieClip(name, -50, 300, container);
			this.party[name].yy = 10;
			this.party[name].alive = true;
			this.party[name].unlocked = true;
			this.party[name].mc = mc;
			return mc;
		}
		return false;
	}

	function addByInstrument(instrument, container) {
		switch (instrument) {
			case "guitar": return this.add("jeff", container);
			case "bass": return this.add("claire", container);
			case "drums": return this.add("josh", container);
			case "vocals": return this.add("matilda", container);
		}
	}

	function setParty(preset, container) {
		for (var i in preset) {
			var mc = this.add(preset[i], container);
		}
		this.setPositions();
	}

	function currentPlayers():Array {
		var ret = [];
		for (var i in party) {
			if (party[i].unlocked) {
				ret.push(i);
			}
		}
		return ret;
	}

	function fullHealth() {
		for (var i in party_order) {
			if (party[party_order[i]].alive && party[party_order[i]].unlocked) {
				party[party_order[i]].mc.hp = party[party_order[i]].mc.max_hp;
			}
		}
	}

	function remove() {
		for (var i in party) {
			party[i].mc.removeMovieClip();
		}
		delete this;
	}

	function clean() {
		for (var i in this.party) {
			switch (i) {
				case "jeff": continue;
				case "claire": continue;
				case "josh": continue;
				case "matilda": continue;
				default:
					delete this.party[i];
					continue;
			}
		}
	}

}