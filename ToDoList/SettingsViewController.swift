//
//  SettingsViewController.swift
//  ToDoList
//
//  Created by Mahesha Rao on 12/12/16.
//  Copyright © 2016 Mahesha Rao. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var editVC : EditNotesViewController?
    var titleName : String?

    @IBOutlet weak var fontDisplayLabel: UILabel!
    @IBOutlet weak var fontLabel: UIStepper!
    @IBOutlet weak var notesFontDisplayLabel: UILabel!
    
   
    @IBOutlet weak var notesFontLabel: UIStepper!
    
    
    @IBAction func notesFontControl(_ sender: UIStepper) {
        
        notesFontDisplayLabel.text = String(Int(floor(sender.value)))
        editVC!.notesField.font = UIFont(name: "Verdana",size: CGFloat(sender.value))
        UserDefaults.standard.removeObject(forKey: titleName! + " Notes")
        UserDefaults.standard.set(sender.value, forKey: titleName! + " Notes")
        
    }
    
    
    @IBAction func fontControl(_ sender: UIStepper) {
        
        fontDisplayLabel.text = String(Int(floor(sender.value)))        
        editVC!.textField.font = UIFont(name: "Verdana",size: CGFloat(sender.value))
        UserDefaults.standard.removeObject(forKey: titleName! + " Title")
        UserDefaults.standard.set(sender.value, forKey: titleName! + " Title")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //first navigationcontroller will have table view controller from there we have to find the correct one
        let viewController0 = navigationController?.childViewControllers[1].childViewControllers[0]
        
        editVC = (viewController0 as! EditNotesViewController)
        
        titleName = (editVC?.holdkey)!
        
        if(UserDefaults.standard.double(forKey: titleName! + " Title") != 0) {
            fontLabel.value = UserDefaults.standard.double(forKey: titleName! + " Title")
        }else{
            fontLabel.value = 14
        }
        
        if(UserDefaults.standard.double(forKey: titleName! + " Notes") != 0) {
            notesFontLabel.value = UserDefaults.standard.double(forKey: titleName! + " Notes")
        }else{
            notesFontLabel.value = 14
        }
        
        fontDisplayLabel.text = String(Int(floor(fontLabel.value)))
        notesFontDisplayLabel.text = String(Int(floor(notesFontLabel.value)))
        
        
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
