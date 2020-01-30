//__FILENAME__  was created on __DATE__

import UIKit

class StartButtonCell: UITableViewCell {
    
    func createStartButtonCell(completed: Bool, bgColor: UIColor) {
        self.backgroundColor = bgColor
        
        self.textLabel?.text = "Start"
        self.textLabel?.textColor = UIColor.blue
        self.textLabel?.adjustsFontForContentSizeCategory = true
        self.textLabel?.textAlignment = NSTextAlignment.center
        
        self.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
//        self.layer.borderColor = UIColor.white.cgColor
//        self.layer.cornerRadius = 15
//        self.layer.borderWidth = 5
    }
    
    func cellType() -> String {
        return "start"
    }
    
}
