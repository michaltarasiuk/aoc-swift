import Foundation

let input = try String(contentsOfFile: "03.txt", encoding: .utf8)

let multiplyRegex = #/mul\((\d+),(\d+)\)/#

var multiplications = 0
for match in input.matches(of: multiplyRegex) {
  let (_, x, y) = match.output
  if let i = Int(x), let j = Int(y) {
    multiplications += i * j
  }
}

print("Part 1: \(multiplications)")
