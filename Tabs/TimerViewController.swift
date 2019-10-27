//__FILENAME__  was created on __DATE__

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var playPauseBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var timer: Timer?
    var initialTime = 1800
    var timeLeft = 1800
    var timerIsPaused = true
    
    let relativePointSizeConstant:CGFloat = 0.056

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTimerLabel()
        setupPlayPauseButton()
        setupCancelButton()
    }
    
    func setupTimerLabel() {
        timerLabel.layer.borderWidth = 1.1
        timerLabel.layer.cornerRadius = 30.0
        timerLabel.text = String(format: "%02d:%02d:%02d", (timeLeft / 3600), (timeLeft % 3600 / 60), (timeLeft % 60))
        timerLabel.backgroundColor = UIColor.white
        timerLabel.layer.masksToBounds = true
    }

    func setupPlayPauseButton() {
        let relativeConstant = self.view.frame.height * relativePointSizeConstant / 2
        let playPauseImageConfig = UIImage.SymbolConfiguration(pointSize: self.view.frame.height * relativePointSizeConstant, weight: .regular, scale: .large)
        let playImage = UIImage(systemName: "play.fill", withConfiguration: playPauseImageConfig)
        
        
        playPauseBtn.layer.borderWidth = 2.5
        playPauseBtn.layer.cornerRadius = 20
//        playPauseBtn.layer.borderColor = ????
        playPauseBtn.backgroundColor = UIColor.init(red: 60/255, green: 183/255, blue: 66/255, alpha: 0.8)
        playPauseBtn.imageEdgeInsets = UIEdgeInsets.init(top: relativeConstant / 2, left: relativeConstant, bottom: relativeConstant / 2, right: relativeConstant)
        
        // playPauseBtn starts out showing the "play" button
        playPauseBtn.setImage(playImage, for: .normal)

    }
    
    func setupCancelButton() {
        cancelBtn.layer.borderWidth = 2.5
        cancelBtn.layer.cornerRadius = 15
        cancelBtn.backgroundColor = UIColor.init(red: 229/255, green: 71/255, blue: 71/255, alpha: 0.8)
        cancelBtn.setTitleColor(UIColor.white, for: .normal)
    }
    
    @objc func startTimer() {
        timeLeft -= 1
        
        // creates timer text for hh:mm:ss
        timerLabel.text = String(format: "%02d:%02d:%02d", (timeLeft / 3600), (timeLeft % 3600 / 60), (timeLeft % 60))
        
        if (timeLeft <= 0 || timerIsPaused) {
            timer?.invalidate()
            timer = nil
        }
    }
    
    @IBAction func playOrPause(_ sender: Any) {
        let playPauseImageConfig = UIImage.SymbolConfiguration(pointSize: self.view.frame.height * relativePointSizeConstant, weight: .regular, scale: .large)
        let pauseImage = UIImage(systemName: "pause.fill", withConfiguration: playPauseImageConfig)
        let playImage = UIImage(systemName: "play.fill", withConfiguration: playPauseImageConfig)
        
        // if timer is not running then start timer
        if (timerIsPaused) {
            playPauseBtn.setImage(pauseImage, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
            timerIsPaused = false
        }
        // if timer is running then pause timer
        else {
            playPauseBtn.setImage(playImage, for: .normal)
            timer?.invalidate()
            timerIsPaused = true
        }
    }
    
    @IBAction func cancelTimer(_ sender: Any) {
        timer?.invalidate()    // cancels timer
        timer = nil
        timeLeft = initialTime       // resets time
        
        // resets time text
        timerLabel.text = String(format: "%02d:%02d:%02d", (timeLeft / 3600), (timeLeft % 3600 / 60), (timeLeft % 60))
    }
    
}

