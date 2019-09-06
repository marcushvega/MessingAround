//__FILENAME__  was created on __DATE__

import UIKit

class StartButtonCell: UITableViewCell {
    
    func createStartButtonCell() {
        self.backgroundColor = UIColor.init(red: 107/255, green: 255/255, blue: 151/255, alpha: 0.88)
        
        self.textLabel?.text = "Start"
        self.textLabel?.textColor = UIColor.blue
        self.textLabel?.adjustsFontForContentSizeCategory = true
        self.textLabel?.textAlignment = NSTextAlignment.center
        
        self.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    }
    
    func startTimer() {
        
    }
    
    func pauseTimer() {
        
    }
    
    func cancelTimer() {
        
        // before cancelling, a toast appears asking user whether they are sure they want to cancel session
        
    }
    
    func cellType() -> String {
        return "start"
    }
    
}
