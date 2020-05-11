//
//  ViewController.swift
//  TableView
//
//  Created by Claire De Guzman on 2020-02-25.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class GenerateViewController: UIViewController, createDataDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    private let networkingClient = NetworkingClient()
   
    
         var fruitsList: [Generate] = []
         var drinksList: [Generate] = []
         var snacksList: [Generate] = []
         var mealsList: [Generate] = []
         var veggiesList: [Generate] = []
         var results: [Generate] = []
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 246/255, green: 233/255, blue: 215/255, alpha: 1)
        tableViewSpecific()
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.addSubview(doneButton)
        doneButtonSpecific()
        
            }
        
    
    override func viewWillAppear(_ animated: Bool) {
    navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

  func randomizeItem(array: [Generate]) -> Generate {
    
   let randomItem = Int.random(in: 0..<array.count)
       return array[randomItem]
  }
    
    func buttonClicked() {
        createData()
    }
        
    

    func logic() {

               if results.count == 1 {
                
                print("Task 1 processing")

                var drinksLabel: [String] = []
                   
                networkingClient.gatherData(category: "immun") { (json, Error) in
                    if let error = Error {
                   print(error)
                    } else if let json = json {
                   drinksLabel = json
                
                        for (index, drinksTitle) in drinksLabel.enumerated() {
                        let drinkItem = Generate(category: "immun", label: drinksTitle)
                        self.drinksList.append(drinkItem)
                 print("Task 1 Done")
                            print(self.drinksList)
                   }
                   
               }
                    
                    DispatchQueue.main.async {
                    print("task 2 go")
                        var randomizedS = self.randomizeItem(array: self.drinksList)
                        self.results.append(randomizedS)
                      
                        self.tableView.reloadData()
                      
                        self.alert()
                    }
                
                 
                
        }
        }
                

        else if self.results.count <= 2 {

                    var snacksLabel: [String] = []

                        networkingClient.gatherData(category: "microb") {(json, Error) in
                        if let error = Error {
                            print(error)

                        } else if let json = json {

                            snacksLabel = json

                            for (index, snacksTitle) in snacksLabel.enumerated() {
                                let snackItem = Generate(category: "microb", label: snacksTitle)
                                self.snacksList.append(snackItem)

                            }



                        }

                            DispatchQueue.main.async {

                                var randomizedS = self.randomizeItem(array: self.snacksList)
                                self.results.append(randomizedS)

                               self.tableView.reloadData()

                                self.alert()

                            }

                    }

               } else if self.results.count <= 3 {


                        var mealsLabel: [String] = []

                        networkingClient.gatherData(category: "angio") {(json, Error) in
                        if let error = Error {
                            print(error)

                        } else if let json = json {

                            mealsLabel = json

                            for (index, mealsTitle) in mealsLabel.enumerated() {
                                let mealsItem = Generate(category: "angio", label: mealsTitle)
                               self.mealsList.append(mealsItem)


                            }

                            }

                            DispatchQueue.main.async {
                                var randomizedM = self.randomizeItem(array: self.mealsList)
                                self.results.append(randomizedM)

                            self.tableView.reloadData()

                                self.alert()

                            }

                        }


               } else if self.results.count <= 4 {


                      var veggiesLabel: [String] = []

                    networkingClient.gatherData(category: "regen") {(json, Error) in
                      if let error = Error {
                      print(error)

                          } else if let json = json {

                          veggiesLabel = json

                          for (index, veggiesTitle) in veggiesLabel.enumerated() {
                          let veggiesItem = Generate(category: "regen", label: veggiesTitle)
                            self.veggiesList.append(veggiesItem)


                          }
                              }

                        DispatchQueue.main.async {
                        var randomizedV = self.randomizeItem(array: self.veggiesList)
                        self.results.append(randomizedV)

                            self.tableView.reloadData()
                            self.alert()


                        }
                                  }



                }


        }

        
        func logicNo() {
                
        
            
               if self.results.count == 1 {

                    let indexPath = IndexPath(row: 0, section: 1)
                    let randomFruit = self.randomizeItem(array: self.fruitsList)
                    self.results[0] = randomFruit
                    self.tableView.reloadRows(at: [indexPath], with: .automatic)

                     self.alert()

               } else if self.results.count == 2 {

                    let indexPath = IndexPath(row: 1, section: 1)
                    let randomDrink = self.randomizeItem(array: self.drinksList)
                    self.results[1] = randomDrink
                   self.tableView.reloadRows(at: [indexPath], with: .automatic)
                     self.alert()


               } else if self.results.count == 3 {

                    let indexPath = IndexPath(row: 2, section: 1)
                    let randomSnack = self.randomizeItem(array: self.snacksList)
                   self.results[2] = randomSnack
                    self.tableView.reloadRows(at: [indexPath], with: .automatic)

                   self.alert()
                }

               else if self.results.count == 4 {

                    let indexPath = IndexPath(row: 3, section: 1)
                    let randomMeal = self.randomizeItem(array: self.mealsList)
                self.results[3] = randomMeal
                    self.tableView.reloadRows(at: [indexPath], with: .automatic)

                    self.alert()

               }  else if self.results.count == 5 {

                    let indexPath = IndexPath(row: 4, section: 1)
                    let randomVeggies = self.randomizeItem(array: self.veggiesList)
                    self.results[4] = randomVeggies
                    self.tableView.reloadRows(at: [indexPath], with: .automatic)
                    print(randomVeggies)
                   self.alert()

                }
            
            
            }
    
    func alert() {

        let alert = UIAlertController(title: "Hello", message: "Do you have this product?", preferredStyle: UIAlertController.Style.alert)

           let yes = UIAlertAction(title: "YES", style: UIAlertAction.Style.default, handler: { (ACTION) in


          self.logic()
            
               alert.dismiss(animated: true, completion: nil)})

               print("YES")

           let no = (UIAlertAction(title: "NO", style: UIAlertAction.Style.default, handler: { (ACTION) in

           self.logicNo()

               alert.dismiss(animated: true, completion: nil)}));
               print("NO")


           self.present(alert, animated: true, completion: nil)

           alert.addAction(yes)
           alert.addAction(no)


    }


    
    
func createData() {
    
    
     print(Thread.current)
     
     var fruitsLabel: [String] = []
     
         networkingClient.gatherData(category: "dna") {(json, Error) in
         if let error = Error {
             print(error)
             
         } else if let json = json {
             
            fruitsLabel = json
             
             for (index, fruitsTitle) in fruitsLabel.enumerated() {
                 let fruitItem = Generate(category: "dna", label: fruitsTitle)
                self.fruitsList.append(fruitItem)
                print("Task 2 in the process")
                
                }
   
              
             
         }
            DispatchQueue.main.async {
                 let randomizedFruit = self.randomizeItem(array: self.fruitsList)
                    self.results.append(randomizedFruit)
                           
                    self.tableView.reloadData()
                    print(Thread.current)
                           
                    self.alert()
                                            
            }
            
                    
     }
              
                }
                
                  

var doneButtonBottomAnchor: NSLayoutConstraint?
    
    func doneButtonSpecific() {
        var doneButtonBottomAnchor = doneButton.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: -30, leftConstant: 80, bottomConstant: 0, rightConstant: 10, widthConstant: 60, heightConstant: 130).first
    }

let doneButton: UIButton = {
                 let doneButton = UIButton(type: .system)
                 doneButton.setTitle("Done", for: .normal)
                 doneButton.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), for: .normal)
                 doneButton.addTarget(self, action: #selector(generateList), for: .touchUpInside)
                 return doneButton
       }()




  @objc func generateList() {


           if results.count == 5  {

            let okalert = UIAlertController(title: "Today's list:", message: "\(results[0].label) \n \(results[1].label) \n \(results[2].label) \n \(results[3].label) \n \(results[4].label)", preferredStyle: UIAlertController.Style.alert)
                   let ok = UIAlertAction(title: "Okay!", style: UIAlertAction.Style.default, handler: { (ACTION) in okalert.dismiss(animated: true, completion: nil)})

               print("YES")

               okalert.addAction(ok)
               self.present(okalert, animated: true, completion: nil)



               }

}

}

    
    

//MARK: - UITableViewDelegate

extension GenerateViewController: UITableViewDelegate, UITableViewDataSource {
    


func numberOfSections(in tableView: UITableView) -> Int {
      return 2
          
      
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
      if section == 0 {
          return 1
          
      } else  {
        return results.count
      }
  
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      if indexPath.section == 0 {
           let buttonCell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as! ButtonCell
         
          buttonCell.createDataDg = self
          
          buttonCell.backgroundColor = UIColor.clear
          
          
          return buttonCell
          
      } else {
      
          
          
      let cell = tableView.dequeueReusableCell(withIdentifier: "generateCell", for: indexPath) as! GenerateCell
          
          cell.backgroundColor = .init(red: 246/255, green: 233/255, blue: 215/255, alpha: 1)
          
        let randomGrocery = results[indexPath.row]
          cell.setupCell(foodList: randomGrocery)
      

      return cell
      
         
      }
  
  }

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let vc = storyboard?.instantiateViewController(identifier: "ProductsViewController") as? ProductsViewController
      
//      vc?.prodImg = results[indexPath.row].image
    vc?.prodLbl = results[indexPath.row].label
      
       self.navigationController?.pushViewController(vc!, animated: true)
      
  }
    
    func tableViewSpecific() {
          tableView.delegate = self
          tableView.dataSource = self
          tableView.backgroundColor = UIColor.clear
          self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
          
      }
       
}
