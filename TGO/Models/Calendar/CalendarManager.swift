//
//  CalendarManager.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 25/01/23.
//

import Foundation


class CalendarManager {
    var events: [CalendarEvents.CalendarEvent] = []
    
    static let shared = CalendarManager()
    
    init() {
        self.fetchData()
    }
    
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "data-dummy", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(CalendarEvents.self, from: data)
            events = result.events
        } catch {
            print("Error: \(error)")
        }
    }
}
