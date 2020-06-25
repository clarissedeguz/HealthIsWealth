//
//  NetworkingClient.swift
//  TableView
//
//  Created by Claire De Guzman on 2020-04-28.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON



class NetworkingClient {
    
    typealias webServiceResponse = ([String]?, Error?) -> Void

      func gatherData(category: String, completionHandler: @escaping webServiceResponse ) {
          
      
          let baseURL = "http://192.168.1.133:3000/food?category=\(category)"
          var dataResults: [String]?
          
          AF.request(baseURL).responseJSON { response in
                     switch response.result {
                     case.success(let value):
                         let json = JSON(value)
                         dataResults = json.arrayValue.map
                         {$0.stringValue}
                         completionHandler(dataResults!, nil)
                         
                         
                     case .failure(let error):
                         print(error)
                         completionHandler(nil, error as NSError)
                     }
                 }
          
      }
      
    
      
    
}
