//__FILENAME__  was created on __DATE__

import UIKit

class TimeLimitTextField: UITextField {
    
    // restrict set of characters allowed in text field to allow only numbers
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return string.rangeOfCharacter(from: invalidCharacters) == nil
    }
    
    // disable user's ability to paste text into TimeLimitTextField
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if (action == #selector(UIResponderStandardEditActions.paste(_:))){
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
    
}
