//
//  Product Cell.swift
//  TableView
//
//  Created by Claire De Guzman on 2020-03-04.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit


class ProductCell: UITableViewCell {
    
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    
    var prodLbl = ""
   
    var prodImg = UIImage()
   
    init (label: String, image: UIImage) {
        self.lbl.text = prodLbl
        self.img.image = prodImg
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    }
    
   
    
    
    
    
    
    
    
    
    
    
    
}
