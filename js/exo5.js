function extractMiddle(str) {
    var result;
    var position;
    var length;

    if (str.length % 2 == 1) {
        position = str.length / 2;
        length = 1;
    } else {
        position = str.length / 2 - 1;
        length = 2;
    }
    result = str.substring(position, position + length)
    return (result);
}
console.log(extractMiddle("jedetestelejs"));