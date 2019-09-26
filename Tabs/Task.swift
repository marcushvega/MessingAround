//__FILENAME__  was created on __DATE__

import Foundation

class Task {
    
//    enum Property: Int {
//        case title = 0, timed, time, count, location, marcusCoins, notes
//    }
    
    
    let title: String
    var time: Int?
    var count: Int?
    var notes: String?
    
// for a later version
    //    var timed: Bool
    //    let location: String
    //    let marcusCoins: Int
    
    init(title: String, time: Int?, count: Int?, notes: String?) {
        self.title = title
        self.count = 0
        self.time = time
        
        if notes != nil {
            self.notes = notes
        }
    }
}
