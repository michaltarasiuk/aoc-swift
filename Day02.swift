import Foundation

let input = try! String(contentsOfFile: "Day02.txt", encoding: .utf8)

func isInvalidId(_ id: String) -> Bool {
  let midpoint = id.index(id.startIndex, offsetBy: id.count / 2)
  return id[..<midpoint] == id[midpoint...]
}

let ranges = input.split(separator: ",")
  .map { $0.split(separator: "-").map { Int($0)! } }
  .map { $0[0]...$0[1] }

let count =
  ranges
  .flatMap { $0 }
  .filter { isInvalidId(String($0)) }
  .reduce(0, +)

print("Part 1: \(count)")
