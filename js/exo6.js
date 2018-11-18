function strUnique(arr) {
    return arr.filter(function(value) {
        return arr.indexOf(value) === arr.lastIndexOf(value);
    })[0] || -1;
}

var B = ["aa", "aaaaa", "bb"];
console.log(strUnique(B));