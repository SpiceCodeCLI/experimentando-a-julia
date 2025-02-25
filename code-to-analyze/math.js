function doMath() {
    let a = 42;
    let b = 13;
    let c = Math.sqrt(a * b);
    
    let x = Math.pow(a, 2) + Math.pow(b, 2);
    let y = Math.sin(a) + Math.cos(b);
    let z = Math.log(a) * Math.exp(b);
    
    let rand1 = Math.random() * 100;
    let rand2 = Math.floor(Math.random() * 50);
    let rand3 = Math.ceil(Math.random() * 75);
    
    let sum = a + b + c + x + y + z + rand1 + rand2 + rand3;
    let product = a * b * c * x * y * z;
    let modulo = sum % product;
    
    console.log("Square root of a * b:", c);
    console.log("Sum of squares:", x);
    console.log("Trigonometric sum:", y);
    console.log("Log and exp product:", z);
    console.log("Random numbers:", rand1, rand2, rand3);
    console.log("Total sum:", sum);
    console.log("Total product:", product);
    console.log("Modulo:", modulo);
    
    let arr = Array.from({length: 10}, (_, i) => i * 2);
    let filtered = arr.filter(n => n % 4 === 0);
    let mapped = arr.map(n => n * Math.PI);
    
    console.log("Original array:", arr);
    console.log("Filtered array:", filtered);
    console.log("Mapped array:", mapped);
    
    let obj = { a, b, c, x, y, z, sum, product, modulo };
    console.log("Math object:", obj);
}

doMath();