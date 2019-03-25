
var sum = function() {

  let summation = 0;
  for(let i = 0; i < arguments.length; i++ ) {
    summation += arguments[i];
  }
  return summation;
};


// console.log(sum(1, 2, 3));

var sum2 = function (...args) {

  let summation = 0;
  for (let i = 0; i < args.length; i++) {
    summation += args[i];
  }
  return summation;
};

// 
// console.log(sum2(1, 2, 3));


Function.prototype.myBind = function(context) {
  var args = Array.prototype.slice.call(arguments, 1);
  that = this;
  return function() {
    args = args.concat(Array.prototype.slice.call(arguments));
    that.apply(context, args);
  };
};

var curriedSum = function (numArgs) {
  var numbers = [];
  var _curriedSum = function(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      let summation = 0;
      for (let i = 0; i < numbers.length; i++) {
        summation += numbers[i];
      }
      return summation;
    } else {
      return _curriedSum;
    }
  };
  return _curriedSum;
};

const sum3 = curriedSum(4);
console.log(sum3(5)(30)(20)(1));



Function.prototype.curry = function(numArgs) {
  var numbers = [];
  var that = this;
  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return that.apply(null, numbers);
    } else {
      return _curriedSum;
    }
  };
  return _curriedSum;
};

const sum3 = sum.curry(4);
console.log(sum3(5)(30)(20)(1));

// console.log(sum3(5)(30)(20)(1); // => 56

Function.prototype.curry = function (numArgs) {
  const args = [];
  const fn = this;

  function _curriedFn(arg) {
    args.push(arg);

    if (args.length === numArgs) {
      return fn(...args);
    } else {
      return _curriedFn;
    }
  }

  return _curriedFn;
};


