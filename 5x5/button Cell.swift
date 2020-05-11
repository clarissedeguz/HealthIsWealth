//
//  button Cell.swift
//  TableView
//
//  Created by Claire De Guzman on 2020-02-25.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit



class ButtonCell: UITableViewCell {
    
    var link: GenerateViewController?
    
    
    @IBAction func generateButton(_ sender: Any) {
   
        func generateData() {
            
            link?.createData(cell: self)
        }
       
    
    
    }
    
    
    
}


