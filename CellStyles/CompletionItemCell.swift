//__FILENAME__  was created on __DATE__

import UIKit
import CoreData

class CompletionItemCell: UITableViewCell {

//    @IBOutlet weak var completionStatusLabel: UILabel!
//    @IBOutlet weak var completionTitleLabel: UILabel!
    
    func createCompletionCell(completed: Bool, bgColor: UIColor) {
        self.textLabel?.adjustsFontSizeToFitWidth = true
        self.textLabel?.adjustsFontForContentSizeCategory = true
        self.textLabel?.textColor = UIColor.blue
        self.textLabel?.text = "Completion Status:"
        
        self.backgroundColor = bgColor
        
        if (completed) {
            self.detailTextLabel?.text = "COMPLETE"
            
        }
        else {
            self.detailTextLabel?.text = "INCOMPLETE"
        }
        
        self.detailTextLabel?.textColor = UIColor.black
    }
    
    func cellType() -> String {
        return "completion"
    }
}
