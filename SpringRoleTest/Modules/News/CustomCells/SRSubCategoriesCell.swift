//
//  SRSubCategoriesCell.swift
//  SpringRoleTest
//
//  Created by Ranjith Kumar on 7/12/17.
//  Copyright © 2017 Ranjith Kumar. All rights reserved.
//

import UIKit

class SRSubCategoriesCell: UITableViewCell {
    
    @IBOutlet weak var imageView_picture: UIImageView!
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_description: UILabel!

    //MARK: - Public functions
    class func reuseIdentifier() -> String {
        return "SRSubCategoriesCell"
    }
    
    public func feed(subCategory:SRSubcategories) {
        self.lbl_name.text = subCategory.subCategoryName
        self.lbl_description.text = subCategory.descriptionValue
        self.imageView_picture?.f22_setImage(urlString: subCategory.imageUrl, imageStyle: .squared)
    }
    
}
