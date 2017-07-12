//
//  SRSubCategoriesController.swift
//  SpringRoleTest
//
//  Created by Ranjith Kumar on 7/12/17.
//  Copyright © 2017 Ranjith Kumar. All rights reserved.
//

import UIKit

class SRSubCategoriesController: UIViewController {
    @IBOutlet weak var tableView_subCategories: UITableView! {
        didSet{
            let nib:UINib = UINib.init(nibName: SRSubCategoriesCell.reuseIdentifier(), bundle: nil)
            self.tableView_subCategories.register(nib, forCellReuseIdentifier: SRSubCategoriesCell.reuseIdentifier())
            self.tableView_subCategories.delegate = self
            self.tableView_subCategories.dataSource = self
            self.tableView_subCategories.estimatedRowHeight = 70
            self.tableView_subCategories.rowHeight = UITableViewAutomaticDimension
            self.tableView_subCategories.tableFooterView = UIView()
        }
    }
    var datasource:SRCategories?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.datasource?.categoryName
    }
    
}

extension SRSubCategoriesController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = datasource?.subcategories?.count {
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SRSubCategoriesCell = tableView.dequeueReusableCell(withIdentifier: SRSubCategoriesCell.reuseIdentifier(), for: indexPath) as! SRSubCategoriesCell
        cell.selectionStyle = .none
        if let subCategory = datasource?.subcategories?[indexPath.row] {
            cell.feed(subCategory: subCategory)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
