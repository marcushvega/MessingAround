//__FILENAME__  was created on __DATE__

import UIKit
import CoreData

class DeleteTaskTVC: UITableViewController {

    var taskList: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = false
    }

    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aTaskCell", for: indexPath)
        
        cell.textLabel?.text = "THIS IS THE TITLE FOR row \(indexPath.row)"
        cell.textLabel?.adjustsFontForContentSizeCategory = true
        cell.accessoryType = .none
        
        return cell
    }
    
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        tableView.deselectRow(at: indexPath, animated: true)
    //
    //        // place checkmark on row if row selected had no checkmark
    //        if ()
    //        // remove checkmark from row if row selected had a checkmark
    //    }
        
    
    //    override func viewDidAppear(_ animated: Bool) {
    //        pullSavedData()
    //        print("here is viewDidAppear")
    //        print(pullSavedData())
    //    }
        
    //    func pullSavedData() {
    //        // pull up the application delegate and grab a reference to it
    //        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
    //            return
    //        }
    //
    //        // previously-pulled app delegate allows me to reference its persistence container
    //        //    its persistence container contains NSManagedObjectContext viewContext
    //        //    viewContext is needed to pull Core Data via an NSFetchRequest
    //        let managedContext = appDelegate.persistentContainer.viewContext
    //
    //        // NSFetchRequests have several qualifiers used to refine the set of results returned
    //        // NSEntityName is one of the qualifiers used to refine the set of results returned
    //        // create fetch request for entity TaskItem
    //        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TaskItem")
    //
    //        do {
    //            // give request to managedContext for it to fetch
    //            taskItems = try managedContext.fetch(fetchRequest)
    //        } catch let error as NSError {
    //            print("Could not fetch. \(error), \(error.userInfo)")
    //        }
    //
    //    }
        
    //    @IBAction func deleteTask(taskName: String, taskTime: Int) {
    //        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
    //            return
    //        }
    //
    //        let managedContext = appDelegate.persistentContainer.viewContext
    //        let entity = NSEntityDescription.entity(forEntityName: "TaskItem", in: managedContext)!
    //        let taskItem = NSManagedObject(entity: entity, insertInto: managedContext)
    //
    //        taskItem.setValue(taskName, forKey: "title")
    //        taskItem.setValue(taskTime, forKey: "time")
    //
    //        // delete said task
    //        managedContext.delete(taskItem)
    //
    ////        taskItems.remove(at: )
    //
    //    }

    
    
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























