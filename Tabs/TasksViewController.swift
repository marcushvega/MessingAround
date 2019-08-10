//__FILENAME__  was created on __DATE__

import UIKit

class TasksViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    let allTasks = TaskBank()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dateLabel.text = getDate()
    }

    func getDate() -> String {
        let today = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        
        return dateFormatter.string(from: today)
    }
    
    @IBOutlet weak var tasksTableView: UITableView!
    
}

extension TasksViewController: UITableViewDataSource, UITableViewDelegate {
    
    // TableView DataSource method
    // defines number of rows that will be in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // TableView DataSource method
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // assign text to the current cell in question
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskItemCell", for: indexPath)
        
        // text to be assigned is taskName String from TasksBank class
        cell.textLabel?.text = allTasks.taskList[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\(allTasks.taskList[indexPath.row].title) has been selected")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
//    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        <#code#>
//    }
    
    // i have no idea what this does
    func numberOfSections(in tableView: UITableView) -> Int {
        return allTasks.taskList.count
    }
    
    // apparently a header for a section is not the same as a cell
    //    can a section be opened and closed?
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return allTasks.taskList[section].title
    }
    
//    func tableview
    
}
