//
//  CategoryTableViewController.swift
//  CookBook
//
//  Created by José Carlos Araújo on 13/06/2018.
//  Copyright © 2018 Juliane Cristina. All rights reserved.
//

import UIKit

var category:[String] = DataBase.sCategory
var meatRecipeName:[String] = DataBase.sMeatRecipesName
var meatRecipeSteps:[String] = DataBase.sMeatRecipeStep
var chickenRecipeName:[String] = DataBase.sChickenRecipesName
var chickenRecipeSteps:[String] = DataBase.sChickenRecipeStep
var fishRecipeName:[String] = DataBase.sFishRecipesName
var fishRecipeSteps:[String] = DataBase.sFishhRecipeStep
var dessertRecipeName:[String] = DataBase.sDessertRecipesName
var dessertRecipeSteps:[String] = DataBase.sDessertRecipeStep
var aSelectedName:[Int] = [0]

class CategoryTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellTableViewCell
        cell.titleLbl.text = category[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let tvc = storyboard?.instantiateViewController(withIdentifier: "NamesTableViewController") as? NamesTableViewController
        aSelectedName.remove(at: 0)
        aSelectedName.append(indexPath.row)
        tvc?.title = "Receitas de " + category[indexPath.row]
        
        self.navigationController?.pushViewController(tvc!, animated: true)
        
    }
}
