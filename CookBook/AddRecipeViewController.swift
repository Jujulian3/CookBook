//
//  AddRecipeViewController.swift
//  CookBook
//
//  Created by José Carlos Araújo on 14/06/2018.
//  Copyright © 2018 Juliane Cristina. All rights reserved.
//

import UIKit

class AddRecipeViewController: UIViewController, UITextViewDelegate {

    
 
    @IBOutlet weak var recipeTitleLbl: UILabel!
    @IBOutlet weak var recipeStepsTxt: UITextView!
    @IBOutlet weak var salvarBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Titulo da Receita", message: "Informe o titulo da receita", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let label = alert!.textFields![0] // Force unwrapping because we know it exists.
            
            self.recipeTitleLbl.text = label.text
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(AddRecipeViewController.keyboardFrameChangeNotification(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    var offsetY:CGFloat = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @objc func keyboardFrameChangeNotification(notification: Notification) {
        if let userInfo = notification.userInfo {
            let endFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect
            let animationDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double ?? 0
            let animationCurveRawValue = (userInfo[UIKeyboardAnimationCurveUserInfoKey] as? Int) ?? Int(UIViewAnimationOptions.curveEaseInOut.rawValue)
            let animationCurve = UIViewAnimationOptions(rawValue: UInt(animationCurveRawValue))
            if let _ = endFrame, endFrame!.intersects(self.recipeStepsTxt.frame) {
                self.offsetY = self.recipeStepsTxt.frame.maxY - endFrame!.minY
                UIView.animate(withDuration: animationDuration, delay: TimeInterval(0), options: animationCurve, animations: {
                    self.recipeStepsTxt.frame.origin.y = self.recipeStepsTxt.frame.origin.y - self.offsetY
                }, completion: nil)
            } else {
                if self.offsetY != 0 {
                    UIView.animate(withDuration: animationDuration, delay: TimeInterval(0), options: animationCurve, animations: {
                        self.recipeStepsTxt.frame.origin.y = self.recipeStepsTxt.frame.origin.y + self.offsetY
                        self.offsetY = 0
                    }, completion: nil)
                }
            }
        }
    }
    
    
    
    @IBAction func newRecipeBtn(_ sender: Any) {
        
        let selectedName = aSelectedName[0]
        
        if (selectedName == 0) {
            meatRecipeName.append(recipeTitleLbl.text!)
            meatRecipeSteps.append(recipeStepsTxt.text)
        } else if(selectedName == 1){
            chickenRecipeName.append(recipeTitleLbl.text!)
            chickenRecipeSteps.append(recipeStepsTxt.text)
        }else if (selectedName==2) {
            fishRecipeName.append(recipeTitleLbl.text!)
            fishRecipeSteps.append(recipeStepsTxt.text)
        }else{
            dessertRecipeName.append(recipeTitleLbl.text!)
            dessertRecipeSteps.append(recipeStepsTxt.text)
        }
        
        let alertController = UIAlertController(title: "Informação", message:
            "Registro salvo com sucesso, retorne para a tela anterior", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
        
        salvarBtn.isEnabled = false
        recipeStepsTxt.isEditable = false
        recipeStepsTxt.isSelectable = false
        recipeStepsTxt.textColor = UIColor.gray
        
        self.present(alertController, animated: true, completion: nil)
        
        
        
    }
    
}
