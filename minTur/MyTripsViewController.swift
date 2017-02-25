//
//  MyTripsViewController.swift
//  minTur
//
//  Created by Sindre Moldeklev on 25.02.2017.
//  Copyright © 2017 Sindre Moldeklev. All rights reserved.
//

import UIKit
import Firebase

class MyTripsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    // List of trips
    var trips:[Trip]!
    var ref:FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        trips = []
        self.ref = FIRDatabase.database().reference()
        
        // Load all trips
        self.ref.child("trips").observe(.childAdded, with: { (snapshot) in
            let tripDicts = snapshot.value as? [String : String] ?? [:]
            
            let trip = Trip(from: tripDicts["from"], to: tripDicts["to"], date: tripDicts["date"], description: tripDicts["description"], tripID: snapshot.key, km: tripDicts["km"])
            self.trips.append(trip)
            
            // Reload table view after data is fetched
            self.tableView.reloadData()
        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trips.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = self.trips[indexPath.row].toString()
        cell.textLabel?.textColor = .white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trip = self.trips[indexPath.item]
        performSegue(withIdentifier: "tripDetails", sender: trip)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If we are trying to go to tripDetails segue (wtf is segue?)
        if segue.identifier == "tripDetails" {
            if let destination = segue.destination as? TripDetailViewController {
                destination.trip = sender as? Trip
            }
        }
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
