import Foundation
import CoreGraphics

public class NDollerGestureRecognizer {
//    public var strokes = [[CGPoint]]()

    public func generateUnistroke(strokes: [[CGPoint]]) {
        var orders = [[Int]]()
        var order = [Int]()
        for i in 0..<strokes.count {
            order.append(i)
        }
        heapPermutate(strokes.count, &order, &orders)

        var unistrokes = makeUnistrokes(strokes, orders)
        for unistroke in unistrokes {
            
        }
    }
}

func heapPermutate(n: Int, inout order: [Int], inout orders: [[Int]]) {
    if n == 1 {
        orders.append(order)
    } else {
        for i in 0..<n {
            heapPermutate(n - 1, &order, &orders)
            if n % 2 == 1 {
                let tmp = order[0]
                order[0] = order[n - 1]
                order[n - 1] = tmp
            } else {
                let tmp = order[i]
                order[i] = order[n - 1]
                order[n - 1] = tmp
            }
        }
    }
}

public func makeUnistrokes(strokes: [[CGPoint]], orders: [[Int]]) -> [[CGPoint]] {
    var unistrokes = [[CGPoint]]()
    for order in orders {
        let power = Int(pow(Double(2), Double(order.count)))
        for b in 0..<power {
            var unistroke = [CGPoint]()
            for i in 0..<order.count {
                let stroke = strokes[order[i]] as [CGPoint]
                if ((b >> i) & 1) == 1 {
                    unistroke = stroke.reverse()
                } else {
                    unistroke = stroke
                }
            }
            unistrokes.append(unistroke)
        }
    }
    return unistrokes
}
