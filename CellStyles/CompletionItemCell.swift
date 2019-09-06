//__FILENAME__  was created on __DATE__

import UIKit

class CompletionItemCell: UITableViewCell {

//    @IBOutlet weak var completionStatusLabel: UILabel!
//    @IBOutlet weak var completionTitleLabel: UILabel!
    
    func createCompletionCell() {
        self.textLabel?.adjustsFontSizeToFitWidth = true
        self.textLabel?.adjustsFontForContentSizeCategory = true
        self.textLabel?.textColor = UIColor.blue
        self.textLabel?.text = "Completion Status:"
        
        self.detailTextLabel?.text = "INCOMPLETE"
        self.detailTextLabel?.textColor = UIColor.brown
        
        self.backgroundColor = UIColor.init(red: 107/255, green: 255/255, blue: 151/255, alpha: 0.88)

        //            completionCell.textLabel?.textAlignment = NSTextAlignment.right
        //            completionCell.detailTextLabel?.textAlignment = NSTextAlignment.right
        //            completionCell.backgroundColor = UIColor.magenta
    }
    
    func cellType() -> String {
        return "completion"
    }
}
