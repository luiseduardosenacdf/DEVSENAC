function testFunction() {
    var localGreeting = "Morning";
    console.log("function:");
    console.log(globalGreeting);
    console.log(localGreeting);
    return localGreeting; 
}

var result = testFunction();

console.log("main program:");
console.log(globalGreeting);
console.log(result); 