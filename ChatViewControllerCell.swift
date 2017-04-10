//
//  ChatViewControllerCell.swift
//  chatOffset
//
//  Created by Viktor Willmann on 10.04.17.
//  Copyright © 2017 Viktor Willmann. All rights reserved.
//

import Foundation
import UIKit

class ChatViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var chatBubble: UIView!
    @IBOutlet weak var chatText: UILabel!
    @IBOutlet weak var sendDate: UILabel!
    var indexPath = 0
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        chatBubble.layer.cornerRadius = 8
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }
}
