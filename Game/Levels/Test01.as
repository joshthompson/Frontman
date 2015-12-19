class Levels.Test01 extends Level {

	function setupParty() {
		this.party = new PlayerPartyDJ();
		this.party.setParty(["vicki"], this);
		return this.party;
	}

}