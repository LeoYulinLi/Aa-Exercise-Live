// function sum() {
  // let argsSum = 0;
  // for (let i = 0; i < arguments.length; i++) {
  //   argsSum += arguments[i];
  // }
  // return argsSum;
// }

function sum(...nums) {
  let argsSum = 0;
  for (let i = 0; i < nums.length; i++) {
    argsSum += nums[i];
  }
  return argsSum;
  // return nums.reduce((acc, n) => {
  //   return acc + n;
  // })
}

// console.log(sum(1, 2, 3, 4));
// console.log(sum(1, 2, 3, 4, 5));
// 1,2,3,5 => [1,2,3,5]

Function.prototype.myBind = function () {
  let context = arguments[0]; 
  let args = Array.from(arguments).slice(1);
  const that = this;
  return function() {
    const args2 = args.concat(Array.from(arguments));
    that.apply(context, args2);
  };
}

Function.prototype.myBind = function(context, ...args){
  return (...lambdaArgs) => {
    this.apply(context, args.concat(lambdaArgs))
  }
}

function curriedSum(count) {
  let soFar = 1;
  let sumSoFar = 0;
  
  return function _curriedSum(num1) {
    if (count > soFar) {
      soFar += 1;
      sumSoFar += num1;
      return _curriedSum;
    } else {
      return sumSoFar += num1;
    }
  }

}


// const sum3 = curriedSum(4);
// console.log(sum3(5)(30)(20)(1)); 

// const sum = curriedSum(4);
// sum(5)(30)(20)(1); // => 56


Function.prototype.curry = function (numArgs) {
  let argsSoFar = []
  let that = this;
  
  const _curry = function(...args) {
    argsSoFar = argsSoFar.concat(args);
    
    if (argsSoFar.length < numArgs) {
      return _curry;
    } else {
      return that(...argsSoFar);
    }
  }

  return _curry;
};


const printString = function(...strings) {
  strings.forEach(s => console.log(s));
}

const pringAllStrings = printString.curry(3);
// pringAllString = _curry


//numArgs = 3
// _curry("Hello")("World")("Bye!");

pringAllStrings("Hello")("World")("Bye!");
// Function.prototype.curry
// Write a method Function.prototype.curry(numArgs). 
// This should return a function that will:

//     -Collect up arguments until there are numArgs of them,
//     -If there are too few arguments still, it should return itself.
//     -When there are numArgs arguments, it should call the original function.
//     -Write a version that uses Function.prototype.apply and another 
//     -one that uses ... (the spread operator).


Function.prototype.curry2 = function (numArgs) {
  let argsSoFar = []
  let that = this

  const _curry2 = function(...args) {
    argsSoFar = argsSoFar.concat(args);

    if (argsSoFar.length < numArgs) {
      return _curry2;
    } else {
      return that.apply(null, argsSoFar);
    }
  }

  return _curry2;
}


const printString2 = function (...strings) {
  strings.forEach(s => console.log(s));
}

const pringAllStrings2 = printString2.curry2(3);
// pringAllString = _curry


//numArgs = 3
// _curry("Hello")("World")("Bye!");

pringAllStrings2("Hello")("World")("Bye!");