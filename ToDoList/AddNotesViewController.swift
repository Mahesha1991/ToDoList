//
//  AddNotesViewController.swift
//  ToDoList
//
//  Created by Mahesha Rao on 12/11/16.
//  Copyright © 2016 Mahesha Rao. All rights reserved.
//

import UIKit

class AddNotesViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var notesField: UITextView!
    var alert = UIAlertController(title: "Alert", message: "Title Cannot Be Empty!!", preferredStyle: UIAlertControllerStyle.alert)
    
    @IBAction func saveNotes(_ sender: Any) {
        var dict:Dictionary<String,String> = [:]
        
        if(UserDefaults.standard.object(forKey: "Every")  as? Dictionary<String,String> == nil)
        {
            
            if(titleField.text! == ""){
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                UserDefaults.standard.removeObject(forKey: "Every")
                dict[titleField.text!] = notesField.text
                UserDefaults.standard.set(dict, forKey: "Every")
            }
            
        }
        else
        {
            
            if(titleField.text! == ""){
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                dict = (UserDefaults.standard.object(forKey: "Every")  as? Dictionary<String,String>)!
                UserDefaults.standard.removeObject(forKey: "Every")
                dict[titleField.text!] = notesField.text
                UserDefaults.standard.set(dict, forKey: "Every")
            }
            
        }
        
        UserDefaults.standard.synchronize()
        self.navigationController!.popToRootViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
