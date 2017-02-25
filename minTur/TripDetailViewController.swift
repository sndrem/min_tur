//
//  TripDetailViewController.swift
//  minTur
//
//  Created by Sindre Moldeklev on 25.02.2017.
//  Copyright © 2017 Sindre Moldeklev. All rights reserved.
//

import UIKit

class TripDetailViewController: UIViewController {

    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    var trip: Trip!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set values from trip to labels in view
        self.fromLabel.text = "Fra: " + trip.from
        self.toLabel.text = "Til: " + trip.to
        self.dateLabel.text = "Dato: " + trip.date
        self.kmLabel.text = "Antall km: " + trip.km
        self.descriptionLabel.text = trip.description
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
