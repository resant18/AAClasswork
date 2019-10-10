function Cat(name, owner) {
    this.name = name;
    this.owner = owner;
}

Cat.prototype.cuteStatement = () => console.log(`${this.owner} loves ${this.name}`);

// Cat.prototype.cuteStatement = function() {
//     console.log(`${this.owner} loves ${this.name}`);
// }

const kitty = new Cat("Kitty", "Sanrio");
kitty.cuteStatement();

// kittyCuteStatement = kitty.cuteStatement.bind(Cat);
// kittyCuteStatement();