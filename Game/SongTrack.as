class SongTrack {

	// Properties
	var song:Song;
	var instrument:String;
	var bars:Number = 1;
	var segments:Array = [];
	var volume:Number = 0;

	// States
	var sound:SoundPlayer = null;
	var current_segment:Number = 0;

	// Init
	function SongTrack(song:Song, instrument:String, bars:Number, segments:Array) {
		this.song = song;
		this.instrument = instrument;
		this.bars = bars;
		this.segments = segments;
	}

	function play() {
		var sound_id = song.id + "_" + song.bpm + "_" + this.segments[this.current_segment];
		// Setup loop
		this.updateVolume();
		this.sound = new SoundPlayer(sound_id, this.volume, function() {
			this["SongTrack"].playNextSegment();
			this.remove();
		});
		this.sound["SongTrack"] = this;
	}

	function playNextSegment() {
		this.current_segment = (this.current_segment + 1) % this.segments.length;
		this.play();
	}

	function updateVolume() {
		var stats = this.song.party.getByInstrument(this.instrument);
		this.setVolume(stats.alive && stats.unlocked ? Math.round(100 * stats.hp / stats.max_hp) : 0);
	}

	function setVolume(vol:Number) {
		this.volume = vol;
		if (this.sound) {
			this.sound.setVolume(this.volume);
		}
	}

}