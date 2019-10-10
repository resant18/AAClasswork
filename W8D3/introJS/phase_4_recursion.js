function range(start, end) {
  if (start === end) return [end];
  return [start].concat(range((start+1), end));
}

// console.log(range(1,4));

function sumRec(arr){

  if(arr.length === 1){
    return arr[0];
  };
  return arr[0]+sumRec(arr.slice(1,arr.length+1));

}

function exponent(base, exp){
  if (exp=== 0) {
    return 1;
  };

  return base* exponent(base, exp-1);
};


function fibonacci(n){
  if (n===1){
    return [0];
  }
  if (n===2){
    return[0,1];
  }
  
  newArr= fibonacci(n-1)
  return newArr.concat(newArr[newArr.length-1]+newArr[newArr.length-2]);

}

function deepDup(arr){
  let new_arr = []

  for(let i=0; i<arr.length;i++){
    if (Array.isArray(arr[i])=== true){
      new_arr.push(deepDup(arr[i]));
    } else{
      new_arr.push(arr[i]);
    }
  }

  return new_arr;
}

function myFlatten(arr){
  let result=[];

  for (let i = 0; i < arr.length; i++) {
    if (Array.isArray(arr[i]) === true) {
      result=result.concat(myFlatten(arr[i]));
    }else{
      result.push(arr[i]);
    }
  }
  return result;
}

console.log(myFlatten([1,[2,3],["a",'b']]));