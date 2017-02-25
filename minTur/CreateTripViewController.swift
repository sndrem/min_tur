//
//  CreateTripViewController.swift
//  minTur
//
//  Created by Sindre Moldeklev on 25.02.2017.
//  Copyright © 2017 Sindre Moldeklev. All rights reserved.
//

import UIKit
import Firebase

class CreateTripViewController: UIViewController {

    @IBOutlet weak var startInput: UITextField!
    @IBOutlet weak var endInput: UITextField!
    @IBOutlet weak var dateInput: UITextField!
    @IBOutlet weak var descriptionInput: UITextView!
    @IBOutlet weak var kmInput: UITextField!
    
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assign Firebase reference
        self.ref = FIRDatabase.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // Method for saving trip data to firebase
    @IBAction func saveButtonPressed(_ sender: Any) {
        let from = self.startInput.text!
        let end = self.endInput.text!
        let date = self.dateInput.text!
        let description = self.descriptionInput.text!
        let km = self.kmInput.text
        
        
        // TODO Check that all values are present
        // If values are not present, display message
        // to user
        
        
        // Save trip information to database
        self.ref.child("trips").childByAutoId().setValue(
            ["from": from, "to": end, "date": date, "description": description, "km": km]
        )
        
        resetInputFields()
    }
    
    // Reset Input fields after "submitting data"
    func resetInputFields() {
        self.startInput.text = ""
        self.endInput.text = ""
        self.dateInput.text = ""
        self.descriptionInput.text = ""
        self.kmInput.text = ""
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
