import Foundation

let input = try String(contentsOfFile: "02.txt", encoding: .utf8)

func isPalindrome(_ id: String) -> Bool {
  guard id.count.isMultiple(of: 2) else { return false }
  let midpoint = id.index(id.startIndex, offsetBy: id.count / 2)
  return id[..<midpoint] == id[midpoint...]
}

let ranges = input.split(separator: ",")
  .compactMap { parts -> ClosedRange<Int>? in
    let numbers = parts.split(separator: "-").compactMap { Int($0) }
    guard numbers.count == 2 else { return nil }
    return numbers[0]...numbers[1]
  }

let validIds =
  ranges
  .flatMap { $0 }
  .filter { isPalindrome(String($0)) }

print("Part 1: \(validIds.count)")
