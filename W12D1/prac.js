

Function.prototype.myCurry = function(numArgs) {
  let args = [];
  let that = this;
  return function _myCurry(ele) {
    args.push(ele);
    if (args.length === numArgs) {
      return that(...args);
    } else {
      return _myCurry;
    }
  }
};




Function.prototype.myCurrry = function(numArgs) {
  let argBalls = [];
  let that = this; 
  return function _myCurry(el) {
    argBalls.push(el);

    if (argBalls.length < numArgs) {
      return _myCurry; 
    } else {
      return that(...argBalls);
    }
  }; 
};

