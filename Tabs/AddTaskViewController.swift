//__FILENAME__  was created on __DATE__

import UIKit
import CoreData

class AddTaskViewController: UIViewController, UITextFieldDelegate {

    var allTasks = TaskBank()
    var taskItems: [NSManagedObject] = []
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var timeLimitLabel: UILabel!
    @IBOutlet weak var timeLimitTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    private var timeLimitPicker = UIDatePicker()
    private var timeLimit: Int = 0
    
    let relativeFontConstant:CGFloat = 0.056
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTimeLimitPicker()
        
        // allows me to dismiss keyboard even if nothing was selected
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddTaskViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)

        setupSubmitButton()
        setupTimeLimitTextField()
        taskTitleTextField.delegate = self
    }
    
    // MARK: - Helper Functions
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func timeLimitChanged(timeLimitPicker: UIDatePicker) {
        timeLimit = Int(timeLimitPicker.countDownDuration)
        timeLimitTextField.text = String(format: "%02d:%02d:%02d", (timeLimit / 3600), (timeLimit % 3600 / 60))
        view.endEditing(true)
    }
    
    func save(taskName: String, taskTime: Int) {
        // create app delegate so we can later get the viewContext
        //   which in turn allows us to get stored info from some entity
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "TaskItem", in: managedContext)!
        let taskItem = NSManagedObject(entity: entity, insertInto: managedContext)
        
        taskItem.setValue(taskName, forKey: "title")
        taskItem.setValue(taskTime, forKey: "time")
        
        do {
            try managedContext.save()
            taskItems.append(taskItem)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    // MARK: - View objects
    
    func setupTimeLimitTextField() {
        timeLimitTextField.font = timeLimitTextField.font?.withSize(self.view.frame.height * relativeFontConstant)
        
         timeLimitTextField.inputView = timeLimitPicker
    }
    
    func setupTimeLimitPicker() {
        timeLimitPicker = UIDatePicker()
        timeLimitPicker.datePickerMode = .countDownTimer
        timeLimitPicker.minuteInterval = 5
        timeLimitPicker.addTarget(self, action: #selector(timeLimitChanged(timeLimitPicker:)), for: .valueChanged)
    }
    
    // restrict number of characters
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else {return false}
        
        let newText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return newText.count <= 25
    }
    
    func setupSubmitButton() {
//        submitButton.layer.borderColor =
        submitButton.layer.borderWidth = 2.5
        submitButton.layer.cornerRadius = 20
        submitButton.backgroundColor = UIColor.init(red: 60/255, green: 183/255, blue: 66/255, alpha: 0.6)
        submitButton.setTitleColor(UIColor.white, for: .normal)
        submitButton.setTitleColor(UIColor.red, for: .selected)
    }

    
    // MARK: - Action Functions
    
    @IBAction func submitTaskToTaskList(_ sender: Any) {
        if (taskTitleTextField.text != nil && timeLimitTextField.text != nil && timeLimitTextField.text?.isEmpty == false) {
            save(taskName: taskTitleTextField.text!, taskTime: timeLimit / 60)
//            allTasks.addTask(title: taskTitleTextField.text ?? "", inMinutes: timeLimit / 60)
        }
        else {
            print("Enter a Task Name.\nEnter a Time Limit for the task.")
        }
        
    }
    
    
    // MARK: - Navigation
     @IBAction func goBackToTasksVC(_ sender: Any) {
         performSegue(withIdentifier: "unwindToTaskVC", sender: self)
     }
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
