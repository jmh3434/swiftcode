import UIKit

struct Point {
    var x:Double
    var y:Double
}


struct Line {
    var start:Point
    var end:Point
    
    func getLength() -> Double{
        
        let xDif = (self.end.x-self.start.x)*(self.end.x-self.start.x)
        
        let yDif = (self.end.y-self.start.y)*(self.end.y-self.start.y)
        
        let sum = Double(xDif + yDif)
        
        let root = sum.squareRoot()
    
        
        // (x2-x1)^2 + (y2-y1)^2
        
        return root
    }
}

struct Triangle {
    var points:[Point] = [Point]()
    
    init(points:[Point]){
        self.points = points
        
        if (points.count > 3){
            print("not a triangle, must be 3 sides")
        }
    }
    
    func getArea() -> Double {
        
        let area = (points[0].x*(points[1].y - points[2].y) + points[1].x*(points[2].y - points[0].y) + points[2].x*(points[0].y - points[1].y))/2
        
        return area
    }
}

var point1 = Point(x: 0.0, y: 0.0)

var point2 = Point(x: 5.0, y: 0.0)

var point3 = Point(x: 0.0, y: 5.0)


let line:Line = Line(start: point1, end: point2)

line.getLength()

let triangle:Triangle = Triangle(points: [point1,point2,point3])

triangle.getArea()


