//
//  ViewController.swift
//  TableView
//
//  Created by Claire De Guzman on 2020-02-25.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit

class GenerateViewController: UIViewController, createDataDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var angiogenList: [Generate] = []
    var regenList: [Generate] = []
    var microbList: [Generate] = []
    var dnaFoodList: [Generate] = []
    var immunityList: [Generate] = []
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
    
    
    func buttonClicked() {
        createData()
        
        let randomizedAngio = randomizeItem(array: angiogenList)
        results.append(randomizedAngio)
        tableView.reloadData()
        alert()
        
        
    }
    
    
    func randomizeItem(array: [Generate]) -> Generate {
        
        let randomItem = Int.random(in: 0..<array.count)
        return array[randomItem]
        
    }
    
    
    
    func logic() {
        
        switch results.count {
        case 1:
            var randomizedRegen = randomizeItem(array: regenList)
            results.append(randomizedRegen)
            tableView.reloadData()
            alert()
        case 2:
            var randomizedMicrobi = randomizeItem(array: microbList)
            results.append(randomizedMicrobi)
            tableView.reloadData()
            alert()
        case 3:
            var randomizedDnaItem = randomizeItem(array: dnaFoodList)
            results.append(randomizedDnaItem)
            tableView.reloadData()
            alert()
        default:
            var randomizedImmun = randomizeItem(array: immunityList)
            results.append(randomizedImmun)
            tableView.reloadData()
        }
    }
    
    
    //
    func logicNo() {
        
        switch results.count {
        case 1:
            let indexPath = IndexPath(row: 0, section: 1)
            let randomAngiogen = randomizeItem(array: angiogenList)
            results[0] = randomAngiogen
            tableView.reloadRows(at: [indexPath], with: .automatic)
            alert()
        case 2:
            let indexPath = IndexPath(row: 1, section: 1)
            let randomRegen = randomizeItem(array: regenList)
            results[1] = randomRegen
            tableView.reloadRows(at: [indexPath], with: .automatic)
            alert()
        case 3:
            let indexPath = IndexPath(row: 2, section: 1)
            let randomMicrob = randomizeItem(array: microbList)
            results[2] = randomMicrob
            tableView.reloadRows(at: [indexPath], with: .automatic)
            alert()
        case 4:
            let indexPath = IndexPath(row: 3, section: 1)
            let randomDnaItem = randomizeItem(array: dnaFoodList)
            results[3] = randomDnaItem
            tableView.reloadRows(at: [indexPath], with: .automatic)
            alert()
        default:
            let indexPath = IndexPath(row: 4, section: 1)
            let randomImmun = randomizeItem(array: immunityList)
            results[4] = randomImmun
            tableView.reloadRows(at: [indexPath], with: .automatic)
            print(randomImmun)
            alert()
            
            
        }
    }
    
    
    func alert() {
        
        let alert = UIAlertController(title: "Hello", message: "Do you have this product?", preferredStyle: UIAlertController.Style.alert)
        
        let yes = UIAlertAction(title: "YES", style: UIAlertAction.Style.default, handler: { (ACTION) in
            
            
            self.logic()
            
            if self.results.count == 5 {
                alert.dismiss(animated: true, completion: nil)
            }
        })
        
        
        
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
        
        let angiogenName = ["almonds",
                            "anchovies",
                            "apple peel",
                            "apples - granny smith",
                            "apples - red delicious",
                            "apricot",
                            "arctic char",
                            "arugula",
                            "bamboo shoots",
                            "barley",
                            "beer",
                            "belgian endive",
                            "bigeye tuna",
                            "black bass",
                            "black beans",
                            "black plums",
                            "black raspberries",
                            "black tea",
                            "blackberries",
                            "blueberries",
                            "blueberries (dried)",
                            "bluefin tuna",
                            "bluefish",
                            "bok choy",
                            "bottarga",
                            "broccoli",
                            "broccoli rabe",
                            "cabbage",
                            "camembert cheese",
                            "caper",
                            "carrots",
                            "cashew",
                            "cauliflower",
                            "caviar (sturgeon)",
                            "chamomile tea",
                            "cherries",
                            "cherries (dried)",
                            "cherry tomatoes",
                            "chestnuts",
                            "chia seeds",
                            "chicken (dark meat)",
                            "chile peppers",
                            "cloudy apple cider",
                            "cockles (clams)",
                            "coffee",
                            "cranberries",
                            "cranberries (dried)",
                            "dark chocolate",
                            "eastern oysters",
                            "edam cheese",
                            "eggplant",
                            "emmenthal cheese",
                            "escarole",
                            "fiddleheads",
                            "fish roe (salmon)",
                            "flax seeds",
                            "frisee",
                            "ginseng",
                            "gouda cheese",
                            "gray mullet",
                            "green tea",
                            "guava",
                            "hake",
                            "halibut",
                            "jamon iberico de belota",
                            "jarlsberg cheese",
                            "jasmine green tea",
                            "john dory fish",
                            "kale",
                            "kimchi",
                            "kiwifruit",
                            "licorice root",
                            "lychee",
                            "macadamia nuts",
                            "mackerel",
                            "mangoes",
                            "manila clams",
                            "mediterranean sea bass",
                            "muenster cheese",
                            "navy beans",
                            "nectarine",
                            "olive oil (EVOO)",
                            "onions",
                            "oolong tea",
                            "oregano",
                            "pacific oysters",
                            "peaches",
                            "pecans",
                            "peppermint",
                            "pine nuts",
                            "pink grapefruits",
                            "pistachios",
                            "plums",
                            "pomegranates",
                            "pompano",
                            "proscuitto di parma",
                            "pumpkin seeds",
                            "puntarelle",
                            "radicchio",
                            "rainbow trout",
                            "raspberries",
                            "red black-skin tomatoes",
                            "redfish",
                            "red-leaf lettuce",
                            "red mullet",
                            "red wine - cabernet",
                            "romanesco",
                            "rosemary",
                            "rutabaga",
                            "salmon",
                            "san marzano tomatoes",
                            "sardine",
                            "sauerkraut",
                            "sea bream",
                            "sea cucumber",
                            "sencha green tea",
                            "sesame seeds",
                            "soy",
                            "spiny lobster",
                            "squash blossoms",
                            "squid ink",
                            "stilton cheese",
                            "strawberries",
                            "sutana raisins",
                            "sunflower seeds",
                            "swordfish",
                            "tangerine tomatoes",
                            "tardivo di treviso",
                            "tieguanyin green tea",
                            "tuna",
                            "turmeric",
                            "turnips",
                            "walnuts",
                            "watermelon",
                            "yellowtail fish"]
        
        
        for (index,angioTitle) in angiogenName.enumerated() {
            let angiogenItem = Generate(category: "Angiogenesis", label: angioTitle)
            angiogenList.append(angiogenItem)
            
            
        }
        
        let regenName = ["anchovies",
                         "apple peel",
                         "apple-granny",
                         "apple-red",
                         "apricots",
                         "arctic chard",
                         "bamboo shoots",
                         "barley",
                         "beer",
                         "belgian endive",
                         "bigeye tuna",
                         "bitter melon",
                         "black bass",
                         "black chokeberry",
                         "black plums",
                         "black raspberry",
                         "black tea",
                         "blackberries",
                         "blueberries",
                         "blueberries (dried)",
                         "bluefin tuna",
                         "bluefish",
                         "bottarga",
                         "capers",
                         "carrots",
                         "caviar (sturgeon)",
                         "celery",
                         "chamomile tea",
                         "cherries",
                         "cherries (dried)",
                         "chestnuts",
                         "chia seeds",
                         "chile peppers",
                         "chinese celery",
                         "cockles (clam)",
                         "coffee",
                         "collard greens",
                         "concord grape juice",
                         "cranberries",
                         "cranberries (dried)",
                         "dark chocolate",
                         "eastern oyster",
                         "eggplant",
                         "escarole",
                         "fiddleheads",
                         "fish roe (salmon)",
                         "flax seeds",
                         "frisee",
                         "ginseng",
                         "goji berries",
                         "grapes",
                         "gray mullet",
                         "green beans",
                         "green tea",
                         "hake",
                         "halibut",
                         "john dory (fish)",
                         "kale",
                         "kiwifruit",
                         "lychee",
                         "mackerel",
                         "mangoes",
                         "manila clams",
                         "mediterranean sea bass",
                         "mustard greens",
                         "nectarines",
                         "olive oil (EVOO)",
                         "onions",
                         "oregano",
                         "pacific oysters",
                         "peaches",
                         "peanuts",
                         "peppermint",
                         "persimmon",
                         "pistachios",
                         "plums",
                         "pomegranates",
                         "pompano (fish)",
                         "pumpkin seeds",
                         "puntarelle",
                         "purple potatoes",
                         "radicchio",
                         "rainbow trout",
                         "raspberries",
                         "razor clams",
                         "red leaf lettuce",
                         "red mullet",
                         "red wine - cabernet",
                         "redfish",
                         "rice bran ",
                         "rosemary",
                         "saffron",
                         "salmon",
                         "sardine",
                         "sea bass",
                         "sea bream",
                         "sea cucumber",
                         "sesame seeds",
                         "soy",
                         "spinach",
                         "spiny lobster",
                         "squash blossoms",
                         "squid ink",
                         "strawberries",
                         "sultana raisins",
                         "sunflower seeds",
                         "swiss chard",
                         "swordfish",
                         "tardivo di treviso",
                         "thyme",
                         "truffles",
                         "tuna",
                         "turmeric",
                         "walnuts",
                         "wasabi",
                         "watercress",
                         "whole grains",
                         "yellowtail (fish)"]
        
        
        for (index,regenTitle) in regenName.enumerated() {
            let regenItem = Generate(category: "Regeneration", label: regenTitle)
            regenList.append(regenItem)
            
        }
        
        let microbiName = ["apricot",
                           "arugula",
                           "asparagus",
                           "bamboo shoots",
                           "black beans",
                           "black tea",
                           "blueberries",
                           "bok choy",
                           "broccoli",
                           "cabbage",
                           "camembert cheese",
                           "carrots",
                           "cauliflower",
                           "chamomile tea",
                           "chanterelle mushrooms",
                           "cherries",
                           "chia seeds",
                           "chickpeas",
                           "chile peppers",
                           "coffee",
                           "concord grape juice",
                           "cranberries",
                           "cranberry juice",
                           "dark chocolate",
                           "eggplant",
                           "enoki mushrooms",
                           "escarole",
                           "fiddleheads",
                           "flax seeds",
                           "frisee",
                           "gouda cheese",
                           "green tea",
                           "kale",
                           "kimchi",
                           "kiwifruit",
                           "lentils",
                           "lion's mane mushrooms",
                           "lychee",
                           "maitake mushrooms",
                           "mangoes",
                           "morel mushrooms",
                           "navy beans",
                           "nectarines",
                           "olive oil (EVOO)",
                           "oolong tea",
                           "oyster mushrooms",
                           "pao cai",
                           "parmigiano - reggiano",
                           "peaches",
                           "peas",
                           "plums",
                           "pomegranate juice",
                           "porcini mushrooms",
                           "pumpernickel bread",
                           "pumpkin seeds",
                           "puntarelle",
                           "radicchio",
                           "red wine - cabernet",
                           "rutabaga",
                           "sauerkraut",
                           "sesame seeds",
                           "shiitake mushrooms",
                           "sourdough bread",
                           "squid ink",
                           "sunflower seeds",
                           "tardivo di treviso",
                           "tomatoes",
                           "turnips",
                           "walnuts",
                           "white button mushrooms",
                           "whole grains",
                           "yogurt"]
        
        
        for (index,microbiTitle) in microbiName.enumerated() {
            let microbiItem = Generate(category: "Microbiome", label: microbiTitle)
            microbList.append(microbiItem)
        }
        
        let dnaItemName = ["acerola",
                           "almond butter",
                           "almonds",
                           "anchovies",
                           "apricots",
                           "arctic char",
                           "arugula",
                           "bamboo shoots",
                           "bigeye tuna",
                           "black bass",
                           "black tea",
                           "blueberries",
                           "bluefin tuna",
                           "bluefish",
                           "bok choy",
                           "bottarga",
                           "brazill nuts",
                           "broccoli",
                           "broccoli rabe",
                           "broccoli sprouts",
                           "cabbage",
                           "camu camu",
                           "carrots",
                           "cashew butter",
                           "cashews",
                           "cauliflower",
                           "caviar",
                           "chamomile tea",
                           "cherries",
                           "cherry tomatoes",
                           "chestnuts",
                           "cockles (clam)",
                           "coffee",
                           "concord grape juice",
                           "dark chocolate",
                           "eastern oysters",
                           "eggplants",
                           "fiddleheads",
                           "fish roe (salmon)",
                           "flax seeds",
                           "grapejuice",
                           "gray mullet",
                           "green tea",
                           "guava",
                           "hake",
                           "halibut",
                           "hazelnuts",
                           "john dory (fish)",
                           "kale",
                           "kiwifruit",
                           "lychee",
                           "macademia nuts",
                           "mackerel",
                           "mangoes",
                           "manila clams",
                           "marjoram",
                           "mediterranean sea bass",
                           "mixed berry juice",
                           "nectarines",
                           "olive oil (EVOO)",
                           "oolong tea",
                           "orange juice",
                           "oranges",
                           "oyster sauce",
                           "pacific oysters",
                           "papaya",
                           "peaches",
                           "peanut butter",
                           "peanuts",
                           "pecan",
                           "peppermint",
                           "pine nuts",
                           "pink grapefruits",
                           "pistachios",
                           "plums",
                           "pompano",
                           "pumpkin seeds",
                           "rainbow trout",
                           "red black-skin toamtoes",
                           "red mullet",
                           "redfish",
                           "romanesco",
                           "rosemary",
                           "rutabaga",
                           "sage",
                           "salmon",
                           "san marano tomato",
                           "sardine",
                           "sea bass",
                           "sea bream",
                           "sea cucumber",
                           "sesame seeds",
                           "soy",
                           "spiny lobster",
                           "squash blossoms",
                           "squash seeds",
                           "squid ink",
                           "strawberries",
                           "sunflower seeds",
                           "swordfish",
                           "tahini",
                           "tangerine tomatoes",
                           "thyme",
                           "truffles",
                           "tuna",
                           "turmeric",
                           "turnips",
                           "walnuts",
                           "watermelon",
                           "yellowtail (fish)"]
        
        
        for (index, dnaItemTitle) in dnaItemName.enumerated() {
            let dnaItem = Generate(category: "DNA Protect", label: dnaItemTitle)
            dnaFoodList.append(dnaItem)
        }
        
        let immunName = ["acerola",
                         "aged garlic",
                         "apple-granny",
                         "apple-red",
                         "apple peel",
                         "apricots",
                         "arugula",
                         "bamboo shoots",
                         "barley",
                         "belgian endive",
                         "black plums",
                         "black raspberries",
                         "black tea",
                         "blackberries",
                         "blackberries (dried)",
                         "blueberries",
                         "blueberries (dried)",
                         "bok choy",
                         "broccoli",
                         "broccoli sprouts",
                         "cabbage",
                         "camu camu",
                         "capers",
                         "carrots",
                         "cauliflower",
                         "chamomile tea",
                         "chanterelle mushroom",
                         "cherries",
                         "cherries (dried)",
                         "cherry tomatoes",
                         "chestnuts",
                         "chia seeds",
                         "chile peppers",
                         "coffee",
                         "collard greens",
                         "concord grape juice",
                         "cranberries",
                         "canberies (dried)",
                         "cranberry juice",
                         "eggplant",
                         "enoki mushrooms",
                         "escarole",
                         "fiddleheads",
                         "flax seeds",
                         "frisee",
                         "ginseng",
                         "goji berries",
                         "grapefruits",
                         "green tea",
                         "guava",
                         "kale",
                         "kimchi",
                         "kiwifruit",
                         "licorice root",
                         "lychee",
                         "maitake mushrooms",
                         "mangoes",
                         "morel mushrooms",
                         "mustard greens",
                         "nectarines",
                         "olive oil (EVOO)",
                         "onions",
                         "orange juice",
                         "oranges",
                         "oysters mushrooms",
                         "pacific oysters",
                         "peaches",
                         "peppermint",
                         "plums",
                         "pomegranates",
                         "porcini mushrooms",
                         "pumpkin seeds",
                         "puntarelle",
                         "radicchio",
                         "raspberries",
                         "razor clams",
                         "red-leaf lettuce",
                         "red wine - Cabernet",
                         "romanesco",
                         "rosemary",
                         "rutabaga",
                         "saffron",
                         "sauerkrauft",
                         "sesame seeds",
                         "shitake mushrooms",
                         "spinach",
                         "squash blossoms",
                         "squid inks",
                         "strawberries",
                         "sultana raisins",
                         "swiss chard",
                         "tardivo di treviso",
                         "truffles",
                         "turmeric",
                         "turnips",
                         "walnuts",
                         "watercress",
                         "white button mushrooms"]
        
        
        for (index, immunTitle) in immunName.enumerated() {
            let immunItem = Generate(category: "Immunity", label: immunTitle)
            immunityList.append(immunItem)
        }
        
        
    }
    
    
    let doneButtonBottomAnchor: NSLayoutConstraint? = nil
    
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
    
    
    func tableViewSpecific() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        
    }
    
}
