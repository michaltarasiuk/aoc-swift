import Foundation

let input = try! String(contentsOfFile: "Day05.txt", encoding: .utf8)

struct Range {
  let start: Int
  let end: Int

  func contains(_ value: Int) -> Bool {
    return start...end ~= value
  }
}

func parseRange(_ range: String) -> Range? {
  let parts = range.split(separator: "-").compactMap { Int($0) }
  guard parts.count == 2 else { return nil }
  return Range(start: parts[0], end: parts[1])
}

let paragraphs =
  input
  .components(separatedBy: "\n\n")
  .map { $0.components(separatedBy: .newlines) }

precondition(paragraphs.count == 2, "Error: Expected two paragraphs in input")

let ranges = paragraphs[0].compactMap { parseRange($0) }
let ids = paragraphs[1].compactMap { Int($0) }

let validIds = ids.filter { id in
  ranges.contains { $0.contains(id) }
}

print("Part 1: \(validIds.count)")
