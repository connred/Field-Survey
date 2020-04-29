//
//  AnimalEvent.swift
//  Field Survey
//
//  Created by Connor Redmond on 4/29/20.
//  Copyright © 2020 Connor Redmond. All rights reserved.
//

import Foundation

struct AnimalEvent {
    let animalClass: Animal
    let animalName: String
    let desc: String
    let date: Date
    
    init(animalClass: Animal, animalName: String, desc: String, date: Date) {
        self.animalClass = animalClass
        self.animalName = animalName
        self.desc = desc
        self.date = date
    }
    init?(animalClass: String, animalName: String, desc: String, date: Date) {
        if let animal = Animal(rawValue: animalClass){
            self.init(animalClass: animal, animalName: animalName, desc: desc, date: date)
        } else {
            return nil
        }
    }
}
