import Foundation

let input = try! String(contentsOfFile: "Day01.txt", encoding: .utf8)

var currentSetting = 50
var zeroStopCount = 0
for rotation in input.split(separator: "\n") {
  guard let direction = rotation.first else { continue }
  let steps = Int(rotation.dropFirst()) ?? 0
  switch direction {
  case "L":
    currentSetting = (currentSetting - steps + 100) % 100
  case "R":
    currentSetting = (currentSetting + steps) % 100
  default:
    continue
  }
  if currentSetting == 0 {
    zeroStopCount += 1
  }
}

print("Part 1: \(zeroStopCount)")
