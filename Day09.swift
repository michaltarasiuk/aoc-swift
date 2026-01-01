import Foundation

let input = try! String(contentsOfFile: "Day09.txt", encoding: .utf8)

struct Tile {
  let x: Int
  let y: Int

  func area(_ other: Tile) -> Int {
    return (abs(x - other.x) + 1) * (abs(y - other.y) + 1)
  }
}

func parseTile(_ tile: String) -> Tile? {
  let parts = tile.split(separator: ",")
  guard
    let x = Int(parts[0]),
    let y = Int(parts[1])
  else { return nil }
  return Tile(x: x, y: y)
}

let redTiles =
  input
  .components(separatedBy: .newlines)
  .compactMap { parseTile($0) }

var largestArea = Int.min
for (offset, a) in redTiles.enumerated() {
  for b in redTiles[(offset + 1)...] {
    largestArea = max(largestArea, a.area(b))
  }
}

print("Part 1: \(largestArea)")
