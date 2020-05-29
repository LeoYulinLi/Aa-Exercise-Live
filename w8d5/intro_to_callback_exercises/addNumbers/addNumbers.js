const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

/**
 * @param {number} sum
 * @param {number} numLeft
 * @param {function(number):void} completionCallback
 */
function addNumbers(sum, numLeft, completionCallback) {
    if (numLeft > 0) {
        reader.question("Please enter a number: ", answer => {
            const number = parseInt(answer);
            sum += number;
            console.log(`Partial sum: ${sum}`);
            addNumbers(sum, numLeft - 1, completionCallback);
        });
    } else {
        completionCallback(sum);
        reader.close();
    }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));