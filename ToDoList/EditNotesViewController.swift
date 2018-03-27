//
//  EditNotesViewController.swift
//  ToDoList
//
//  Created by Mahesha Rao on 12/11/16.
//  Copyright © 2016 Mahesha Rao. All rights reserved.
//

import UIKit

class EditNotesViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var notesField: UITextView!
    @IBOutlet weak var saveButtonLabel: UIButton!
    
    var singleDict:Dictionary<String,String> = [:]
    var holdkey : String? = nil
    var removeDict:Dictionary<String,String> = [:]
    
    var displayFont : Double?
    
    var alert = UIAlertController(title: "Alert", message: "Title Cannot Be Empty!!", preferredStyle: UIAlertControllerStyle.alert)

    @IBAction func editNotes(_ sender: Any) {
        
        saveButtonLabel.isHidden = false
        textField.isUserInteractionEnabled = true
        notesField.isUserInteractionEnabled = true
        notesField.alpha = 1.0
        
    }
    @IBAction func saveNotes(_ sender: Any) {
        
        if(textField.text! == ""){
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            removeDict.removeValue(forKey: holdkey!)
            UserDefaults.standard.removeObject(forKey: "Every")
            removeDict[textField.text!] = notesField.text
            UserDefaults.standard.set(removeDict, forKey: "Every")
            UserDefaults.standard.synchronize()
            self.navigationController!.popToRootViewController(animated: true)
            
        }
        
    }
    @IBAction func deleteNotes(_ sender: Any) {
        
        removeDict.removeValue(forKey: holdkey!)
        UserDefaults.standard.removeObject(forKey: "Every")
        UserDefaults.standard.removeObject(forKey: holdkey! + " Notes")
        UserDefaults.standard.removeObject(forKey: holdkey! + " Title")
        UserDefaults.standard.set(removeDict, forKey: "Every")        
        UserDefaults.standard.synchronize()
        self.navigationController!.popToRootViewController(animated: true)
    }
    
    func displayTitle(){
        
        if(UserDefaults.standard.double(forKey: holdkey! + " Title") != 0) {
            displayFont = UserDefaults.standard.double(forKey: holdkey! + " Title")
            
        }else{
            displayFont = 14
        }
        
        textField.font = UIFont(name: "Verdana",size: CGFloat(displayFont!))
    }
    
    func displayNotes(){
        
        if(UserDefaults.standard.double(forKey: holdkey! + " Notes") != 0) {
            displayFont = UserDefaults.standard.double(forKey: holdkey! + " Notes")
            
        }else{
            displayFont = 14
        }
        notesField.font = UIFont(name: "Verdana",size: CGFloat(displayFont!))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removeDict = singleDict
        textField.isUserInteractionEnabled = false
        notesField.isUserInteractionEnabled = false
        
        textField.text = holdkey
        notesField.text = singleDict.removeValue(forKey: holdkey!)
        saveButtonLabel.isHidden = true
        
         displayTitle()
         displayNotes()
        
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
