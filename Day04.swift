import Foundation

let input = try! String(contentsOfFile: "Day04.txt", encoding: .utf8)

let paperRoll: Character = "@"
let emptySpace: Character = "."

let paperMap =
  input
  .components(separatedBy: .newlines)
  .map { Array($0) }

var accessibleRollsCount = 0

for (y, row) in paperMap.enumerated() {
  for (x, cell) in row.enumerated() {
    if cell == emptySpace {
      continue
    }
    var adjacentRollsCount = 0
    for dy in -1...1 {
      for dx in -1...1 {
        if dy == 0 && dx == 0 {
          continue
        }
        let ny = y + dy
        let nx = x + dx
        if paperMap.indices.contains(ny) && paperMap[ny].indices.contains(nx) {
          if paperMap[ny][nx] == paperRoll {
            adjacentRollsCount += 1
          }
        }
      }
    }
    if adjacentRollsCount < 4 {
      accessibleRollsCount += 1
    }
  }
}

print("Part 1: \(accessibleRollsCount)")
