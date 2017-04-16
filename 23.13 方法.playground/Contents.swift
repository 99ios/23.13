//: Playground - noun: a place where people can play

import UIKit

/*******************1.实例方法******************/
class Counter {
    var count = 0
    func add(){
        count += 1
    }
    func add(by count:Int){
        self.count += count
    }
    func reset(){
        count = 0
    }
    func toString() {
        print("count:\(self.count)")
    }
}

let counter = Counter()
counter.add()
counter.add(by: 10)
counter.toString()//打印：count:11

counter.reset()
counter.toString()//打印：count:0

/******************************/

struct Point{
    var x = 0
    var y = 0
    mutating func moveBy(deltax:Int,deltay:Int){
        self.x += deltax
        self.y += deltay
    }
    mutating func changeBy(deltax:Int,deltay:Int){
        self = Point(x:self.x+deltax,y:self.y+deltay)
    }
    
    func toString() {
        print("Point(\(self.x),\(self.y))")
    }
}

var p = Point(x: 5, y: 5)
p.toString()//打印：Point(5,5)

p.moveBy(deltax: 10, deltay: 10)
p.toString()//打印：Point(15,15)

p.changeBy(deltax: 20, deltay: 20)
p.toString()//打印：Point(35,35)

/******************************/
enum director{
    case south,east,west,north
    mutating func switcher(){
        switch self {
        case .south:
            self = .east
        case .east:
            self = .west
        case .west:
            self = .north
        case .north:
            self = .south
        }
    }
    func toString() {
        print(self)
    }
}

var dir = director.east
dir.toString() //打印：east
dir.switcher()
dir.toString() //打印：west
dir.switcher()
dir.switcher()
dir.toString() //打印：south


/*******************2.类型方法******************/
struct Score{
    static var totalScore = 0
    static func resetScore(){
        self.totalScore = 0
    }
    
    var score = 0
    mutating func add(By score:Int) {
        self.score += score
        Score.totalScore += score
    }
}

var score1 = Score()
score1.add(By: 100)
print("score1.score:\(score1.score)")
print("Score.totalScore:\(Score.totalScore)\n")

var score2 = Score()
score2.add(By: 50)
score2.add(By: 90)
print("score2.score:\(score2.score)")
print("Score.totalScore:\(Score.totalScore)\n")

Score.resetScore()
print("Score.totalScore:\(Score.totalScore)")
