import Foundation

let input = try String(contentsOfFile: "03.txt", encoding: .utf8)

func findLargestJoltage(_ bank: [Int]) -> Int {
  guard
    let a = bank.dropLast().max(),
    let aIndex = bank.firstIndex(of: a),
    let b = bank[bank.index(after: aIndex)...].max()
  else { return 0 }
  return a * 10 + b
}

let total = input.split(separator: "\n").reduce(0) {
  $0 + findLargestJoltage($1.compactMap { $0.wholeNumberValue })
}

print("Part 1: \(total)")
