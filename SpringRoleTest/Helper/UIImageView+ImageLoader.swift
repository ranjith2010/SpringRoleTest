import UIKit
import SDWebImage

enum ImageStyle:Int {
    case squared
    case rounded
}

extension UIImageView {
    
    func f22_setImage(urlString:String?,imageStyle:ImageStyle) {
        
        self.image = nil
        
        if (urlString?.characters.count)! < 1 {
            return
        }
        self.backgroundColor = UIColor.rgb(fromHex: 0xEDF0F1)
        
        if(imageStyle == .rounded) {
            self.layer.cornerRadius = self.frame.height/2
        }
        else if(imageStyle == .squared){
            self.layer.cornerRadius = 3.0
        }
        
        self.setShowActivityIndicator(true)
        self.setIndicatorStyle(.gray)
        
        if SDWebImageManager.shared().cachedImageExists(for: NSURL.init(string: urlString!) as URL!) {
            self.backgroundColor = .clear
            self.sd_setImage(with: NSURL.init(string: urlString!) as URL!)
            self.clipsToBounds = true
        }
        else {
            self.sd_setImage(with: NSURL.init(string: urlString!) as URL!, placeholderImage:nil, options: [.avoidAutoSetImage,.highPriority,.retryFailed,.delayPlaceholder], completed: { (image, error, cacheType, url) in
                if error == nil {
                    DispatchQueue.main.async {
                        self.backgroundColor = .clear
                        self.alpha = 0;
                        self.image = image
                        self.clipsToBounds = true
                        UIView.animate(withDuration: 0.5, animations: {
                            self.alpha = 1
                        })
                    }
                }
            })
        }
    }
}

extension UIColor {
    
    class func rgb(fromHex: Int) -> UIColor {
        let red =   CGFloat((fromHex & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((fromHex & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(fromHex & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    class func rgba(fromHex: Int, alpha: CGFloat) -> UIColor {
        let red =   CGFloat((fromHex & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((fromHex & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(fromHex & 0x0000FF) / 0xFF
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

