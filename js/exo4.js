function nombreUnique(arr) {
    return arr.filter(function(value) {
        return arr.indexOf(value) === arr.lastIndexOf(value);
    })[0] || -1;
}

var A = [22, 25, 3, 3, 1, 2, 0, 0, 100, 22, 25, 1, 2];
console.log(nombreUnique(A));