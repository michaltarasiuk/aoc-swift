import Foundation
import RegexBuilder

let input = try String(contentsOfFile: "03.txt", encoding: .utf8)

let instructionRegex = Regex {
  ChoiceOf {
    #/mul\((\d+),(\d+)\)/#
    #/do\(\)/#
    #/don't\(\)/#
  }
}

var part1Sum = 0
var part2Sum = 0
var enabled = true
for match in input.matches(of: instructionRegex) {
  let (command, x, y) = match.output
  if command.starts(with: "mul"), let i = Int(x!), let j = Int(y!) {
    let product = i * j
    part1Sum += product
    if enabled {
      part2Sum += product
    }
  } else {
    enabled = (command == "do()")
  }
}

print("Part 1: \(part1Sum)")
print("Part 2: \(part2Sum)")
