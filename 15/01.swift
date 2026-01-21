import Foundation

let input = try String(contentsOfFile: "01.txt", encoding: .utf8)

var floor = 0
var basementEntry: Int?
for (i, char) in input.enumerated() {
  floor += (1) * (char == "(" ? 1 : -1)
  if floor < 0 {
    basementEntry = basementEntry ?? (i + 1)
  }
}

print("Part 1: \(floor)")
print("Part 2: \(basementEntry ?? 0)")
