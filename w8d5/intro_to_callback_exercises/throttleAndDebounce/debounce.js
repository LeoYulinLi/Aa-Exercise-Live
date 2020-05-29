/**
 * @param {number} interval milliseconds
 */
Function.prototype.myDebounce = function (interval) {
  let tooSoon = false;
  let timer;

  return () => {
    clearTimeout(timer);
    timer = setTimeout(() => {
      tooSoon = false;
      this();
    }, interval);
  }

  // return () => {
  //   if (!tooSoon) {
  //     tooSoon = true;
  //     timer = setTimeout(() => {
  //       tooSoon = false;
  //     }, interval);
      
  //   } else {
  //     clearTimeout(timer);
  //     timer = setTimeout(() => {
  //       tooSoon = false;
  //       this();
  //     }, interval);
  //   }
  // }
}

class SearchBar {
  constructor() {
    this.query = "";

    this.type = this.type.bind(this);
    this.search = this.search.bind(this).myDebounce(500);
  }

  /**
   * @param {string} letter
   */
  type(letter) {
    this.query += letter;
    this.search();
  }

  search() {
    console.log(`searching for ${this.query}`);
  }
}

const searchBar = new SearchBar();

const queryForHelloWorld = () => {
  searchBar.type("h");
  searchBar.type("e");
  searchBar.type("l");
  searchBar.type("l");
  searchBar.type("o");
  searchBar.type(" ");
  searchBar.type("w");
  searchBar.type("o");
  searchBar.type("r");
  searchBar.type("l");
  searchBar.type("d");
};

queryForHelloWorld();

setTimeout(() => {
  searchBar.type(" ");
  searchBar.type("w");
  searchBar.type("o");
  searchBar.type("r");
  searchBar.type("l");
  searchBar.type("d");
}, 1000);