//
//  LoginViewController.swift
//  TableView
//
//  Created by Claire De Guzman on 2020-03-04.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, loginDelegate {
    let cellId = "cellId"
    let login = "loginCellId"
    
    lazy var collectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
               layout.scrollDirection = .horizontal
               layout.minimumLineSpacing = 0
            
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
               cv.backgroundColor = UIColor(red: 246/255, green: 233/255, blue: 215/255, alpha: 1)
               cv.delegate = self
               cv.dataSource = self
               cv.isPagingEnabled = true
               
           return cv
           
           }()


       let pages: [Page] = {
           let firstPage = Page(imageName: "shopping", title: "YOUR HEALTH IS YOUR WEALTH" , message: "Find the healthiest option for your meal today!", backgroundColor: .white)
           let secondPage = Page(imageName: "talking", title: "A CONVERSATION, A COLLABORATION", message: "Share and brainstorm other healthy ideas with friends!",backgroundColor: .yellow)
           
           return [firstPage, secondPage]
       }()
       
       lazy var pageControl: UIPageControl = {
           let pc = UIPageControl()
           pc.pageIndicatorTintColor = .lightGray
           pc.currentPageIndicatorTintColor = UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1)
           pc.numberOfPages = self.pages.count + 2
           return pc
       }()
       
       let skipButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Skip", for: .normal)
           button.setTitleColor(UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1), for: .normal)
           button.addTarget(self, action:#selector(skip), for: .touchUpInside)
           return button
       }()
       
       @objc func skip(){
           pageControl.currentPage = pages.count - 1
           nextPage()
       }
       
       let nextButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Next", for: .normal)
           button.setTitleColor(UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1), for: .normal)
           button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
           return button
       }()
       
       @objc func nextPage() {
           
           if pageControl.currentPage == pages.count {
               return
           }
           
           if pageControl.currentPage == pages.count - 1 {
               moveControlConstraintsOffScreen()
               
               UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                              self.view.layoutIfNeeded()
                              }, completion: nil)
                      }
           
           let indexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
                  collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                  pageControl.currentPage += 1
           }
       
       
       @objc func generateNow(_cell: UICollectionViewCell, buttonTapped: UIButton) {
              self.performSegue(withIdentifier: "Generate", sender: nil)
          }
          
           
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           view.addSubview(collectionView)
           view.addSubview(pageControl)
           view.addSubview(skipButton)
           view.addSubview(nextButton)
           
           collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
          
          pageControlBottomAnchor =  pageControl.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 80) [1]
           
           skipButtonBottomAnchor = skipButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 130).first
           
           nextButtonBottomAnchor = nextButton.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 60, heightConstant: 130).first
     
           registerCells()
           
           
           
       }
       
       
       var pageControlBottomAnchor: NSLayoutConstraint?
       var skipButtonBottomAnchor: NSLayoutConstraint?
       var nextButtonBottomAnchor: NSLayoutConstraint?
       
     func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
           
           
           let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
           pageControl.currentPage = pageNumber
           
           if pageNumber == pages.count {
               moveControlConstraintsOffScreen()
               
           } else {
               
               pageControlBottomAnchor?.constant = 0
               skipButtonBottomAnchor?.constant = 0
               nextButtonBottomAnchor?.constant = 0
       
               
           }
           
           UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                 self.view.layoutIfNeeded()
               
           }, completion: nil)
                         
                       
       }
       
       fileprivate func moveControlConstraintsOffScreen() {
           pageControlBottomAnchor?.constant = 50
           skipButtonBottomAnchor?.constant = -80
           nextButtonBottomAnchor?.constant = -80
       }
       
       

     
       }

//MARK: - UICollectionViewDelegate

extension LoginViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
     
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
             return CGSize(width: view.frame.width, height: view.frame.height)
         }
         
        private func registerCells() {
         
         collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
         collectionView.register(Login.self, forCellWithReuseIdentifier: "loginCellId")
       
         
         }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count + 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // we're rendering our last login cell
        if indexPath.item == pages.count {
            
            let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: "loginCellId", for: indexPath) as! Login
            loginCell.loginButton.addTarget(self, action: #selector(generateNow(_cell:buttonTapped:)), for: .touchUpInside)
            return loginCell
                
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    
    }
         










}
