
Array.prototype.uniq = function(){
  let new_arr=[];
  for(let i=0; i<this.length; i++){
    if (new_arr.includes(this[i])){
      continue;
    }else {
      new_arr.push(this[i]);
    }
  }
  return new_arr;
};
// console.log([1,2,3,3,4,5,5].uniq());

Array.prototype.twoSum = function(target){
  let hash = {};
  let indices = [];

  for (let i = 0; i < this.length; i++) {
    let remainder = target - this[i];
    if (hash[remainder] === undefined) {
      hash[this[i]] = i;
    } else {
      indices.push([hash[remainder], i]);
    }
  }

  return indices;
};
//console.log([1, 2, 3, 4, 5].twoSum(6));

Array.prototype.transpose = function () {
  let transposed = [];

  for (let i = 0; i < this.length; i++) {
    transposed.push([]);
  }

  for (let i=0; i < this.length; i++) {
    for (let j = 0; j < this[i].length; j++) {
      transposed[j].push(this[i][j]);
    }
  }
  return transposed;
};

console.log([[1, 2, 3], [3, 4, 5],[6,7,8]].transpose());
