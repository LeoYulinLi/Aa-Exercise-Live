const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

/**
 * @param {*} el1
 * @param {*} el2
 * @param {function(boolean):void} callback
 */
function askIfGreaterThan(el1, el2, callback) {
  // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.
  reader.question(`Is ${el1} greater than ${el2}?: `, response => {
    if (response === "yes") {
      callback(true);
    } else {
      callback(false);
    }
  });
}

/**
 * @param {[]} arr
 * @param {number} i
 * @param {boolean} madeAnySwaps
 * @param {function(boolean):void} outerBubbleSortLoop
 */
function innerBubbleSortLoop(arr, i, madeAnySwaps = false, outerBubbleSortLoop) {
  // Do an "async loop":
  if (i === arr.length - 1) {
    // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
    //    know whether any swap was made.
    // console.log(arr);
    outerBubbleSortLoop(madeAnySwaps);
  } else {
    // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
    //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
    //    continue the inner loop. You'll want to increment i for the
    //    next call, and possibly switch madeAnySwaps if you did swap.
    askIfGreaterThan(arr[i], arr[i + 1], response => {
      if (response) {
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop)
    });
  }
}

/**
 * @param {[]} arr
 * @param {function([]):void} sortCompletionCallback
 */
function absurdBubbleSort(arr, sortCompletionCallback) {

  /**
   * @param {boolean} madeAnySwaps
   */
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }

  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  outerBubbleSortLoop(true);

}

// single pass of bubble sort
// innerBubbleSortLoop([2, 4, -1, 0], 0, false, (result) => {
//   console.log(result);
// });

absurdBubbleSort([2, 4, -1, 0], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});