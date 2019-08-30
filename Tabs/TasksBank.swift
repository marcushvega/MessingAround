//__FILENAME__  was created on __DATE__

import Foundation

class TaskBank {
    
//    var taskList = [(String, Bool, Int, String, String, Int, String)]()
//    var task = (title: "Clean Living Room", timed: true, time: 30, count: "NA", location: "Living Room", marcusCoins: 50, notes: "")
    
//    // for mvp,
//    // taskList is an array containing a tuple of three values
//    var taskList = [(title: String, time: Int, marcusCoins: Int)]()
//
//    // each task's details will contain Title, Time, and MarcusCoins
//
//    init() {
//        taskList.append((title: "Clean Kitchen", time: 30, marcusCoins: 50))
//        taskList.append((title: "Wash Kitchen Floor", time: 15, marcusCoins: 30))
//        taskList.append((title: "Clean Living Room", time: 30, marcusCoins: 50))
//        taskList.append((title: "Clean Office Room", time: 15, marcusCoins: 35))
//        taskList.append((title: "Clean Backyard", time: 30, marcusCoins: 60))
//
//    }
    
    var taskList = [Tasks]()
    
    init() {
        taskList.append(Tasks(title: "Clean Living Room", timed: true, time: 30, count: nil, location: "Living Room", marcusCoins: 50, notes: nil))

        taskList.append(Tasks(title: "Clean Kitchen", timed: true, time: 30, count: nil, location: "Kitchen", marcusCoins: 50, notes: nil))

        taskList.append(Tasks(title: "Wash Kitchen Floor", time: nil, count: 0, location: "Kitchen/Laundry Room", marcusCoins: 30, notes: "Use lysol and mop, but also spot clean dirtier tiles using fake horsehair brush"))

        taskList.append(Tasks(title: "Clean Office Room", timed: true, time: 15, count: 0, location: "Office Room", marcusCoins: 35, notes: "Get a box. Through unnecessary items in the box."))

        taskList.append(Tasks(title: "Wash Clothes", time: nil, count: 0, location: "Laundry Room", marcusCoins: 10, notes: "If you wash clothes then you must dry those clothes on the same day and preferably within (2) hours after the clothes have finished being washed"))
    }
}
