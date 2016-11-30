//
//  ATSGProgress
//  ATSGLoader
//
//  Created by Antonio Serrano on 29/11/16.
//  Copyright © 2016 ASGAPPS. All rights reserved.
//

import UIKit

open class ATSGLoader: NSObject {
    
    static var backView:UIView?
    
    static open var font = UIFont(name: "HelveticaNeue", size: 13)
    static open var textColor = UIColor.white
    static open var backColor = UIColor.black
    static open var backSize:CGFloat  = 120
    static open var backRadius:CGFloat = 8
    
    static open func showLoadingViewWithMessage(msg: String? = nil){
        
        if backView != nil {
            
            dismiss()
            
        }
        
        // Create text label
        let messageLabel:UILabel = UILabel()
        messageLabel.font = font
        messageLabel.textColor = textColor
        messageLabel.textAlignment = NSTextAlignment.center
        messageLabel.text = msg != nil ? msg : ""
        messageLabel.numberOfLines = 0
        let messageLabelHeight = messageLabel.height(width: backSize - 16)
        messageLabel.frame = CGRect(x:8, y:72, width:backSize - 16, height:messageLabelHeight)
        
        //Calculate size of center parent view
        var sizeBackView:CGFloat = messageLabelHeight + 72.0 + 8.0
        if sizeBackView < backSize {
            messageLabel.frame.size.height = backSize - 80
            sizeBackView = backSize
        }
        sizeBackView = sizeBackView > (UIScreen.main.bounds.width - 32) ? UIScreen.main.bounds.width - 32 : sizeBackView
        
        
        // Create full transparent view
        backView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        backView!.backgroundColor = UIColor.clear
        
        // Create center parent view
        let messageBackView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: backSize, height: sizeBackView))
        messageBackView.layer.cornerRadius = backRadius
        messageBackView.layer.masksToBounds = true
        messageBackView.backgroundColor = backColor
        messageBackView.center = CGPoint(x:UIScreen.main.bounds.width / 2, y:UIScreen.main.bounds.height / 2)
        backView!.addSubview(messageBackView)
        
        // Create activity indicator
        let yPosIndicator = messageLabel.text != "" ? (sizeBackView - 40 - messageLabelHeight - 8)/2 : (sizeBackView - 40)/2
        let indicator:UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        indicator.frame = CGRect(x:(backSize - 40)/2, y:yPosIndicator, width:40, height:40)
        indicator.startAnimating()
        indicator.backgroundColor=UIColor.clear
        messageBackView.addSubview(indicator)
        
        // Add text label
        messageBackView.addSubview(messageLabel)
        
        // Display View
        displayView()
        
    }
    
    fileprivate static func displayView(){
        
        var window = UIApplication.shared.keyWindow
        if window == nil {
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                
                window = UIApplication.shared.keyWindow
                if window != nil {
                    window?.addSubview(backView!)
                } else {
                    displayView()
                }
            }
        
        }
    
    }
    
    static open func dismiss(){
        backView?.removeFromSuperview()
    }
}
