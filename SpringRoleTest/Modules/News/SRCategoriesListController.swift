//
//  SRCategoriesListController.swift
//  SpringRoleTest
//
//  Created by Ranjith Kumar on 7/12/17.
//  Copyright © 2017 Ranjith Kumar. All rights reserved.
//

import UIKit

class SRCategoriesListController: BaseController {
    
    @IBOutlet weak var tableView_categories: UITableView! {
        didSet{
            let nib:UINib = UINib.init(nibName: SRCategoriesCell.reuseIdentifier(), bundle: nil)
            self.tableView_categories.register(nib, forCellReuseIdentifier: SRCategoriesCell.reuseIdentifier())
            self.tableView_categories.delegate = self
            self.tableView_categories.dataSource = self
            self.tableView_categories.tableFooterView = UIView()
        }
    }
    var datasource:[SRCategories] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News"
        self.fetchCategories()
    }
    
    private func fetchCategories() {
        self.showLoadingView(with: "Loading...")
        SRCategoriesDataCenter.shared.getAppCategories { (result) in
            self.hideLoadingView()
            switch result {
            case .success(let response):
                if let response = response as? [SRCategories] {
                    self.datasource = response
                    DispatchQueue.main.async {
                        self.tableView_categories.reloadData()
                    }
                }
                break
            case .failure(let error):
                if let desc = error?.localizedDescription {
                    self.showAlert(with: desc)
                }
                break
            }
        }
    }
}

extension SRCategoriesListController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SRCategoriesCell = tableView.dequeueReusableCell(withIdentifier: SRCategoriesCell.reuseIdentifier(), for: indexPath) as! SRCategoriesCell
        cell.selectionStyle = .none
        let category = datasource[indexPath.row]
        cell.feed(category: category)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SRCategoriesCell.getHeight()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = datasource[indexPath.row]
        let subCategoryScene = SRSubCategoriesController()
        subCategoryScene.datasource = category
        self.navigationController?.pushViewController(subCategoryScene, animated: true)
    }
}
