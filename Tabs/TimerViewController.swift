//__FILENAME__  was created on __DATE__

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var playPauseBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var timer: Timer?
    var timeLeft = 10
    var paused = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @objc func startTimer() {
        timeLeft -= 1
        
        // creates timer text for hh:mm:ss
        timerLabel.text = String(format: "%02d:%02d:%02d", (timeLeft /  3600), (timeLeft / 60), (timeLeft % 60))
        
        if (timeLeft <= 0) {
            timer?.invalidate()
            timer = nil
        }
    }
    
    @objc func pauseTimer() {
        
    }
    
    @IBAction func playOrPause(_ sender: Any) {
        
        if (paused) {
            // pauses the timer
            timer?.invalidate()
            paused = true
        }
        
        if (!paused) {
            // starts the timer
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
            paused = false
        }
        
    }
    

}

