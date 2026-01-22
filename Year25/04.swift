import Foundation

let input = try String(contentsOfFile: "04.txt", encoding: .utf8)

let paperRoll: Character = "@"
let emptySpace: Character = "."

let paperMap =
  input
  .split(separator: "\n")
  .map { Array($0) }

let height = paperMap.count
let width = paperMap.first?.count ?? 0

var accessibleRollsCount = 0

for y in 0..<height {
  for x in 0..<width where paperMap[y][x] == paperRoll {
    var adjacentRollsCount = 0
    for dy in -1...1 {
      for dx in -1...1 where !(dy == 0 && dx == 0) {
        let ny = y + dy
        let nx = x + dx
        if (0..<height).contains(ny) && (0..<width).contains(nx) && paperMap[ny][nx] == paperRoll {
          adjacentRollsCount += 1
        }
      }
    }
    if adjacentRollsCount < 4 {
      accessibleRollsCount += 1
    }
  }
}

print("Part 1: \(accessibleRollsCount)")
