//
//  Simulator.swift
//  Simulator
//
//  Created by Gabriel Mocelin on 06/09/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation

class Simulator {
    
    let numberGenerator = RandomNumberGenerator()
    
    var events: [Event]
    var currentTime: Double
    
    var servers: Int
    var capacity: Int
    var clients: Int
    
    //tempos que o simulador passou com cada estado da fila
    var timers: [Double]
    
    init(initialEvent: Event, servers: Int, capacity: Int) {
        events = [initialEvent]
        currentTime = 0
        clients = 0
        self.servers = servers
        self.capacity = capacity
        timers = []
    }
    
    init() {
        let initialEvent = Event(eventType: .entry, time: 2.0)
        clients = 0
        servers = 1
        capacity = 3
        currentTime = 0
        events = [initialEvent]
        timers = []
        
        start()
    }
    
    func start() {
        
        //initialize timers for number of states in 0
        for _ in 0...capacity {
            timers.append(0)
        }
        
        for count in 0...1000 {
            guard let event = events.element(at: count) else { continue }
            
            switch event.eventType {
            case .entry:
                arrival(event: event)
            case .exit:
                exit(event: event)
            }
        }
        
        print("************")
        print(events.count)
        print("************")
        print(timers)
    }
    
    private func arrival(event: Event) {
        calcProbabilities(event: event)
        
        if clients < 3 {
            clients += 1
            
            if clients <= 1 {
                let time = currentTime + numberGenerator.random(for: 3...6)
                schedule(event: Event(eventType: .exit, time: time))
            }
        }
        let time = currentTime + numberGenerator.random(for: 1...2)
        schedule(event: Event(eventType: .entry, time: time))
    }
    
    private func exit(event: Event) {
        calcProbabilities(event: event)
    
        clients -= 1
        if clients >= 1 {
            let time = currentTime + numberGenerator.random(for: 3...6)
            schedule(event: Event(eventType: .exit, time: time))
        }
    }
    
    private func calcProbabilities(event: Event) {
        let newTime = timers[clients] + (event.time - currentTime)
        timers[clients] = newTime
        currentTime = event.time
    }
    
    private func schedule(event: Event) {
        events.append(event)
        events.sort { $0.time < $1.time }
    }
}

extension Array {
    func element(at index: Int) -> Element? {
        return index < count ? self[index] : nil
    }
}
