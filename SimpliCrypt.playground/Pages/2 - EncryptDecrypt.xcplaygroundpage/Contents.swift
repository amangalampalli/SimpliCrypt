//: [Previous](@previous)

import Foundation

//MARK: - Initial RSA Keys
var RSA_P=3
var RSA_Q=11
var RSA_N=33
var RSA_M=20
var RSA_E=7
var RSA_D=3

//MARK: - Extension of exponents

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

//MARK: - Start of encryption

print("A quick note: We'll only use static values here in order to make sure it works due to limitations with too big exponents and modulo (and to make sure we don't fry anything!).\n")

print("With what we have created here, we can encrypt any integers that must be smaller than p and q. Let's get started!\n")

print("Let's pick a number smaller than p and q. For this, we check which one is the smaller, in this case p = 3 and then we remove of from it to end with 2. This avoids the problem with too small numbers.\n")

var message = 2

print("We shall now encrypt our message. To do this we use the number we just randomly choose, 2, and put it on exponent 'e' which is the first part of the public key. We then modulo it by 'n', which is the second part of our public key.\n")

var encryptedMessage = (message ^^ RSA_E) % RSA_N

print("With that our message is now encrypted! This was originally our message: \(message) and now, after its encryption process, it is : \(encryptedMessage).")
print()

//MARK: - DECRYPTION

print("Let's decrypt that now! Just remember our encrypted message is : \(encryptedMessage).\n")

var decryptedMessage = 0

print("To decrypt it, we just need to raise our encrypted message to the power of d and then modulo it by n.\n")

decryptedMessage = (encryptedMessage ^^ RSA_D) % RSA_N

print("After all that struggle, our message was: ", encryptedMessage)
print()

print("Just like that, we have reached the end of out demonstration, thank you for your time and patience. More details regarding my inspiration behind this project can be seen on the next page!")

//: [Next](@next)
