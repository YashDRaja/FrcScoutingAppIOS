//
//  Team.swift
//  FRCScouting
//
//  Created by Stefan Georgiev on 2020-02-18.
//  Copyright © 2020 Stefan Georgiev. All rights reserved.
//

import Foundation
import UIKit

class Team: Codable{
    var teamName: String
    var climb: Bool
    var balanced: Bool
    var colourWheel: Bool
    var autoPoints: String
    var comments: String
    
    init (teamName: String, climb: Bool, balanced: Bool, colourWheel: Bool, autoPoints: String, comments: String){
        self.teamName = teamName
        self.climb = climb
        self.balanced = balanced
        self.colourWheel = colourWheel
        self.autoPoints = autoPoints
        self.comments = comments
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let archiveURL = documentsDirectory.appendingPathComponent("teams").appendingPathExtension("plist")
    
    static func saveToFile(users: [Team]){
        let propertyListEncoder = PropertyListEncoder()
        let encodedUserArray = try? propertyListEncoder.encode(users)
        try? encodedUserArray?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Team]{
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedUserArray = try? Data(contentsOf: archiveURL),
            let decodedUserArray = try? propertyListDecoder.decode(Array<Team>.self, from: retrievedUserArray) else {return []}
        return decodedUserArray
    }
    
}
