//__FILENAME__  was created on __DATE__

import UIKit
import CoreData

class TasksViewController: UIViewController {

    // MARK: - Properties
    
    var taskItems: [NSManagedObject] = []
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tasksTableView: UITableView!
    
    let numberOfDetails = 2 // time limit & completion status
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dateLabel.text = getDate()
        tasksTableView.backgroundColor = UIColor(cgColor: CGColor.init(srgbRed: 160/255, green: 165/255, blue: 247/255, alpha: 1))
        pullSavedData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // show two buttons and a title on the navigation bar
        navigationItem.title = "Task List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteTaskFromList))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        pullSavedData()
        self.tasksTableView.reloadData()
    }
    
    
    // MARK: - Helper Functions
    @objc func addTask() {
        performSegue(withIdentifier: "addTaskSegue", sender: nil)
    }
    
    @objc func deleteTaskFromList() {
        performSegue(withIdentifier: "deleteTaskSegue", sender: nil)
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
    @IBAction func unwindToTasksVC(segue: UIStoryboardSegue) {}
}

    // MARK: - Extensions
extension TasksViewController: UITableViewDataSource, UITableViewDelegate {
    
    // TableView DataSource method
    // defines number of rows that will be in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfDetails + 1
    }
    
    // TableView DataSource method
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // assign text to the current cell in question
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "TaskItemCell")
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.adjustsFontForContentSizeCategory = true
        cell.textLabel?.textColor = UIColor.blue
        
        cell.backgroundColor = UIColor.init(red: 229/255, green: 187/255, blue: 175/255, alpha: 0.88)
        
        let task = taskItems[indexPath.section]
        
        if (indexPath.row == 0) {
            cell.textLabel?.text = "Time: "
            cell.detailTextLabel?.text = "\(task.value(forKeyPath: "time") ?? 22) minutes"
        }
            // create completion cell at each row 1
        else if (indexPath.row == 1) {
            let completionCell = CompletionItemCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "CompletionItemCell")
            completionCell.createCompletionCell()
            return completionCell
        }
            // create startButton cell at each row 2
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
            performSegue(withIdentifier: "startButtonSegue", sender: taskItems[indexPath.section].value(forKeyPath: "time") as? Int)
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
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return taskItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let task = taskItems[section]
        let button = UIButton(type: .system)
//        let trashImage = UIImage(systemName: "trash", withConfiguration: UIImage.SymbolConfiguration(pointSize: self.view.frame.height * 0.028, weight: .regular, scale: .large))
        
        button.setTitle(task.value(forKeyPath: "title") as? String, for: .normal)
        button.largeContentTitle = "\(task.value(forKeyPath: "title") as! String)"
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleDropDown), for: .touchUpInside)
        button.backgroundColor = UIColor.init(red: 222/255, green: 147/255, blue: 141/255, alpha: 1)
        
        return button
    }
    
    @objc func handleDropDown() {}
    
    
}
