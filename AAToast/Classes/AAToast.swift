//
//  AAToast.swift
//  AAToast
//
//  Created by AaoIi on 1/4/16.
//  Copyright © 2016 Saad Albasha. All rights reserved.
//

import UIKit

class AAToast: UIView {
    
    // views
    @IBOutlet var toastViewShort: UIView!
    @IBOutlet private var toastViewLong: UIView!
    @IBOutlet private var toastLabelShort: UILabel!
    @IBOutlet private var toastLabelLong: UILabel!
    
    // variables
    private var view: UIView!
    private var timer : NSTimer!
    private var toastType : Type!
    private var toastColor : UIColor!
    enum Type:Int{
        case short = 0 , long = 1
    }
    
    
    init(frame: CGRect,title:String,duration:NSTimeInterval,type:Type) {
        super.init(frame: frame)
        self.toastType = type
        self.frame = CGRect(x: 0, y: self.frame.height - 104, width: self.frame.width, height: 104)
        xibSetup(title,duration: duration)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func xibSetup(title:String,duration:NSTimeInterval) {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = CGRect(x: 0, y: self.frame.height - 104, width: self.frame.width, height: 104)
        view.backgroundColor = .clearColor()
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        // setup view
        AAToast(title , duration: duration)
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "AAToastView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    
    
    private func AAToast(title:String,duration: NSTimeInterval){
        
        if toastType == .short {
            
            // setup view
            toastViewShort.backgroundColor = UIColor.blackColor()
            toastViewShort.alpha = 0.6
            toastViewShort.layer.cornerRadius = 25
            toastViewShort.layer.masksToBounds = true
            toastLabelShort.text = title
            toastLabelShort.textColor = UIColor.whiteColor()
            
            toastViewLong.hidden = true
            
            self.toastViewShort.alpha = 0.0
            UIView.animateWithDuration(1.0, delay: 0.0, options: [], animations: { () -> Void in
                
                self.toastViewShort.alpha = 0.6
                
                }) { (finished) -> Void in
                    
                    self.timer =  NSTimer.scheduledTimerWithTimeInterval(duration, target: self, selector: "invalidateTimer:", userInfo: nil, repeats: false)
            }
            
        }else {
            
            
            // setup view
            toastViewLong.backgroundColor = UIColor.blackColor()
            toastViewLong.alpha = 0.6
            toastViewLong.layer.cornerRadius = 25
            toastViewLong.layer.masksToBounds = true
            toastLabelLong.text = title
            toastLabelLong.textColor = UIColor.whiteColor()
            toastLabelLong.numberOfLines = 0
            
            toastViewShort.hidden = true
            
            
            self.toastViewLong.alpha = 0.0
            UIView.animateWithDuration(1.0, delay: 0.0, options: [], animations: { () -> Void in
                
                self.toastViewLong.alpha = 0.6
                
                }) { (finished) -> Void in
                    
                    self.timer =  NSTimer.scheduledTimerWithTimeInterval(duration, target: self, selector: "invalidateTimer:", userInfo: nil, repeats: false)
            }
        }
        
        
        
        
        
    }
    
    
    @objc private func invalidateTimer(sender:AnyObject){
        
        if let timer = sender as? NSTimer {
            timer.invalidate()
        }
        
        hide(1.0)
        
    }
    
    // MARK: Property setters
    
    func setTextColor(color:UIColor){
        if toastType == .short {
            self.toastLabelShort.textColor = color
        }else {
            self.toastLabelLong.textColor = color
        }
    }
    
    func setToastColor(color:UIColor){
        
        if toastType == .short {
            toastViewShort.backgroundColor = color
        }else {
            toastViewLong.backgroundColor = color
        }
        
    }
    
    
    // MARK: Hide Action
    
    private func hide(duration:NSTimeInterval){
        
        if toastType == .short {
            
            UIView.animateWithDuration(duration
                , delay: 0.0, options: [], animations: { () -> Void in
                    
                    self.toastViewShort.alpha = 0.0
                    
                }) { (finished) -> Void in
                    self.view.removeFromSuperview()
                    self.removeFromSuperview()
            }
            
        }else {
            
            UIView.animateWithDuration(duration
                , delay: 0.0, options: [], animations: { () -> Void in
                    
                    self.toastViewLong.alpha = 0.0
                    
                }) { (finished) -> Void in
                    self.view.removeFromSuperview()
                    self.removeFromSuperview()
            }
            
        }
    }
    
    
    
    
}
