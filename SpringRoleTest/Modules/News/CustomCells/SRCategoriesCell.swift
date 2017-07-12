//
//  SRCategoriesCell.swift
//  SpringRoleTest
//
//  Created by Ranjith Kumar on 7/12/17.
//  Copyright © 2017 Ranjith Kumar. All rights reserved.
//

import UIKit

class SRCategoriesCell: UITableViewCell {
    
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var imageView_picture: UIImageView!
    
    //MARK: - Public functions
    class func reuseIdentifier() -> String {
        return "SRCategoriesCell"
    }
    
    public func feed(category:SRCategories) {
        self.lbl_name.text = category.categoryName
        self.imageView_picture?.f22_setImage(urlString: category.imageUrl, imageStyle: .squared)
    }
    
    public class func getHeight()->CGFloat {
        return 60
    }
}
