//__FILENAME__  was created on __DATE__

import UIKit

class AddTaskViewController: UIViewController, UITextFieldDelegate {

    var task: Task?
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var timeLimitLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var timeLimitPicker: UIDatePicker!
    @IBOutlet weak var timeDisplayLabel: UILabel!
    
    private var datePicker = UIDatePicker()
    
    let relativeFontConstant:CGFloat = 0.056
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubmitButton()
        
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .countDownTimer
        
        timeDisplayLabel.font = timeDisplayLabel.font.withSize(self.view.frame.height * relativeFontConstant)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddTaskViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        taskTitleTextField.delegate = self
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK: - View objects
    
    func setupTaskTitleLabel() {
        
    }
    
    func setuptaskTitleTextField() {
    
    }
    
    func setupTimeLimitLabel() {
        
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
