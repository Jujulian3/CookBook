//
//  RecNamesTableViewController.swift
//  CookBook
//
//  Created by José Carlos Araújo on 14/06/2018.
//  Copyright © 2018 Juliane Cristina. All rights reserved.
//

import UIKit



class NamesTableViewController: UITableViewController {
    
    
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        self.tableView.reloadData()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var aux = 0
        let selectedName = aSelectedName[0]
        
        if (selectedName == 0) {
            aux = meatRecipeName.count
        } else if(selectedName == 1){
            aux = chickenRecipeName.count
        }else if (selectedName==2) {
            aux = fishRecipeName.count
        }else{
           aux = dessertRecipeName.count
        }
        
        return aux
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NamesCellTableViewCell
        
        let selectedName = aSelectedName[0]
        
        if (selectedName == 0) {
            cell.nameLbl.text = meatRecipeName[indexPath.row]
        } else if(selectedName == 1){
            cell.nameLbl.text = chickenRecipeName[indexPath.row]
        }else if (selectedName==2) {
            cell.nameLbl.text = fishRecipeName[indexPath.row]
        }else{
            cell.nameLbl.text = dessertRecipeName[indexPath.row]
        }
        
        return cell

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "StepsViewController") as? StepsViewController
        
        let selectedName = aSelectedName[0]
        
        if (selectedName == 0) {
            vc?.recipeName = meatRecipeName[indexPath.row]
            vc?.recipeSteps = meatRecipeSteps[indexPath.row]
        } else if(selectedName == 1){
            vc?.recipeName = chickenRecipeName[indexPath.row]
            vc?.recipeSteps = chickenRecipeSteps[indexPath.row]
        }else if (selectedName==2) {
            vc?.recipeName = fishRecipeName[indexPath.row]
            vc?.recipeSteps = fishRecipeSteps[indexPath.row]
        }else{
            vc?.recipeName = dessertRecipeName[indexPath.row]
            vc?.recipeSteps = dessertRecipeSteps[indexPath.row]
        }
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}
