Function.prototype.myBind = function (context) {
  
  // return () => { return this.apply(context); } //ES6 'this' is function scoped
  // return () => this.apply(context);  //ES6 'this' is function scoped

  const that = this; //ES5 'this' is default scoped or globally scoped, so have to assign that = this to change scoping
  return function() { return that.apply(context); } //needs to return 

}



class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

const turnOn = function () {
  console.log("Turning on " + this.name);
};

const lamp = new Lamp();

turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

boundTurnOn(); // should say "Turning on a lamp"
myBoundTurnOn(); // should say "Turning on a lamp"