//
//  ChatController.swift
//  chatOffset
//
//  Created by Viktor Willmann on 10.04.17.
//  Copyright © 2017 Viktor Willmann. All rights reserved.
//

import Foundation
import UIKit

class ChatController: UITableViewController
{

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if(indexPath.row % 2 == 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myMessage", for: indexPath) as! ChatViewControllerCell
            
            cell.indexPath = indexPath.row
            cell.chatText.text = "hello"
            cell.sendDate.text = "11.12.2018"
            return cell
        }else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "yourMessage", for: indexPath) as! ChatViewControllerCell
            
            cell.indexPath = indexPath.row
            cell.chatText.text = "test"
            cell.sendDate.text = "13.12.2019"
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

}
