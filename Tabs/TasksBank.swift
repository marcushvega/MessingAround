//__FILENAME__  was created on __DATE__

import Foundation

//API
protocol TaskBanking {
    func addTask()
    //func removeTask()
}

class TaskBank: TaskBanking {
    
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
    
    var taskList = [Task]()
    
    func addTask() {
        
    }

    init() {
        taskList.append(Task(title: "Clean Living Room", timed: true, time: 30, count: nil, location: "Living Room", marcusCoins: 50, notes: nil))

        taskList.append(Task(title: "Clean Kitchen", timed: true, time: 30, count: nil, location: "Kitchen", marcusCoins: 50, notes: nil))

        taskList.append(Task(title: "Wash Kitchen Floor", timed: true, time: 15, count: nil, location: "Kitchen/Laundry Room", marcusCoins: 30, notes: "Use lysol and mop, but also spot clean dirtier tiles using fake horsehair brush"))

        taskList.append(Task(title: "Clean Office Room", timed: true, time: 15, count: nil, location: "Office Room", marcusCoins: 35, notes: "Get a box. Through unnecessary items in the box."))

        taskList.append(Task(title: "Wash Clothes", timed: true, time: 15, count: nil, location: "Laundry Room", marcusCoins: 10, notes: "If you wash clothes then you must dry those clothes on the same day and preferably within (2) hours after the clothes have finished being washed"))
    }
}
