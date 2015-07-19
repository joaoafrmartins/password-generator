{ resolve } = require 'path'

camelize = require resolve __dirname, 'node_modules', 'camelize'

module.exports = (options={}) ->

  Object.keys(options).map (key) ->

    if key.indexOf("-") > 0

      args[camelize key] = args[key]

      delete args[key]

  { specialChars, numbers, length, letters, uppercase } = options

  length ?= 16

  numbers ?= "1234567890"

  letters  ?= "abcdefghijklmnopqrstuvwxyz"

  chars = [letters, numbers]

  if specialChars

    if typeof specialChars is "boolean" then specialChars = "!#$%&/[]{}()=?*+|"

    chars.push specialChars

  password = ""

  getRandomNumber = (cieling) -> Math.floor((Math.random() * cieling));

  for i in [1..length]

    index = getRandomNumber chars.length

    list = chars[index]

    char = list[getRandomNumber list.length]

    if (index is 0) and uppercase and getRandomNumber(2)

      char = char.toUpperCase()

    password += char

  return password
