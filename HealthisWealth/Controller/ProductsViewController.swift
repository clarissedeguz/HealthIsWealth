//
//  ProductsViewController.swift
//  TableView
//
//  Created by Claire De Guzman on 2020-03-04.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    
    
    @IBOutlet weak var productLbl: UILabel!
    
    @IBOutlet weak var productImg: UIImageView!
    
    @IBOutlet weak var productTxt: UITextView!
    
    var prodImg = UIImage()
    var prodLbl = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        view.backgroundColor = .init(red: 246/255, green: 233/255, blue: 215/255, alpha: 1)
        productLbl.text = prodLbl
        productImg.image = prodImg
        setupTextView()
        
        
    }
    
    func setupTextView() {
        
        productTxt.backgroundColor = .init(red: 246/255, green: 233/255, blue: 215/255, alpha: 1)
        
        
    }
    
    
    
    
}
