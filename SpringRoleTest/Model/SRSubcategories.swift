//
//  Subcategories.swift
//
//  Created by Ranjith Kumar on 7/12/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class SRSubcategories {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kSubcategoriesDescriptionValueKey: String = "description"
  private let kSubcategoriesSubCategoryNameKey: String = "subCategoryName"
  private let kSubcategoriesImageUrlKey: String = "ImageUrl"
  private let kSubcategoriesSubCategoryIdKey: String = "subCategoryId"

  // MARK: Properties
  public var descriptionValue: String?
  public var subCategoryName: String?
  public var imageUrl: String?
  public var subCategoryId: Int?

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
    descriptionValue = json[kSubcategoriesDescriptionValueKey].string
    subCategoryName = json[kSubcategoriesSubCategoryNameKey].string
    imageUrl = json[kSubcategoriesImageUrlKey].string
    subCategoryId = json[kSubcategoriesSubCategoryIdKey].int
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = descriptionValue { dictionary[kSubcategoriesDescriptionValueKey] = value }
    if let value = subCategoryName { dictionary[kSubcategoriesSubCategoryNameKey] = value }
    if let value = imageUrl { dictionary[kSubcategoriesImageUrlKey] = value }
    if let value = subCategoryId { dictionary[kSubcategoriesSubCategoryIdKey] = value }
    return dictionary
  }

}
