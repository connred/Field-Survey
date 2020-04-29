//
//  AnimalEventsJSONLoader.swift
//  Field Survey
//
//  Created by Connor Redmond on 4/29/20.
//  Copyright © 2020 Connor Redmond. All rights reserved.
//

import Foundation

class AnimalEventsJSONLoader {
    class func load(fileName: String) -> [AnimalEvent] {
        var events = [AnimalEvent]()
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
        let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            events = AnimalEventsJSONParser.parse(data)
        }
        return events
    }
}
