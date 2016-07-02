//
//  iphone6Adapter.swift
//  SmartShop
//
//  Created by Alfred on 16/4/16.
//  Copyright © 2016年 开发者. All rights reserved.
//

import UIKit

let iPhoneWidth=UIScreen.mainScreen().bounds.size.width
let iPhoneHeigt=UIScreen.mainScreen().bounds.size.height
var UserID : String!
{
    
     return (NSUserDefaults.standardUserDefaults().objectForKey("userId") as? String!)!

}
//var MD5code : String!
//{
//    get{
//     return NSString.md5(String(format: "%@-%@", UserID, "KEY"))
//    }
//}



let autoSizeScale : CGFloat = iPhoneWidth/375

public func CGRectMakeiphone6Adapter (x:CGFloat,_ y:CGFloat,_ width:CGFloat, _ height:CGFloat) -> CGRect {

    let rect : CGRect = CGRect(x: x*autoSizeScale ,y: y*autoSizeScale,width: width*autoSizeScale,height: height*autoSizeScale)
    
    return rect;
    
}

public func CGSizeMakeiphone6Adapter (width:CGFloat, _ height:CGFloat) -> CGSize {
    
    let size : CGSize = CGSize(width: width*autoSizeScale,height: height*autoSizeScale)
    
    return size;
    
}

public func CGHeightMakeiphone6Adapter (height:CGFloat) -> CGFloat {
    
    let Height : CGFloat =  height*autoSizeScale
    
    return Height;
    
}

public class UImyViewSetting {

    var bottonHeight:CGFloat
    
    func myViewtoUIView(begin:CGFloat,_ height:CGFloat)->UIView{
        let myView:UIView=UIView.init(frame: CGRectMakeiphone6Adapter(0, begin, 375, height))
        myView.backgroundColor=UIColor.whiteColor()
        return myView
    }
    
    init(bottonHeight:CGFloat) {
        self.bottonHeight=bottonHeight
    }
    
}

extension UIView{
    func myUIView(begin:CGFloat,_ height:CGFloat)->UIView{
        frame = CGRectMakeiphone6Adapter(0, begin, 375, height)
        self.backgroundColor=UIColor.whiteColor()
        return self
    }
    func addLabel(frame:CGRect,_ text:String!,_ size:CGFloat,_ alignment:NSTextAlignment,_ color:UIColor) -> UILabel! {
        
        let label:UILabel=UILabel.init(frame: frame)
        label.font=UIFont.systemFontOfSize(size)
        label.textAlignment=alignment
        label.text=text
        label.textColor=color
        self.addSubview(label)
        return label
    }
    func addImageView(frame:CGRect,_ image:String!) -> UIImageView {
        let imageView = UIImageView.init(frame: frame)
        if (image != nil) {
            imageView.image = UIImage.init(named: image)
        }
        imageView.userInteractionEnabled = true;
        self.addSubview(imageView);
        return imageView;
    }
}

extension UILabel{
    convenience init(addtoView:UIView,_ labelFrame:CGRect,_ labelText:String,_ fontSize:CGFloat) {
        self.init(frame: labelFrame)
        self.myUIlabel(addtoView, labelFrame, labelText, fontSize)
    }
    func myUIlabel(addtoView:UIView,_ labelFrame:CGRect,_ labelText:String,_ fontSize:CGFloat)->UILabel{
        
        self.text=labelText
        self.font=UIFont.systemFontOfSize(fontSize)
        addtoView.addSubview(self)
        
        return self
    }
}

public class mySwiftButton : UIButton{
    public var price:String!
    public init(frame: CGRect,price:String) {
        super.init(frame:frame)
        self.price=price
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}



public let wxNet:WxSwiftNet = WxSwiftNet()
public class WxSwiftNet {
    
    func WxSwiftNetGet(urlString:String, success:(AnyObject)->Void, failse:(NSError)->Void) {
        let manager:AFHTTPSessionManager = AFHTTPSessionManager.init()
        manager.responseSerializer = AFCompoundResponseSerializer.init()
        print("\(urlString)")
        manager.GET(urlString, parameters: nil, progress: nil, success: { (task, respondObject) in
            var JSON:AnyObject;
            do {
                try
                    JSON =  NSJSONSerialization.JSONObjectWithData(respondObject as! NSData, options: NSJSONReadingOptions.MutableContainers)
                //                print("\(JSON)")
                success(JSON)
            }catch{
                
            }
            
            
        }) { (task, error) in
            
            failse(error)
            
        }
    }
    
    func WxSwiftNetPost(urlString:String, param:NSDictionary , success:(AnyObject)->Void, failse:(NSError)->Void) {
        let manager:AFHTTPSessionManager = AFHTTPSessionManager.init()
        manager.responseSerializer = AFCompoundResponseSerializer.init()
        print("\(urlString)")
        manager.POST(urlString, parameters: param, progress: nil, success: { (task, respondObject) in
            var JSON:AnyObject;
            do {
                try
                    JSON =  NSJSONSerialization.JSONObjectWithData(respondObject as! NSData, options: NSJSONReadingOptions.MutableContainers)
                //                print("\(JSON)")
                success(JSON)
            }catch{
                
            }
            
        }) { (task, error) in
            
            failse(error)
        }
    }
    
}



public class iphone6Adapter: NSObject {
    
}
