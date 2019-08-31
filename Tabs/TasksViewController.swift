//__FILENAME__  was created on __DATE__

import UIKit

class TasksViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tasksTableView: UITableView!
    @IBOutlet weak var completionCellDetailLabel: UILabel!
    
    enum completionStatus {
        case complete
        case incomplete
    }
    
    // MARK: - Selectors
    @objc func handleDropDown() {
        print("dropdown button")
        
        
    }
    
    // MARK: - Helper Functions
    
    let allTasks = TaskBank()
    let numberOfDetails = 2
    
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
    
    func registerTableViewCellCheckmark() {
        
    }
    
}

extension TasksViewController: UITableViewDataSource, UITableViewDelegate {
    
    // TableView DataSource method
    // defines number of rows that will be in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfDetails + 1
    }
    
    // TableView DataSource method
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // assign text to the current cell in question
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskItemCell", for: indexPath)
        
        if (indexPath.row == 0) {
            cell.textLabel?.text = "Time: \(allTasks.taskList[indexPath.section].time ?? 30) minutes"
            cell.detailTextLabel?.text = "DETAILS AND SUCH"
        }
        else if (indexPath.row == 1) {
            cell.textLabel?.text = "Reward: \(allTasks.taskList[indexPath.section].marcusCoins) MarcusCoins"
        }
        // customize final cell in section differently
        else if (indexPath.row == numberOfDetails) {
            
//            let completionCell = UITableViewCell(style: UITableViewCell.CellStyle.value2, reuseIdentifier: "CompletionItemCell")
            
            let completionCell = CompletionItemCell(style: UITableViewCell.CellStyle.value2, reuseIdentifier: "CompletionItemCell")
            
            completionCell.createCompletionCell()
            
            return completionCell
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
