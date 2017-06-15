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
    @IBOutlet fileprivate var toastViewLong: UIView!
    @IBOutlet fileprivate var toastLabelShort: UILabel!
    @IBOutlet fileprivate var toastLabelLong: UILabel!
    
    // variables
    fileprivate var view: UIView!
    fileprivate var timer : Timer!
    fileprivate var toastType : Type!
    fileprivate var toastColor : UIColor!
    enum `Type`:Int{
        case short = 0 , long = 1
    }
    
    
    init(frame: CGRect,title:String,duration:TimeInterval,type:Type) {
        super.init(frame: frame)
        self.toastType = type
        self.frame = CGRect(x: 0, y: self.frame.height - 104, width: self.frame.width, height: 104)
        xibSetup(title,duration: duration)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func xibSetup(_ title:String,duration:TimeInterval) {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = CGRect(x: 0, y: self.frame.height - 104, width: self.frame.width, height: 104)
        view.backgroundColor = .clear
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        // setup view
        AAToast(title , duration: duration)
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "AAToastView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    
    
    fileprivate func AAToast(_ title:String,duration: TimeInterval){
        
        if toastType == .short {
            
            // setup view
            toastViewShort.backgroundColor = UIColor.black
            toastViewShort.alpha = 0.6
            toastViewShort.layer.cornerRadius = 25
            toastViewShort.layer.masksToBounds = true
            toastLabelShort.text = title
            toastLabelShort.textColor = UIColor.white
            
            toastViewLong.isHidden = true
            
            self.toastViewShort.alpha = 0.0
            UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: { () -> Void in
                
                self.toastViewShort.alpha = 0.6
                
                }) { (finished) -> Void in
                    
                    self.timer =  Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(self.invalidateTimer(_:)), userInfo: nil, repeats: false)
            }
            
        }else {
            
            
            // setup view
            toastViewLong.backgroundColor = UIColor.black
            toastViewLong.alpha = 0.6
            toastViewLong.layer.cornerRadius = 25
            toastViewLong.layer.masksToBounds = true
            toastLabelLong.text = title
            toastLabelLong.textColor = UIColor.white
            toastLabelLong.numberOfLines = 0
            
            toastViewShort.isHidden = true
            
            
            self.toastViewLong.alpha = 0.0
            UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: { () -> Void in
                
                self.toastViewLong.alpha = 0.6
                
                }) { (finished) -> Void in
                    
                    self.timer =  Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(self.invalidateTimer(_:)), userInfo: nil, repeats: false)
            }
        }
        
        
        
        
        
    }
    
    
    @objc fileprivate func invalidateTimer(_ sender:AnyObject){
        
        if let timer = sender as? Timer {
            timer.invalidate()
        }
        
        hide(1.0)
        
    }
    
    // MARK: Property setters
    
    func setTextColor(_ color:UIColor){
        if toastType == .short {
            self.toastLabelShort.textColor = color
        }else {
            self.toastLabelLong.textColor = color
        }
    }
    
    func setToastColor(_ color:UIColor){
        
        if toastType == .short {
            toastViewShort.backgroundColor = color
        }else {
            toastViewLong.backgroundColor = color
        }
        
    }
    
    
    // MARK: Hide Action
    
    fileprivate func hide(_ duration:TimeInterval){
        
        if toastType == .short {
            
            UIView.animate(withDuration: duration
                , delay: 0.0, options: [], animations: { () -> Void in
                    
                    self.toastViewShort.alpha = 0.0
                    
                }) { (finished) -> Void in
                    self.view.removeFromSuperview()
                    self.removeFromSuperview()
            }
            
        }else {
            
            UIView.animate(withDuration: duration
                , delay: 0.0, options: [], animations: { () -> Void in
                    
                    self.toastViewLong.alpha = 0.0
                    
                }) { (finished) -> Void in
                    self.view.removeFromSuperview()
                    self.removeFromSuperview()
            }
            
        }
    }
    
    
    
    
}
