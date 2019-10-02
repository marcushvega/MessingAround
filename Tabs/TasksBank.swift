//__FILENAME__  was created on __DATE__

import Foundation

//API
protocol TaskBanking {
    func addTask(title: String, inMinutes time: Int)
    //func removeTask()
    func printTasks()
}

class TaskBank: TaskBanking {
    
    var taskList = [Task]()
    
    func addTask(title: String, inMinutes time: Int) {
        taskList.append(Task(title: title, time: time, count: nil, notes: nil))
    }
    
    func printTasks() {
        for Task in taskList {
            print("Task: \(Task.title), Time Limit: \(Task.time!)")
        }
    }
    
    init() {
        taskList.append(Task(title: "Clean Living Room", time: 30, count: nil, notes: nil))

        taskList.append(Task(title: "Clean Kitchen", time: 30, count: nil, notes: nil))

        taskList.append(Task(title: "Wash Kitchen Floor", time: 15, count: nil, notes: "Use lysol and mop, but also spot clean dirtier tiles using fake horsehair brush"))

        taskList.append(Task(title: "Clean Office Room", time: 15, count: nil, notes: "Get a box. Through unnecessary items in the box."))

        taskList.append(Task(title: "Wash Clothes", time: 15, count: nil, notes: "If you wash clothes then you must dry those clothes on the same day and preferably within (2) hours after the clothes have finished being washed"))
    }
}
