//
//  Generate Cell.swift
//  TableView
//
//  Created by Claire De Guzman on 2020-02-25.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit

class GenerateCell : UITableViewCell {
    

    
    @IBOutlet weak var generateImage: UIImageView!
    
    @IBOutlet weak var generateCat: UILabel!
    
    @IBOutlet weak var imageName: UILabel!
    
    
    
    func setupCell (foodList: Generate) {
//        generateImage.image = foodList.image
        generateCat.text = foodList.category
        imageName.text = foodList.label
        

}
    
}
