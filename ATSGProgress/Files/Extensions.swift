//
//  Extensions.swift
//  Pods
//
//  Created by Antonio Serrano on 30/11/16.
//
//

import Foundation
import UIKit

extension UILabel {
    
    func height(text:String, width:CGFloat) -> CGFloat {
        
        
        let constrainedSize:CGSize = CGSize(width: width, height:CGFloat.greatestFiniteMagnitude);
        let attributesDictionary = NSDictionary(object: self.font, forKey: NSFontAttributeName as NSCopying)
        let requiredHeight:CGRect = text.boundingRect(with: constrainedSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributesDictionary as? [String : AnyObject], context: nil)
        
        return requiredHeight.size.height
    }
    
    func height(width:CGFloat) ->CGFloat{
        
        
        let constrainedSize:CGSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude);
        let attributesDictionary = [NSFontAttributeName:self.font!]
        let text = self.text != nil ? self.text! : ""
        let requiredHeight:CGRect = text.boundingRect(with: constrainedSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributesDictionary, context: nil)
        
        return requiredHeight.size.height
    }
    
}
