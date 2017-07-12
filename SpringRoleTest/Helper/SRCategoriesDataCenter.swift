import UIKit

enum AsyncResult<T> {
    case success(T)
    case failure(Error?)
}

class SRCategoriesDataCenter: NSObject {
    
    class var shared: SRCategoriesDataCenter {
        struct Static {
            static let instance: SRCategoriesDataCenter = SRCategoriesDataCenter()
        }
        return Static.instance
    }
    
    func getAppCategories(completion:@escaping (AsyncResult<AnyObject?>)->()) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://s3.amazonaws.com/recruiting-test/ios/category.json")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                completion(AsyncResult.failure(error))
            } else {
                if let wrapped = data {
                    do {
                        let unWrapped = try JSONSerialization.jsonObject(with: wrapped, options:JSONSerialization.ReadingOptions(rawValue: 0))
                        guard let array = unWrapped as? [Dictionary<String, Any>] else {
                            debugPrint("Not a Dictionary")
                            return
                        }
                        var responseArray:[SRCategories] = []
                        responseArray = array.map({ (dictionary) in
                            SRCategories.init(object: dictionary)
                        })
                        completion(AsyncResult.success(responseArray as AnyObject?))
                    }
                    catch let error as NSError {
                        completion(AsyncResult.failure(error))
                    }
                }
            }
        })
        dataTask.resume()
    }
    
}
