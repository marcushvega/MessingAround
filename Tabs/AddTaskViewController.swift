//__FILENAME__  was created on __DATE__

import UIKit

class AddTaskViewController: UIViewController, UITextFieldDelegate {

    var task: Task?
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var timeLimitLabel: UILabel!
    @IBOutlet weak var timeLimitTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    private var timeLimitPicker = UIDatePicker()
    
    let relativeFontConstant:CGFloat = 0.056
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTimeLimitPicker()
        
        // allows us to dismiss keyboard even if nothing was selected
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
        let timeLeft:Int = Int(timeLimitPicker.countDownDuration)
        timeLimitTextField.text = String(format: "%02d:%02d:%02d", (timeLeft / 3600), (timeLeft % 3600 / 60))
        view.endEditing(true)
    }
    // MARK: - View objects
    
    func setupTaskTitleLabel() {
        
    }
    
    func setuptaskTitleTextField() {
    
    }
    
    func setupTimeLimitLabel() {
        
    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
