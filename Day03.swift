import Foundation

let input = try! String(contentsOfFile: "Day03.txt", encoding: .utf8)

func findLargestJoltage(_ bank: [Int]) -> Int {
  guard
    let a = bank.dropLast().max(),
    let aIndex = bank.firstIndex(of: a),
    let b = bank[bank.index(after: aIndex)...].max()
  else { return 0 }
  return a * 10 + b
}

var total = 0
for line in input.components(separatedBy: .newlines) {
  let bank = line.compactMap { $0.wholeNumberValue }
  total += findLargestJoltage(bank)
}

print("Part 1: \(total)")
