//__FILENAME__  was created on __DATE__

import UIKit
import CoreData

class DeleteTaskTVC: UITableViewController {

    var taskList: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pullSavedData()
        setupTableView()
//        self.clearsSelectionOnViewWillAppear = false
    }
    
    // MARK: - Setup UI Elements
    
    func setupTableView() {
        tableView.backgroundColor = UIColor(cgColor: CGColor.init(srgbRed: 160/255, green: 165/255, blue: 247/255, alpha: 1))
        tableView.rowHeight = 50
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationItem.title = "Swipe Row Left to Delete"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aTaskCell", for: indexPath)
        let task = taskList[indexPath.row]
        
        cell.textLabel?.text = "\(task.value(forKeyPath: "title") as! String)"
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.textColor = UIColor(cgColor: CGColor.init(srgbRed: 247/255, green: 247/255, blue: 247/255, alpha: 1))
        cell.backgroundColor = UIColor(cgColor: CGColor.init(srgbRed: 160/255, green: 165/255, blue: 247/255, alpha: 1))
        cell.accessoryType = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Code for Deleting a Section from the table
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            let itemToDelete = taskList[indexPath.row]
            let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            managedContext.delete(itemToDelete)
            taskList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Error: \(error)")
            }
        }
    }
        
    // MARK: - Using data for CoreData methods
    func pullSavedData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TaskItem")

        do {
            taskList = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
}

  


// MARK: - Things I don't need to be viewing yet
/*
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

    // Configure the cell...

    return cell
}
*/

/*
// Override to support conditional editing of the table view.
override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
}
*/

/*
// Override to support editing the table view.
override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        // Delete the row from the data source
        tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
*/

/*
// Override to support rearranging the table view.
override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

}
*/

/*
// Override to support conditional rearranging of the table view.
override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
}
*/























