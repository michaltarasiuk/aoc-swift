import Foundation

let input = try String(contentsOfFile: "Day01.txt", encoding: .utf8)

var pos = 50
var finalZeros = 0
var clickZeros = 0

for line in input.split(separator: "\n") {
  guard
    let dir = line.first,
    let ticks = Int(line.dropFirst())
  else { continue }
  let move = (dir == "L") ? -1 : 1
  for _ in 0..<ticks {
    pos = (pos + move + 100) % 100
    if pos == 0 {
      clickZeros += 1
    }
  }
  if pos == 0 {
    finalZeros += 1
  }
}

print("Part 1: \(finalZeros)")
print("Part 2: \(clickZeros)")
