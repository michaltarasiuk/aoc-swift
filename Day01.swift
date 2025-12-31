import Foundation

let input = try! String(contentsOfFile: "Day01.txt", encoding: .utf8)

let startingSetting = 50
let moduloValue = 100

var currentSetting = startingSetting
var zeroStopCount = 0
for rotation in input.split(separator: "\n") {
  guard let direction = rotation.first else { continue }
  let steps = Int(rotation.dropFirst()) ?? 0
  switch direction {
  case "L":
    currentSetting = (currentSetting - steps + moduloValue) % moduloValue
  case "R":
    currentSetting = (currentSetting + steps) % moduloValue
  default:
    continue
  }
  if currentSetting == 0 {
    zeroStopCount += 1
  }
}

print("Part 1: \(zeroStopCount)")
