class Clock {
  constructor() {
    let date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    this.printTime();
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
  }

  _tick() {
    this.seconds = this.seconds + 1;
    this.printTime();
  }
}

//

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if ( numsLeft > 0) {
    reader.question("Please enter a number: ", function(answer1) {
      let num = parseInt(answer1);
      sum = num + sum;
      console.log(sum);
      numsLeft = numsLeft - 1;
      addNumbers(sum, numsLeft, completionCallback);
    });
  } 
  else if (numsLeft === 0) {
    completionCallback(sum);
  }
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} larger than ${el2}? `, function(answer) {
    if (answer === "yes") {
      callback(true);
    } 
    else if (answer === "no") {
      callback(false);
    }
  });
}

// askIfGreaterThan(5, 25, response => {
//   let comparison = (5 > 25);
//   console.log(`Response: ${comparison === response}`)})

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {

  if ( i < arr.length - 1 ) {
      askIfGreaterThan(arr[i], arr[i + 1], response => {
        if (response) {
          [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
          if (madeAnySwaps === false) madeAnySwaps = true;
        }
        innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
      }
    );   
  }
  if (arr.length - 1 === i) {
    outerBubbleSortLoop(madeAnySwaps);
  }
}

// innerBubbleSortLoop([1, 3, 6, 2, 8, 7, 4], 0, false, () => console.log('in outer bubble sort'));

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps === true) {
      madeAnySwaps = false;
      innerBubbleSortLoop(arr, 0, madeAnySwaps, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }
  outerBubbleSortLoop(true);
}

// absurdBubbleSort([4, 3, 2, 5], function (arr) {
//   console.log("Sorted array: " + JSON.stringify(arr));
//   reader.close();
// });

Function.prototype.myBind = function(context) {
  return () => {
    this.apply.apply(this, [context]);
  }
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