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
    
    static func getWeekOfYear() -> String {
        let week = Calendar.current.component(.weekOfYear, from: Date(timeIntervalSinceNow: 0))
        return "Sem \(week)"
    }
    
    static func getDayOfWeek(of date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d 'de' MMM 'de' YYYY"
        return dateFormatter.string(from: date)
    }
    
    static func headerDate(of date: Date) -> String {
        return "\(getWeekOfYear()) / \(getDayOfWeek(of: date))"
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
