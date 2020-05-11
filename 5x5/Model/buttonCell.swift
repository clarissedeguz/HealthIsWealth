//
//  buttonCell.swift
//  TableView
//
//  Created by Claire De Guzman on 2020-02-26.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit

protocol createDataDelegate {
    func buttonClicked()
    
}


class ButtonCell: UITableViewCell {
    
    var createDataDg: createDataDelegate?
    
    var counter:Int = 0
    
    @IBAction func generateButton(_ sender: UIButton) {
    
        self.counter += 1
        
    createDataDg?.buttonClicked()
        
        if self.counter == 1 {
            
            sender.isEnabled = false
        }
    
    }
    
    
    }
    
  
         
            
    
        
        
    
    
    

