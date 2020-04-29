//
//  AnimalEventsJSONParser.swift
//  Field Survey
//
//  Created by Connor Redmond on 4/29/20.
//  Copyright © 2020 Connor Redmond. All rights reserved.
//

import Foundation


class AnimalEventsJSONParser {
    static let dateFormatter = DateFormatter()
    class func parse(_ data: Data) -> [AnimalEvent] {
        var animalEvents = [AnimalEvent]()
        dateFormatter.dateFormat = "YYYY-MM-DDTHH:MM:SSZ"
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
            
            if let observations = root["observations"] as? [Any] {
                for observation in observations {
                    if let observation = observation as? [String: String] {
                        if let animalClass = observation["classification"],
                            let animalName = observation["title"],
                            let desc = observation["description"],
                            let dateString = observation["date"],
                            let date = dateFormatter.date(from: dateString){
                            if let animalObs = AnimalEvent(animalClass: animalClass, animalName: animalName, desc: desc, date: date) {
                                animalEvents.append(animalObs)
                            }
                            
                        }
                    }
                }
            }
        }
        
        
        return animalEvents
    }
}
