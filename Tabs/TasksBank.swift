//__FILENAME__  was created on __DATE__

import Foundation

class TaskBank {
    
    var taskList = [Tasks]()
    
    init() {
        taskList.append(Tasks(title: "Clean Living Room", timed: true, time: 30, count: nil, location: "Living Room", marcusCoins: 50, notes: nil))
        
        taskList.append(Tasks(title: "Clean Kitchen", timed: true, time: 30, count: nil, location: "Kitchen", marcusCoins: 50, notes: nil))
        
        taskList.append(Tasks(title: "Wash Kitchen Floor", timed: false, time: nil, count: 0, location: "Kitchen/Laundry Room", marcusCoins: 30, notes: "Use lysol and mop, but also spot clean dirtier tiles using fake horsehair brush"))
        
        taskList.append(Tasks(title: "Clean Office Room", timed: true, time: 15, count: 0, location: "Office Room", marcusCoins: 35, notes: "Get a box. Through unnecessary items in the box."))
    }
}
