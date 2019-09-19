//__FILENAME__  was created on __DATE__

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var playPauseBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var timer: Timer?
    var timeLeft = 10
    var timerIsPaused = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @objc func startTimer() {
        timeLeft -= 1
        
        // creates timer text for hh:mm:ss
        timerLabel.text = String(format: "%02d:%02d:%02d", (timeLeft /  3600), (timeLeft / 60), (timeLeft % 60))
        
        if (timeLeft <= 0 || timerIsPaused) {
            timer?.invalidate()
            timer = nil
        }
    }
    
    @IBAction func playOrPause(_ sender: Any) {
        if (timerIsPaused) {
            timerIsPaused = false
            print("Currently in playOrPause and timerIsPaused = \(timerIsPaused)")
        }
        else {
            timerIsPaused = true
            print("Currently in playOrPause and timerIsPaused = \(timerIsPaused)")
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
        
        print("I am in the playOrPause IBAction func")
        
    }
    
    @IBAction func cancelTimer(_ sender: Any) {
        timer?.invalidate()
        timer = nil
    }
    
}

