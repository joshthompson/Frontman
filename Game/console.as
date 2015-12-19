class console {

	static function log() {
		trace(arguments.join(", "));
	}

	static function object(object, id) {
		var output = [(id ? id : object) + ":"];
		for (var i in object) {
			output.push(" - " + i + ": " + object[i]);
		}
		for (var i = 0; i < output.length; i++) {
			trace(output[i])
		}
	}

	static function clear() {
		for (var i = 0; i < 50; i++) {
			trace("");
		}
	}

}