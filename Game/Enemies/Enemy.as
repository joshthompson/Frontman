class Enemies.Enemy extends CharacterSprite {

	var projectile_type:String = "Projectile";
	var character_type:String = "enemy";
	var point_value:Number = 50;

	function onLoad() {
		Game.register("characters", this);
		Game.register("enemies", this);
		Game.register("level_objects", this);
	}

	function onEnterFrame() {
		this.moveMe();
		this.checkCollision();
	}

	function die() {
		if (this.alive) {
			this.alive = false;
			this.fixed = false;
			this.solid = false;
			animate("dead");
			this.yy = 15;
			this.rr = 2;
			Game.addPoints(this.point_value, _x, _y);
		}
	}
	
}
