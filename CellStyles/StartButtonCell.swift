//__FILENAME__  was created on __DATE__

import UIKit

class StartButtonCell: UITableViewCell {
    
    func createStartButtonCell() {
        self.backgroundColor = UIColor.init(red: 229/255, green: 187/255, blue: 175/255, alpha: 0.88)
        
        self.textLabel?.text = "Start"
        self.textLabel?.textColor = UIColor.blue
        self.textLabel?.adjustsFontForContentSizeCategory = true
        self.textLabel?.textAlignment = NSTextAlignment.center
        
        self.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    }
    
    func cellType() -> String {
        return "start"
    }
    
}
