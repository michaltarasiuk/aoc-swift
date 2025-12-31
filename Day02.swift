import Foundation

let input = try! String(contentsOfFile: "Day02.txt", encoding: .utf8)

let ranges = input.split(separator: ",").map { $0.split(separator: "-").map { Int($0)! } }

func isValidId(_ id: String) -> Bool {
  let midpoint = id.index(id.startIndex, offsetBy: id.count / 2)
  return id[..<midpoint] == id[midpoint...]
}

var count = 0
for range in ranges {
  for i in range[0]..<range[1] {
    if isValidId(String(i)) {
      count += i
    }
  }
}

print("Part 1: \(count)")
