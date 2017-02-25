//
//  Trip.swift
//  minTur
//
//  Created by Sindre Moldeklev on 25.02.2017.
//  Copyright © 2017 Sindre Moldeklev. All rights reserved.
//

import Foundation

/*
    Class representing a Trip
 */
class Trip {
    

    var from, to, date, description, tripID, km:String!

    init(from: String!, to: String!, date: String!, description: String!, tripID:String!, km:String!) {
        self.from = from
        self.to = to
        self.date = date
        self.description = description
        self.tripID = tripID
        self.km = km
    }
    
    func printTrip() {
        print("Fra: \(self.from)")
        print("Til: \(self.to)")
        print("Dato: \(self.date)")
        print("Km: \(self.km)")
        print("Beskrivelse: \(self.description)")
    }
    
    func toString() -> String {
        return from + " - " + to + ", dato: " + date
    }
    
}
