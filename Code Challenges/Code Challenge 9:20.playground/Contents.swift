import UIKit

func returnNthEven(n: Int) -> Int {
    guard n > 0 else { return 0 }
    let nEvenNum = (n-1) * 2
    return nEvenNum
}

print(returnNthEven(n: 1))
print(returnNthEven(n: 3))
print(returnNthEven(n: 100))
print(returnNthEven(n: 1298734))


//var nEvenNum: Int = 0
//var tempNum = n - 1
//
//while tempNum > 0 {
//    nEvenNum += 2
//    tempNum -= 1
//}

