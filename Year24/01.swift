import Foundation

let input = try String(contentsOfFile: "01.txt", encoding: .utf8)

let lines =
  input
  .components(separatedBy: .newlines)
  .map({
    $0
      .split(separator: #/\s+/#)
      .compactMap({ Int($0) })
  })

let start = lines.map({ $0[0] }).sorted()
let end = lines.map({ $0[1] }).sorted()

let part1Sum = zip(start, end)
  .map({ abs($0 - $1) })
  .reduce(0, +)

print("Part 1: \(part1Sum)")
