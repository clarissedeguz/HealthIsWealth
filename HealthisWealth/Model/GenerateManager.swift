//
//  GenerateManager.swift
//  TableView
//
//  Created by Claire De Guzman on 2020-04-18.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

//import Foundation
//
//protocol GenerateManagerDelegate {
//    
//}
//
//
//
//struct GenerateManager {
//    var delegate: GenerateManagerDelegate?
//    
//    let baseUrl = "http://192.168.1.133:3000/food?category=dna"
//    
//    
//    
//
//    }
//    
//   
//    
//    
//    func parseJSON(dnaData: Data) -> dnaModel? {
//        let decoder = JSONDecoder()
//    
//        do {
//            let decodedData = try decoder.decode(DNAData.self, from: dnaData)
//            let dnaList = decodedData.dna
//            let dnaListData = dnaModel(dnaList: dnaList)
//            return dnaListData
//            
//        } catch {
//            print(error)
//            return nil
//        }
//    
//    
//    
//    }
//    
//    
//    
//    
//
