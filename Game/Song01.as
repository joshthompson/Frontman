class Song01 extends Song {

	var party:PlayerParty;

	function Song01(party:PlayerParty) {

		this.name = "Your Bedroom Is Just The Start";
		this.id = "song01";
		this.bpm = 180;
		this.party = party;

		this.tracks.guitar = new SongTrack(this, "guitar", 1, ["guitar01", "guitar01", "guitar01", "guitar02", "guitar01", "guitar03", "guitar01", "guitar04"]);
		this.tracks.bass = new SongTrack(this, "bass", 1, ["bass01", "bass01", "bass02", "bass02"]);
		this.tracks.drums = new SongTrack(this, "drums", 2, ["drums01", "drums02"]);
		this.tracks.vocals = new SongTrack(this, "vocals", 1, ["vocals01", "vocals02", "vocals03", "vocals02"]);

		this.start();

	}

}