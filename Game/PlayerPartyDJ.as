class PlayerPartyDJ extends PlayerParty {

	private function setupParty() {
		this.party = {
			vicki: {
				unlocked: false,
				max_hp: 11,
				hp: 11,
				alive: false,
				mc: null,
				instrument: "decks"
			}
		};
	}

	function PlayerPartyDJ() {
		party_order = ["vicki"];
		setupParty();
		for (var i in party) {
			party[i].alive = false;
			party[i].unlocked = false;
		}
	}

}