import Foundation

let input = try! String(contentsOfFile: "Day01.txt", encoding: .utf8)

let startingDialPosition = 50
let dialSize = 100

var dialPosition = startingDialPosition
var zeroStopCount = 0
for rotation in input.split(separator: "\n") {
  guard
    let direction = rotation.first,
    let steps = Int(rotation.dropFirst())
  else { continue }
  let sign = direction == "L" ? -1 : direction == "R" ? 1 : 0
  dialPosition = (dialPosition + sign * steps + dialSize) % dialSize
  if dialPosition == 0 {
    zeroStopCount += 1
  }
}

print("Part 1: \(zeroStopCount)")
