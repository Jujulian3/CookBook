//
//  StepsViewController.swift
//  CookBook
//
//  Created by José Carlos Araújo on 14/06/2018.
//  Copyright © 2018 Juliane Cristina. All rights reserved.
//

import UIKit

class StepsViewController: UIViewController {
    
    

    @IBOutlet weak var recipeNameLbl: UILabel!
    @IBOutlet weak var recipeStepsTxt: UITextView!
    
    var recipeName = ""
    var recipeSteps = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeNameLbl.text = recipeName
        recipeStepsTxt.text = recipeSteps
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
