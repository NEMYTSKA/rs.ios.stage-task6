

import Foundation

class CoronaClass {

    var seats = [Int]()
    var n: Int  // кол-во парт

    init(n: Int) {
       if n > 500 { self.n = 500} else
       if n < 1   { self.n = 1 }  else {
           self.n = n
       }
    }

    func seat() -> Int  {
        
        var numberOfTable = 0
        let lastNumber = n-1
        
        if seats.isEmpty {
            seats.append(0)
        } else {
            var temp = 0
            switch seats.count {
            case _ where seats.last != lastNumber :
                if (lastNumber - seats.last!) > temp {
                    numberOfTable = lastNumber
                    seats.append(lastNumber)
                }
            default:
                for i in 0 ..< seats.count-1 {
                    if ((seats[i+1] - seats[i]) / 2) > temp {
                        temp = (seats[i+1] - seats[i]) / 2
                        numberOfTable = (seats[i] + temp)
                    }
                }
                seats.append(numberOfTable)
                seats = seats.sorted()
            }
        }
        return numberOfTable
    }
     //////////////
    func leave(_ p: Int) {
//        guard p > 0 else { return }
        if let index = seats.firstIndex(of: p ) {
            seats.remove(at: index)
        }

    }
}


