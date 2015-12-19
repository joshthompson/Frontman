class Song {

	static function init(song, party):Song {
		switch (song) {
			case "Song01": return new Song01(party);
			default: return null;
		}
	}

	var name:String;
	var id:String;
	var bpm:Number;
	var party:PlayerParty;

	var counted_in:Boolean = false;

	var tracks:Object = {
		guitar: false,
		bass: false,
		drums: false,
		vocals: false
	};

	function start() {
		if (counted_in) {
			for (var i in tracks) {
				tracks[i].updateVolume();
				tracks[i].play();
			}
		} else {
			var count_in = new SoundPlayer("count_in_" + this.bpm, 100, function() {
				this["song"].counted_in = true;
				this["song"].start();
			});
			count_in["song"] = this;
		}
	}

	function setParty(party:PlayerParty) {
		this.party = party;
	}

	function updateVolumes() {
		for (var i in tracks) {
			tracks[i].updateVolume();
		}
	}

	function setVolume(track:String, vol:Number) {
		if (typeof this.tracks[track] == "object") {
			this.tracks[track].setVolume(vol);
		}
	}

}