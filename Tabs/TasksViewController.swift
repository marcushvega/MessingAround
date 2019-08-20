//__FILENAME__  was created on __DATE__

import UIKit

class TasksViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tasksTableView: UITableView!
    
    
    // MARK: - Selectors
    @objc func handleDropDown() {
        print("dropdown button")
        
        
        
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if (section == 0) {
            return 0
        }
        else {
            return 4
        }
    }
    
    // MARK: - Helper Functions
    
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
    
}

extension TasksViewController: UITableViewDataSource, UITableViewDelegate {
    
    // TableView DataSource method
    // defines number of rows that will be in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    // TableView DataSource method
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // assign text to the current cell in question
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskItemCell", for: indexPath)
        
        // text to be assigned is taskName String from TasksBank class
        //  I will be using a switch statement to determine the information shown in each cell
        switch indexPath.row {
        case 0:
            if (allTasks.taskList[indexPath.row].timed) {
                cell.textLabel?.text = "indexPath.row is \(indexPath.row)"
            }
            else {
                cell.textLabel?.text = "Current completions of this task: \(allTasks.taskList[indexPath.row].count)"
            }
        case 1:
            cell.textLabel?.text = "Location \(allTasks.taskList[indexPath.row].location)"
        default:
            cell.textLabel?.text = "This is my default text"
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // one solution is to have a tableview section with an embedded button
    //   clicking the button will cause the section to display its cells
    func numberOfSections(in tableView: UITableView) -> Int {
        return allTasks.taskList.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // do i need to loop if i want multiple buttons? no
    // apparently viewForHeaderInSection section does something
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // step 1: create the button
        let button = UIButton(type: .system)
        
        // step 2: give button a title
        button.setTitle(allTasks.taskList[section].title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleDropDown), for: .touchUpInside)
        button.backgroundColor = .blue
        
        return button
    }

}
