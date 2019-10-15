// Method 1: Using Surrogate
Function.prototype.inherits2 = function(parent) {
    const Surrogate = function() {};

    Surrogate.prototype = parent.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
}

// Method 2: Using Object.create
Function.prototype.inherits = function (parent) {  
    this.prototype = Object.create(parent.prototype);  
    this.prototype.constructor = this;
}

function MovingObject() { }
MovingObject.prototype.move = function() {
    console.log(`Object can move`);
}

function Ship() { }
Ship.inherits(MovingObject);
Ship.prototype.attack = function () {
    console.log(`Ship can attack`);
}

function Asteroid() { }
Asteroid.inherits(MovingObject);
Asteroid.prototype.crush = function () {
    console.log("Asteroid can crush");
}

// Test
movedObj = new MovingObject();
movedObj.move(); // print I'm moving

ship1 = new Ship();
ship1.move();
ship1.attack(); // print Ship can attack
//ship1.crush() // will throw error

asteroid1 = new Asteroid();
asteroid1.move();
asteroid1.crush();
//asteroid1.attack(); //will error
