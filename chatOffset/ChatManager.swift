//
//  ChatManager.swift
//  chatOffset
//
//  Created by Viktor Willmann on 10.04.17.
//  Copyright © 2017 Viktor Willmann. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
}

class ChatManager: UIViewController
{
    
    @IBOutlet weak var sendButtonBottom: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    var tableViewChat: ChatController?
    var currentKeyboardHeight : CGFloat = 0.0

    
    override func viewDidLoad() {
         self.hideKeyboardWhenTappedAround()
         registerForKeyboardNotifications()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "chatEmbed")
        {
            tableViewChat = segue.destination as! ChatController
        }
    }

    func registerForKeyboardNotifications(){
        //Adding notifies on keyboard appearing
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func deregisterFromKeyboardNotifications(){
        //Removing notifies on keyboard appearing
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func getKeyBoardHeight(_ notification: Notification) -> CGFloat {
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        return keyboardRectangle.height
    }
    
    func getKeyboardAnimationDuration(_ notification: Notification) -> Double {
        let userInfo : NSDictionary = notification.userInfo! as NSDictionary
        let keyBoardDuration = userInfo.value(forKey: UIKeyboardAnimationDurationUserInfoKey) as! Double
        return keyBoardDuration
    }
    
    func getKeyboardAnimationCurve(_ notification: Notification) -> NSNumber {
        let userInfo : NSDictionary = notification.userInfo! as NSDictionary
        let keyboardCurve = userInfo.value(forKey: UIKeyboardAnimationCurveUserInfoKey) as! NSNumber
        return keyboardCurve
    }
    
    func keyboardWasShown(_ notification: Notification){

        let keyboardHeight    = getKeyBoardHeight(notification)
        let animationDuration = getKeyboardAnimationDuration(notification)
        let animationCurve    = getKeyboardAnimationCurve(notification)
        
        let offset = max(currentKeyboardHeight, keyboardHeight)
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(animationDuration)
        UIView.setAnimationCurve(UIViewAnimationCurve(rawValue: animationCurve.intValue)!)
        
        UIView.setAnimationBeginsFromCurrentState(true)
        
        view.frame.origin.y = -offset
        
        UIView.commitAnimations()
        currentKeyboardHeight = keyboardHeight

    }
    
    func keyboardWillBeHidden(_ notification: Notification) {
        let animationDuration = getKeyboardAnimationDuration(notification)
        let animationCurve    = getKeyboardAnimationCurve(notification)
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(animationDuration)
        UIView.setAnimationCurve(UIViewAnimationCurve(rawValue: animationCurve.intValue)!)
        UIView.setAnimationBeginsFromCurrentState(true)
        
        view.frame.origin.y = 0.0
        
        
        UIView.commitAnimations()
    }
}


