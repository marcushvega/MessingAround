//__FILENAME__  was created on __DATE__

import UIKit
import CoreData
import AudioToolbox

class AddTaskViewController: UIViewController, UITextFieldDelegate {

    
    var taskItems: [NSManagedObject] = []
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var timeLimitLabel: UILabel!
    @IBOutlet weak var timeLimitTextField: TimeLimitTextField!
    @IBOutlet weak var submitButton: UIButton!
    
    private var timeLimitPicker = UIDatePicker()
    private var timeLimit: Int = 10
    
    let relativeFontConstant:CGFloat = 0.056
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // allows user to dismiss keyboard even if nothing was selected
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddTaskViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        setupTimeLimitPicker()
//        timeLimitPicker.setDate(NSDate (timeIntervalSinceReferenceDate: -10) as Date, animated: true)
        
        setupSubmitButton()
        setFontSize()
        setupTextFields()
    }
    
    // MARK: - Helper Functions
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        if (taskTitleTextField.text != nil && taskTitleTextField.text?.isEmpty == false && timeLimitTextField.text != nil && timeLimitTextField.text?.isEmpty == false) {
            submitButton.isEnabled = true
            submitButton.backgroundColor = UIColor.init(red: 60/255, green: 183/255, blue: 66/255, alpha: 0.6)
        }
        
        view.endEditing(true)
    }
    
    @objc func doneButtonTapped() {view.endEditing(true)}
    
    @objc func timeLimitChanged(timeLimitPicker: UIDatePicker) {
        timeLimit = Int(timeLimitPicker.countDownDuration)
        
        timeLimitTextField.text = String(format: "%02d:%02d:%02d", (timeLimit / 3600), (timeLimit % 3600 / 60), 0)
//        view.endEditing(true)
    }
    
    func save(taskName: String, taskTime: Int, completed: Bool = false) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "TaskItem", in: managedContext)!
        let taskItem = NSManagedObject(entity: entity, insertInto: managedContext)
        
        taskItem.setValue(taskName, forKey: "title")
        taskItem.setValue(taskTime, forKey: "time")
        taskItem.setValue(completed, forKey: "completed")
        
        do {
            try managedContext.save()
            taskItems.append(taskItem)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    // MARK: - View objects
    
    func setFontSize() {
        timeLimitTextField.font = timeLimitTextField.font?.withSize(self.view.frame.height * relativeFontConstant)
        taskTitleTextField.font = taskTitleTextField.font?.withSize(self.view.frame.height * relativeFontConstant)
        
//         timeLimitTextField.inputView = timeLimitPicker
    }
    
    func setupTextFields() {
        taskTitleTextField.returnKeyType = .done
        taskTitleTextField.delegate = self
        
        // Add done button to toolbar
        let toolbar = UIToolbar()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.items = [doneButton]
        toolbar.sizeToFit()
        
        timeLimitTextField.inputView = timeLimitPicker
        timeLimitTextField.inputAccessoryView = toolbar
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
        submitButton.layer.borderWidth = 2.5
        submitButton.layer.cornerRadius = 20
        submitButton.isEnabled = false

        submitButton.backgroundColor = UIColor.init(red: 176/255, green: 176/255, blue: 176/255, alpha: 0.6)
        
        submitButton.setTitleColor(UIColor.white, for: .normal)
        submitButton.setTitleColor(UIColor.red, for: .disabled)
    }

    
    // MARK: - Action Functions
    
    @IBAction func submitTaskToTaskList(_ sender: Any) {
        if (taskTitleTextField.text != nil && timeLimitTextField.text != nil && timeLimitTextField.text?.isEmpty == false) {
            save(taskName: taskTitleTextField.text!, taskTime: timeLimit / 60)
        }
    }
    
    // Done button was clicked
    @IBAction func primaryActionTriggered(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    // MARK: - Navigation
     @IBAction func goBackToTasksVC(_ sender: Any) {
        performSegue(withIdentifier: "unwindToTaskVC", sender: self)
     }
    
}

