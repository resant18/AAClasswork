Array.prototype.bubbleSort = function () {

  let sorted = false;

  while (sorted === false) {
    sorted = true;

    for (let i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i + 1]) {
        thirdV = this[i];
        this[i] = this[i + 1];
        this[i + 1] = thirdV;
        sorted = false;
      }
    }
  }
  return this;
};

//console.log([2, 3, 2, 1, 5, 4].bubbleSort());



String.prototype.substrings = function () {
  let result = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length + 1; j++) {
      result.push(this.slice(i, j));
    }
  }
  return result;
};

console.log("Testing".substrings());