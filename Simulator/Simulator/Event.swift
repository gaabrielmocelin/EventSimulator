//
//  Event.swift
//  Simulator
//
//  Created by Gabriel Mocelin on 06/09/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation

enum EventType {
    case entry
    case exit
}

struct Event {
    let eventType: EventType
    let time: Double
}
