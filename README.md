# SimpliCrypt
This Swift Playground shows how to create RSA keys in order to encrypt and decrypt small messages.

This playground is a quick demonstration of how RSA functions to encrypt data sent through the internet.

## What is RSA? ##

RSA is an asymetrical cryptography algorithm. It works with two keys as we'll see now.
Alice will create two kesy, one public, and one private. In order to create them, she will choose two arbitrary prime numbers p and q. We have then n = p * q. Finally, she also choose e, another prime. She will publish her public key as (RSA, n, e).
To send her a message, you just need to use her given public key and her only key will be able to decrypt the message with her private key.
The strength of this algorithm is that it is nearly impossible to find quickly enough p and q from n because of the size of the numbers used making it extremely secure.

## What will you find in the playground? ##

You will find the process of creating the keys with small prime numbers and you'll be able to see how encryption and decryption works with detailed and clear console logging to help you understand the concept more.

## Why creating this? ##

Take a look at the playground to find out!

## Licensing

This project is published under the MIT license. More information can be found in the LICENSE file.
