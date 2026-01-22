import Foundation

let input = try String(contentsOfFile: "05.txt", encoding: .utf8)

func parseRange(_ range: Substring) -> ClosedRange<Int>? {
  let parts = range.split(separator: "-").compactMap { Int($0) }
  guard parts.count == 2 else { return nil }
  return parts[0]...parts[1]
}

let paragraphs =
  input
  .split(separator: "\n\n")
  .map { $0.split(separator: "\n") }

precondition(paragraphs.count == 2, "Error: Expected two paragraphs in input")

let ranges = paragraphs[0].compactMap { parseRange($0) }
let ids = paragraphs[1].compactMap { Int($0) }

let validIds = ids.filter { id in
  ranges.contains { $0.contains(id) }
}

print("Part 1: \(validIds.count)")
