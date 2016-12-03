//
//  ATSGProgress
//  ATSGLoader
//
//  Created by Antonio Serrano on 29/11/16.
//  Copyright © 2016 ASGAPPS. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

public enum IndicatorStyle {

    case blank
    case ballPulse
    case ballGridPulse
    case ballClipRotate
    case squareSpin
    case ballClipRotatePulse
    case ballClipRotateMultiple
    case ballPulseRise
    case ballRotate
    case cubeTransition
    case ballZigZag
    case ballZigZagDeflect
    case ballTrianglePath
    case ballScale
    case lineScale
    case lineScaleParty
    case ballScaleMultiple
    case ballPulseSync
    case ballBeat
    case lineScalePulseOut
    case lineScalePulseOutRapid
    case ballScaleRipple
    case ballScaleRippleMultiple
    case ballSpinFadeLoader
    case lineSpinFadeLoader
    case triangleSkewSpin
    case pacman
    case ballGridBeat
    case semiCircleSpin
    case ballRotateChase
    case orbit
    case audioEqualizer
    
    init(raw:Int){
        
        switch raw {
        case 0: self = IndicatorStyle.blank;
        case 1: self = IndicatorStyle.ballPulse;
        case 2: self = IndicatorStyle.ballGridPulse;
        case 3: self = IndicatorStyle.ballClipRotate;
        case 4: self = IndicatorStyle.squareSpin;
        case 5: self = IndicatorStyle.ballClipRotatePulse;
        case 6: self = IndicatorStyle.ballClipRotateMultiple;
        case 7: self = IndicatorStyle.ballPulseRise;
        case 8: self = IndicatorStyle.ballRotate;
        case 9: self = IndicatorStyle.cubeTransition;
        case 10: self = IndicatorStyle.ballZigZag;
        case 11: self = IndicatorStyle.ballZigZagDeflect;
        case 12: self = IndicatorStyle.ballTrianglePath;
        case 13: self = IndicatorStyle.ballScale;
        case 14: self = IndicatorStyle.lineScale;
        case 15: self = IndicatorStyle.lineScaleParty;
        case 16: self = IndicatorStyle.ballScaleMultiple;
        case 17: self = IndicatorStyle.ballPulseSync;
        case 18: self = IndicatorStyle.ballBeat;
        case 19: self = IndicatorStyle.lineScalePulseOut;
        case 20: self = IndicatorStyle.lineScalePulseOutRapid;
        case 21: self = IndicatorStyle.ballScaleRipple;
        case 22: self = IndicatorStyle.ballScaleRippleMultiple;
        case 23: self = IndicatorStyle.ballSpinFadeLoader;
        case 24: self = IndicatorStyle.lineSpinFadeLoader;
        case 25: self = IndicatorStyle.triangleSkewSpin;
        case 26: self = IndicatorStyle.pacman;
        case 27: self = IndicatorStyle.ballGridBeat;
        case 28: self = IndicatorStyle.semiCircleSpin;
        case 29: self = IndicatorStyle.ballRotateChase;
        case 30: self = IndicatorStyle.orbit;
        case 31: self = IndicatorStyle.audioEqualizer;

        default:self = IndicatorStyle.blank;
        }
    
    }

}

open class ATSGProgress: NSObject {
    
    static var backView:UIView?
    
    static open var font = UIFont(name: "HelveticaNeue", size: 13)
    static open var textColor = UIColor.white
    static open var backColor = UIColor.black
    static open var backSize:CGFloat  = 120
    static open var backRadius:CGFloat = 8
    static open var indicatorStyle:IndicatorStyle?
    static open var indicatorColor:UIColor?
    
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
        
        //Custom
        let indicatorFrame = CGRect(x:(backSize - 40)/2, y:yPosIndicator, width:40, height:40)
        if indicatorStyle != nil {
            
            let indicator = NVActivityIndicatorView(frame: indicatorFrame, type: getStyle(style: indicatorStyle!), color: indicatorColor, padding: nil)
            indicator.startAnimating()
            indicator.backgroundColor=UIColor.clear
            messageBackView.addSubview(indicator)
            
        } else { // Default
        
            let indicator:UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
            indicator.frame = CGRect(x:(backSize - 40)/2, y:yPosIndicator, width:40, height:40)
            indicator.startAnimating()
            indicator.backgroundColor=UIColor.clear
            messageBackView.addSubview(indicator)
        
        }
        
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
        
        } else {
            window?.addSubview(backView!)
        }
    
    }
    
    static open func dismiss(){
        backView?.removeFromSuperview()
    }
    
    static func getStyle(style:IndicatorStyle) -> NVActivityIndicatorType? {
    
        switch style {

        case IndicatorStyle.blank:                  return NVActivityIndicatorType.blank;
        case IndicatorStyle.ballPulse:              return NVActivityIndicatorType.ballPulse;
        case IndicatorStyle.ballGridPulse:          return NVActivityIndicatorType.ballGridPulse;
        case IndicatorStyle.ballClipRotate:         return NVActivityIndicatorType.ballClipRotate;
        case IndicatorStyle.squareSpin:             return NVActivityIndicatorType.squareSpin;
        case IndicatorStyle.ballClipRotatePulse:    return NVActivityIndicatorType.ballClipRotatePulse;
        case IndicatorStyle.ballClipRotateMultiple: return NVActivityIndicatorType.ballClipRotateMultiple;
        case IndicatorStyle.ballPulseRise:          return NVActivityIndicatorType.ballPulseRise;
        case IndicatorStyle.ballRotate:             return NVActivityIndicatorType.ballRotate;
        case IndicatorStyle.cubeTransition:         return NVActivityIndicatorType.cubeTransition;
        case IndicatorStyle.ballZigZag:             return NVActivityIndicatorType.ballZigZag;
        case IndicatorStyle.ballZigZagDeflect:      return NVActivityIndicatorType.ballZigZagDeflect;
        case IndicatorStyle.ballTrianglePath:       return NVActivityIndicatorType.ballTrianglePath;
        case IndicatorStyle.ballScale:              return NVActivityIndicatorType.ballScale;
        case IndicatorStyle.lineScale:              return NVActivityIndicatorType.lineScale;
        case IndicatorStyle.lineScaleParty:         return NVActivityIndicatorType.lineScaleParty;
        case IndicatorStyle.ballScaleMultiple:      return NVActivityIndicatorType.ballScaleMultiple;
        case IndicatorStyle.ballPulseSync:          return NVActivityIndicatorType.ballPulseSync;
        case IndicatorStyle.ballBeat:               return NVActivityIndicatorType.ballBeat;
        case IndicatorStyle.lineScalePulseOut:      return NVActivityIndicatorType.lineScalePulseOut;
        case IndicatorStyle.lineScalePulseOutRapid: return NVActivityIndicatorType.lineScalePulseOutRapid;
        case IndicatorStyle.ballScaleRipple:        return NVActivityIndicatorType.ballScaleRipple;
        case IndicatorStyle.ballScaleRippleMultiple: return NVActivityIndicatorType.ballScaleRippleMultiple;
        case IndicatorStyle.ballSpinFadeLoader:     return NVActivityIndicatorType.ballSpinFadeLoader;
        case IndicatorStyle.lineSpinFadeLoader:     return NVActivityIndicatorType.lineSpinFadeLoader;
        case IndicatorStyle.triangleSkewSpin:       return NVActivityIndicatorType.triangleSkewSpin;
        case IndicatorStyle.pacman:                 return NVActivityIndicatorType.pacman;
        case IndicatorStyle.ballGridBeat:           return NVActivityIndicatorType.ballGridBeat;
        case IndicatorStyle.semiCircleSpin:         return NVActivityIndicatorType.semiCircleSpin;
        case IndicatorStyle.ballRotateChase:        return NVActivityIndicatorType.ballRotateChase;
        case IndicatorStyle.orbit:                  return NVActivityIndicatorType.orbit;
        case IndicatorStyle.audioEqualizer:         return NVActivityIndicatorType.audioEqualizer;

        }
    
    }
}
