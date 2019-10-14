function sum(...args) {
    let sum = 0;
    for (el of args) {
        sum += el;
    }
    return sum;
}

console.log(sum(1, 2, 3, 4) === 10);
console.log(sum(1, 2, 3, 4, 5) === 15);

/*------------------------------------------------------------------------------------*/
// Method 1: With Arguments
Function.prototype.myBind = function (ctx) {
    const that = this;
    // this argument is myBind's argument (the value inside the first bracket)
    // after calling code line 24, this argument is not cariied over to
    // the next (anonymous) function.
    const bindArgs = Array.from(arguments).slice(1);
    return function () {
        const callArgs = Array.from(arguments);
        return that.apply(ctx, bindArgs.concat(callArgs));
    };
};

// Method 2: With ...Rest Operator
// Function.prototype.myBind = (function(context, ...bindArgs) {
//     // ES6
//     return (...callArgs) => this.call(context, ...bindArgs, ...callArgs);    
// })

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

//markov.says.myBind(bindArgs)(callArgs)

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
// context is pavlov
// bind are "meow", "Kush"
markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
// context is pavlov
// bind = none
// call = "meow", "a tree"
markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
// context is pavlov
// bind = pavlov, "meow"
// time = "Markov"
markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

/* Currying Functional Programming */
// Method 1: Function Prototype
Function.prototype.curry = function (numArgs) {    
    const numbers = [];   
    const func = this;
    return function currySum(num) {
        numbers.push(num);
        if (numbers.length === numArgs) {
            return func(...numbers);
        } else {
            return currySum;
        }
    }    
}

function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
}

let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30
console.log(f1);

// or more briefly:
console.log(sumThree.curry(3)(4)(20)(6)); // == 30

// Method 2: Regular Function
function curriedSum(numArgs) {
    let count = 0;
    let sum = 0;

    return function currySum(num) {
        count++;
        if (count === numArgs) {
            return sum + num;
        } else {
            sum += num;
            return currySum;
        }
    }
}



const sum2 = curriedSum(4);
console.log(sum2(5)(30)(20)(1)); // => 56