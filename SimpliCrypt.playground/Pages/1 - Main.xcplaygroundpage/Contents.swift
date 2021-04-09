//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

//MARK: - Initial RSA Keys
var RSA_P=0
var RSA_Q=0
var RSA_N=0
var RSA_M=0
var RSA_E=0
var RSA_D=0

//MARK: - In the process of encrypting and decrypting, additional variables
var r=2
var c=0
var gcd_answer=0

//MARK: - Extension of exponents

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

//MARK: - Get primes from all numbers

func getPrimes() -> [Int] {
    var numbers = [Int](2..<150)
    for i in 0..<148 {
        let prime = numbers[i]
        guard prime > 0 else  { continue }
        for multiple in stride(from: 2*prime-2, to: 148, by: prime) {
            numbers[multiple] = 0
        }
    }
    
    return numbers.filter {$0 > 0}
}

//MARK: - Find the greatest common divisior

func gcd( a:Int, b:Int) -> Int {
    var b = b
    var a = a
    var t = 0
    while b != 0 {
        t = b
        b = a % b
        a = t
    }
    return a
}

//MARK: - List of primes

var primes:[Int] = getPrimes()

//MARK: - LET'S START !

print("Let's start with the demonstration!\n")

print("Time for key creation! You are now going to create your keys. In order to do this, you need to choose two prime numbers which we will call p and q for simplicity's sake.\n")

print("For this example, we'll pick a random prime 'p' within the first seven prime numbers.\n")
RSA_P = primes[Int(arc4random_uniform(UInt32(5)+1))]
print("Your prime is p =", RSA_P)
print()

print("Again, we'll pick a random prime 'q' which is also within the first seven prime numbers.\n")
RSA_Q = primes[Int(arc4random_uniform(UInt32(5)+2))]
print("Your prime is q =", RSA_Q)
print()

print("Okay so we finally have our two prime numbers. We need to calculate 'n' another important variable which follows the formula: n = p*q. Let's see what we get!\n")
RSA_N = RSA_P * RSA_Q
print("The first part of our key, N, is: ", RSA_N)
print()

print("We now need an m variable to derive our other values. m is very easy to find since it follows the formula: m = (p-1) * (q-1).\n")
RSA_M = (RSA_P-1) * (RSA_Q-1)
print("Our m in this case is equal to: ", RSA_M)
print()

print("Now, we need to determine an e variable which is coprime (mutually prime) to m. To do this, we need to find make sure that 1 is the only common divisor between e and m. In this case, the values are coprime and this is exactly what we want.\n")

while gcd_answer != 1 {
    let gcd_value = gcd(a: r, b: RSA_M)
    if gcd_value == 1 {
        gcd_answer = 1
        RSA_E = r
        break;
    } else {
        r=r+1
    }
}

print("We have now e, which is the second part of our public key which equates to:", RSA_E)
print()
print("We just need to find d and we can start encrypting and decrypting messages!\n")

print("To find d it must follow this equation which might seem complicated, but trust me it's not :) : d*e = 1 + c*m, it is equal to d = (1 + c*m)/e, but to do this we need to determine c (an Integer) to then divide it by e like in the equation just before.\n")
print("So many variables, I know, but this is how data sent over the internet is encrypted to make sure that data is not stolen!\n")
while ((1 + c*RSA_M)%RSA_E) != 0 {
    c=c+1
}

print("So c has been determined to be: ", c)
print()

RSA_D=((1 + c*RSA_M)/RSA_E)
print("Okay, finally finished! We finally figured out the value of d which is: ", RSA_D)
print()

print("We have now all our keys! Let's summarize this in an easy way to understand: ")

print("PUBLIC KEY: n=\(RSA_N) ; e=\(RSA_E)")
print("PRIVATE KEY: n=\(RSA_N) ; d=\(RSA_D)")
print()

print("Let's switch to next page to encrypt and decrypt a small message to help you understand this a bit better.")


//: [Next](@next)
