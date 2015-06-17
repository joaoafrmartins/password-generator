camelize = require 'camelize'

minimist = require 'minimist'

args = minimist process.argv.slice 2

Object.keys(args).map (key) ->

  if key.indexOf("-") > 0

    args[camelize key] = args[key]

    delete args[key]

{ passwordLength, specialChars, numbers, length, letters, hasNumbers, hasSpecialChars } = args

passwordLength ?= 16

specialChars ?= ".-_"

numbers ?= "1234567890"

letters  ?= "abcdefghijklmnopqrstuvwxyz"

chars = [letters, numbers, specialChars]

password = ""

getRandomNumber = (cieling) -> Math.floor((Math.random() * cieling));

for i in [1..passwordLength]

  list = chars[getRandomNumber 3]

  password += list[getRandomNumber list.length]

console.log password






