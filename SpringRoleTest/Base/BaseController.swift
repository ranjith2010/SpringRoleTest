//
//  BaseController.swift
//  SpringRoleTest
//
//  Created by Ranjith Kumar on 7/12/17.
//  Copyright © 2017 Ranjith Kumar. All rights reserved.
//

import UIKit

class BaseController:UIViewController{
    internal var loadingView: LoadingView? }

extension BaseController{
    public func showLoadingView(with message:String) {
        self.loadingView = LoadingView.init(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        self.loadingView?.backgroundColor = UIColor.rgba(fromHex: 0xFFFFFF, alpha: 0.5)
        if (UIApplication.shared.keyWindow?.subviews.contains(self.loadingView!))! == false {
            UIApplication.shared.keyWindow?.addSubview(self.loadingView!)
        }
        UIApplication.shared.keyWindow?.bringSubview(toFront: self.loadingView!)
        
        if(message.isEmpty == false) {
            self.loadingView?.lblLoadingMessage?.text = message
        }
        self.loadingView?.startAnimatingLoader()
    }
    
    public func hideLoadingView() {
        DispatchQueue.main.async {
            // Safer zone to find the loading view and remove it from SuperView
            var found = false
            
            for subview in (UIApplication.shared.keyWindow?.subviews)! {
                if subview is LoadingView {
                    found = true
                    subview.removeFromSuperview()
                    break
                }
            }
            if !found {
                debugPrint("self.loading does not containt any superview")
            }
            
            self.loadingView?.removeFromSuperview()
            self.loadingView?.stopAnimatingLoader()
        }
    }
    func showAlert(with message:String) {
        let alertController = UIAlertController.init(title: "SpringRoleTest", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}

