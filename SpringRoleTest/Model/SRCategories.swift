//
//  Categories.swift
//
//  Created by Ranjith Kumar on 7/12/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class SRCategories {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kCategoriesCategoryNameKey: String = "CategoryName"
  private let kCategoriesImageUrlKey: String = "ImageUrl"
  private let kCategoriesSubcategoriesKey: String = "Subcategories"
  private let kCategoriesCategoryIdKey: String = "CategoryId"

  // MARK: Properties
  public var categoryName: String?
  public var imageUrl: String?
  public var subcategories: [SRSubcategories]?
  public var categoryId: Int?

  // MARK: SwiftyJSON Initalizers
  /**
   Initates the instance based on the object
   - parameter object: The object of either Dictionary or Array kind that was passed.
   - returns: An initalized instance of the class.
  */
  convenience public init(object: Any) {
    self.init(json: JSON(object))
  }

  /**
   Initates the instance based on the JSON that was passed.
   - parameter json: JSON object from SwiftyJSON.
   - returns: An initalized instance of the class.
  */
  public init(json: JSON) {
    categoryName = json[kCategoriesCategoryNameKey].string
    imageUrl = json[kCategoriesImageUrlKey].string
    if let items = json[kCategoriesSubcategoriesKey].array { subcategories = items.map { SRSubcategories(json: $0) } }
    categoryId = json[kCategoriesCategoryIdKey].int
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = categoryName { dictionary[kCategoriesCategoryNameKey] = value }
    if let value = imageUrl { dictionary[kCategoriesImageUrlKey] = value }
    if let value = subcategories { dictionary[kCategoriesSubcategoriesKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = categoryId { dictionary[kCategoriesCategoryIdKey] = value }
    return dictionary
  }

}
