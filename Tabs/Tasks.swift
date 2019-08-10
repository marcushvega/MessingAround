//__FILENAME__  was created on __DATE__

import Foundation

class Tasks {
    
    let title: String
    var timed: Bool
    var time: Int?
    var count: Int?
    let location: String
    let marcusCoins: Int
    var notes: String?
    
    init(title: String, timed: Bool, time: Int?, count: Int?, location: String, marcusCoins: Int, notes: String?) {
        self.title = title
        self.timed = timed
        
        if self.timed {
            self.time = time
        }
        else {
            self.count = 0
        }
        
        self.location = location
        self.marcusCoins = marcusCoins
        
        if notes != nil {
            self.notes = notes
        }
    }
}
