import Foundation

let input = try String(contentsOfFile: "02.txt", encoding: .utf8)

struct Present {
  let l: Int
  let w: Int
  let h: Int

  func totalPaperNeeded() -> Int {
    let (a, b, c) = (l * w, w * h, h * l)
    return 2 * (a + b + c) + min(a, b, c)
  }
}

func parsePresent(_ present: String) -> Present? {
  let d = present.split(separator: "x").compactMap { Int($0) }
  guard d.count == 3 else { return nil }
  return Present(l: d[0], w: d[1], h: d[2])
}

let totalSquareFeet =
  input
  .components(separatedBy: .newlines)
  .compactMap { parsePresent($0) }
  .map { $0.totalPaperNeeded() }
  .reduce(0, +)

print("Part 1: \(totalSquareFeet)")
