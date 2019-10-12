//__FILENAME__  was created on __DATE__

import UIKit
import CoreData

class TasksViewController: UIViewController {

    // MARK: - Properties
    
    var taskItems: [NSManagedObject] = []
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tasksTableView: UITableView!
    @IBOutlet weak var addTasksStackView: UIStackView!
    
    enum completionStatus {
        case complete
        case incomplete
    }
    
    var allTasks = TaskBank()
    let numberOfDetails = 2 // time limit & completion status
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dateLabel.text = getDate()
        pullSavedData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Task List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tasksTableView.reloadData()
    }
    
    
    // MARK: - Helper Functions
    
    @objc func addTask() {
        performSegue(withIdentifier: "addTaskSegue", sender: allTasks)
    }
    
    func getDate() -> String {
        let today = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        
        return dateFormatter.string(from: today)
    }
    
    func pullSavedData() {
        // pull up the application delegate and grab a reference to it
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        // previously-pulled app delegate allows me to reference its persistence container
        //    its persistence container contains NSManagedObjectContext viewContext
        //    viewContext is needed to pull Core Data via an NSFetchRequest
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // NSFetchRequests have several qualifiers used to refine the set of results returned
        // NSEntityName is one of the qualifiers used to refine the set of results returned
        // create fetch request for entity TaskItem
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TaskItem")
        
        do {
            // give request to managedContext for it to fetch
            taskItems = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    // this method is called JUST BEFORE the segue actually happens
    @IBAction func unwindToTasksVC(segue: UIStoryboardSegue) {
        
    }
}

    // MARK: - extensions
extension TasksViewController: UITableViewDataSource, UITableViewDelegate {
    
    // TableView DataSource method
    // defines number of rows that will be in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfDetails + 1
    }
    
    // TableView DataSource method
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // assign text to the current cell in question
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskItemCell", for: indexPath)
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "TaskItemCell")
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.adjustsFontForContentSizeCategory = true
        cell.textLabel?.textColor = UIColor.blue
        
        cell.backgroundColor = UIColor.init(red: 229/255, green: 187/255, blue: 175/255, alpha: 0.88)
        
//        let task = taskItems[indexPath.section]
        
        if (indexPath.row == 0) {
            cell.textLabel?.text = "Time: "
//            cell.detailTextLabel?.text = "\(task.value(forKey: "time") ?? 22) minutes"
            cell.detailTextLabel?.text = "\(allTasks.taskList[indexPath.section].time ?? 22) minutes"
        }
        else if (indexPath.row == 1) {
            
            let completionCell = CompletionItemCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "CompletionItemCell")
            
            completionCell.createCompletionCell()
            
            return completionCell
        }
        else if (indexPath.row == numberOfDetails) {
            let startButtonCell = StartButtonCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "startButtonCell")
            
            startButtonCell.createStartButtonCell()
            
            return startButtonCell
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // check whether the row is the same row that is used for placing StartButtonCell
        if (indexPath.row == numberOfDetails) {
            
            // sender can apparently send an integer
            // sender sends time in minutes
            performSegue(withIdentifier: "startButtonSegue", sender: allTasks.taskList[indexPath.section].time)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //set task for the vc we're going to
        //by grab task
        if (segue.identifier == "startButtonSegue") {
            guard let vc = segue.destination as? TimerViewController else {
                print("Your ViewController is not of type TimerViewController")
                return
            }
        
        // sender, in this case, comes in as some number of minutes
        // so it needs to be converted to seconds...so I can later convert it to minutes and hours and seconds
        vc.initialTime = sender as! Int
        vc.initialTime *= 60
        
        
        vc.timeLeft = sender as! Int
        vc.timeLeft *= 60
        }
        
        else if (segue.identifier == "addTaskSegue") {
            guard let vc = segue.destination as? AddTaskViewController else {
                print("Your ViewController is not of type AddTaskViewController")
                return
            }
            // pass allTasks Task array by reference hopefully
            vc.allTasks = allTasks
        }
    }
    
    // one solution is to have a tableview section with an embedded button
    //   clicking the button will cause the section to display its cells
    func numberOfSections(in tableView: UITableView) -> Int {
//        return taskItems.count
        return allTasks.taskList.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // step 1:
//        let task = taskItems[section]
        
        // step 2: create the button
        let button = UIButton(type: .system)
        
        // step 3: give button details
//        button.setTitle(task.value(forKey: "title") as? String, for: .normal)
        button.setTitle(allTasks.taskList[section].title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleDropDown), for: .touchUpInside)
        button.backgroundColor = UIColor.init(red: 222/255, green: 147/255, blue: 141/255, alpha: 1)

        return button
    }
    
    @objc func handleDropDown() {}
    
    
}
