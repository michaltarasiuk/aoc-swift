import Foundation

let input = try! String(contentsOfFile: "Day05.txt", encoding: .utf8)

func parseRange(_ range: String) -> (Int, Int)? {
  let parts = range.split(separator: "-").compactMap { Int($0) }
  guard parts.count == 2 else { return nil }
  return (parts[0], parts[1])
}

let paragraphs =
  input
  .components(separatedBy: "\n\n")
  .map { $0.components(separatedBy: .newlines) }

let ranges = (paragraphs.first ?? []).compactMap { parseRange($0) }
let ids = (paragraphs.last ?? []).compactMap { Int($0) }

let validIds = ids.filter { id in
  ranges.contains { range in
    id >= range.0 && id <= range.1
  }
}

print("Part 1: \(validIds.count)")
