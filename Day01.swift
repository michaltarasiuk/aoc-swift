import Foundation

let input = try! String(contentsOfFile: "Day01.txt", encoding: .utf8)

let STARTING_SETTING = 50
let MODULO_VALUE = 100

var currentSetting = STARTING_SETTING
var zeroStopCount = 0
for rotation in input.split(separator: "\n") {
  guard let direction = rotation.first else { continue }
  let steps = Int(rotation.dropFirst()) ?? 0
  switch direction {
  case "L":
    currentSetting = (currentSetting - steps + MODULO_VALUE) % MODULO_VALUE
  case "R":
    currentSetting = (currentSetting + steps) % MODULO_VALUE
  default:
    continue
  }
  if currentSetting == 0 {
    zeroStopCount += 1
  }
}

print("Part 1: \(zeroStopCount)")
