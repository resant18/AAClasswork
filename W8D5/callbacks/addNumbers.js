const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  
  if (numsLeft > 0) {
    reader.question("Input a number:", function (number) {
      sum += parseInt(number);
      console.log(sum);
      addNumbers(sum, numsLeft - 1, completionCallback);
    });

    
  }

  if (numsLeft === 0) completionCallback(sum);
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));