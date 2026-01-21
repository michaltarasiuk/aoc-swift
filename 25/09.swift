import Foundation

let input = try String(contentsOfFile: "09.txt", encoding: .utf8)

struct Tile {
  let x: Int
  let y: Int

  func area(to other: Tile) -> Int {
    return (abs(x - other.x) + 1) * (abs(y - other.y) + 1)
  }
}

func parseTile(_ tile: String) -> Tile? {
  let parts = tile.split(separator: ",")
  guard parts.count == 2,
    let x = Int(parts[0]),
    let y = Int(parts[1])
  else { return nil }
  return Tile(x: x, y: y)
}

let tiles =
  input
  .components(separatedBy: .newlines)
  .compactMap { parseTile($0) }

var largestArea = 0
for (offset, a) in tiles.enumerated() {
  for b in tiles[(offset + 1)...] {
    largestArea = max(largestArea, a.area(to: b))
  }
}

print("Part 1: \(largestArea)")
