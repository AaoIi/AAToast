//
//  AAToast.swift
//  AAToast
//
//  Created by AaoIi on 1/4/16.
//  Copyright © 2016 Saad Albasha. All rights reserved.
//

import UIKit

public class AAToast: UIView {
    
    // views
    @IBOutlet fileprivate var toastLabel: UILabel!
    @IBOutlet private var contentView:UIView!
    @IBOutlet private weak var parentView:UIView!
    
    // variables
    private var timer : Timer!
    private var toastBackgroundColor : UIColor = .black
    private var toastTextColor : UIColor = .white
    private var toastFont : UIFont = UIFont.systemFont(ofSize: 17)
    
    //constants
    private let toastLabelLeftRightPadding : CGFloat = 20
    private let toastLabelTopBottomPadding : CGFloat = 16
    private var bottomPadding : CGFloat = 16
    
    //MARK:- Core
    
    /// initializer for toast
    ///
    /// - Parameters:
    ///   - view: the parent view so the toast will be added into it
    ///   - title: the passed text
    ///   - duration: toast show duration
    ///   - textColor: toast text color, default is white
    ///   - backgroundColor: toast background color, default is black
    ///   - font: text font, default is system with size 17
    public init(toView view: UIView,title:String,duration:TimeInterval,textColor:UIColor? = nil,backgroundColor:UIColor? = nil,font:UIFont? = nil) {
        super.init(frame: .zero)
        
        parentView = view
        commonInit()
        
        setTextColor(textColor)
        setBackgroundColor(backgroundColor)
        setFont(font)
        
        AAToast(title, duration: duration)
        
    }
    
    @available(*,unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// Make code availble for nib
    private func commonInit(){
        
        let bundle = Bundle(path: Bundle(for: self.classForCoder).path(forResource: "AAToast", ofType: "bundle")!)
        bundle?.loadNibNamed("AAToastView", owner: self, options: nil)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(contentView)
        self.backgroundColor = .clear
        
    }
    
    
    /// Deploy and animate the toast
    ///
    /// - Parameters:
    ///   - title: passed toast title
    ///   - duration: passed show duration
    fileprivate func AAToast(_ title:String,duration: TimeInterval){
        
        // setup view style
        contentView.backgroundColor = toastBackgroundColor
        contentView.alpha = 0.6
        
        //setup label
        toastLabel.text = title
        toastLabel.textColor = toastTextColor
        toastLabel.font = toastFont
        
        // calculate size and place toast at the bottom
        var safeAreaBottomPadding : CGFloat = 0
        
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            safeAreaBottomPadding = window?.safeAreaInsets.bottom ?? 0
        }
        
        let contentViewWidth = (self.parentView.frame.size.width) - (toastLabelLeftRightPadding * 2)
        let contentViewHeight = self.getTextSize(width: contentViewWidth) + toastLabelTopBottomPadding
        
        var frame = contentView.frame
        frame.origin.y = (self.parentView.frame.size.height) - contentViewHeight - safeAreaBottomPadding - bottomPadding
        frame.origin.x = toastLabelLeftRightPadding
        frame.size.width = contentViewWidth
        frame.size.height = contentViewHeight
        self.contentView.frame = frame
        
        // add corner radius
        contentView.layer.cornerRadius = contentView.frame.height / 2
        contentView.layer.masksToBounds = true
        
        // perform animation
        self.contentView.alpha = 0.0
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: { () -> Void in
            
            self.contentView.alpha = 0.6
            
        }) { (finished) -> Void in
            
            self.timer =  Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(self.invalidateTimer(_:)), userInfo: nil, repeats: false)
        }
        
    }
    
    @objc fileprivate func invalidateTimer(_ sender:AnyObject){
        
        if let timer = sender as? Timer {
            timer.invalidate()
        }
        
        hideToast(1.0)
    }
    
    // MARK: Hide Action
    
    fileprivate func hideToast(_ duration:TimeInterval){
        
        UIView.animate(withDuration: duration
            , delay: 0.0, options: [], animations: { () -> Void in
                
                self.contentView.alpha = 0.0
                
        }) { (finished) -> Void in
            self.contentView.removeFromSuperview()
            self.removeFromSuperview()
        }
        
    }
    
    /// Responsible to show the toast
    public func show(){
        
        parentView.addSubview(self)
        
    }
    
    // MARK: Property setters
    
    public func setTextColor(_ color:UIColor?){
        guard let color = color else {return}
        self.toastTextColor = color
    }
    
    public func setBackgroundColor(_ color:UIColor?){
        guard let color = color else {return}
        self.toastBackgroundColor = color
    }
    
    /// Modify toast font size and style
    ///
    /// - Parameter font: custom font, defaults to system(17)
    public func setFont(_ font:UIFont?){
        guard let font = font else {return}
        self.toastFont = font
    }
    
    /// To adjust bottom padding for custom view controllers
    ///
    /// - Parameter value: padding value from bottom, defaults to 16
    public func setBottomPadding(_ value:CGFloat?){
        guard let value = value else {return}
        self.bottomPadding = value
    }
    
    //MARK:- Helpers
    
    private func getTextSize(width:CGFloat)->CGFloat{
        
        let font = UIFont.systemFont(ofSize: toastFont.pointSize + 3)
        let textHeight = self.calculateHeight(text: self.toastLabel.text!, font: font, width: width)
        
        return textHeight
    }
    
    private func calculateHeight(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        
        let textView = UITextView(frame: .zero)
        textView.font = font
        textView.text = text
        textView.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, width), height: newSize.height)
        textView.frame = newFrame
        
        return textView.frame.height
        
    }
    
}
