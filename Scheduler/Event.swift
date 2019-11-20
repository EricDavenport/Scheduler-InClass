//
//  Event.swift
//  Scheduler
//
//  Created by Eric Davenport on 11/20/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import Foundation

struct Event {
    var date: Date
    var name: String
    
    static func getTestData() -> [Event] {
        var events = [Event]()
        
        let eventNames = ["Code", "Unit Assessment", "iOS Soho", "Births 112 mile bike ride", "Ladies Night Out"]
        
        for eventName in eventNames {
            let event = Event(date:Date(), name: eventName)
            events.append(event)
        }
        
        return events
    }
    
}


