//Create list of ints from 1 to 5, Haskell equivalent [1..5]
function arrFunc(a, b){
    let arr = [];
    for (let i = a; i<=b; i++) {
        arr.push(i);
    }
    return arr;    
}

function applicatorFunc(inpFunc ,a, b, s){
    const arr = inpFunc(a, b);   
    let sum = arr.reduce((accumulator, currentValue) => accumulator + currentValue, 0);    
    if(s=='s'){
        return sum;
    }
    else{        
        return sum/(b-a+1);
    }
}

let x = applicatorFunc(arrFunc,1,10, 'a');
console.log(x);