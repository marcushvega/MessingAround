//__FILENAME__  was created on __DATE__

import UIKit

class AddTaskViewController: UIViewController {

    var task: Task?
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var timeLimitLabel: UILabel!
    @IBOutlet weak var timeLimitTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubmitButton()
    }
    
    // MARK: - View objects
    func setupTaskTitleLabel() {
        
    }
    
    func setuptaskTitleTextField() {
        
    }
    
    func setupTimeLimitLabel() {
        
    }
    
    func setupTimeLimitTextField() {
        
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
