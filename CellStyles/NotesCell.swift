//__FILENAME__  was created on __DATE__

import UIKit

class NotesCell: UITableViewCell {

    func createNotesCell() {
        self.backgroundColor = UIColor.init(red: 107/255, green: 255/255, blue: 151/255, alpha: 0.88)
        self.textLabel?.text = "Notes"
        
        self.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    }
    
    func goToDetailsView() {
        
    }
}
