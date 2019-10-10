Array.prototype.myEach = function(callback){

  for(let i=0; i<this.length; i++){
    callback(this[i]);
  }
  return undefined;
};

function test(variable) {
  return variable * 2;
}

Array.prototype.myMap = function(callback){
  let newArr = [];
  
  // this is closure
  // function(el) {....} here is a callback in myEach function above
  this.myEach(function(el) {
    newArr.push(callback(el));
  });  
  return newArr;
};

x = [1,2,3].myMap(test);

Array.prototype.myReduce = function(callback, initial=undefined){
  let sum;
  if (initial === undefined) {
    sum = 0;
  } else {
    sum = initial;
  }

  this.myEach(function (el) {
    sum += callback(el);
  });

  return sum;
};

//console.log([1, 2, 3].myReduce(test, 10));


