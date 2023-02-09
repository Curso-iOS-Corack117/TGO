//
//  CalendarEvent.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 21/01/23.
//

import SwiftUI

struct CalendarEvents: Codable {
    let events: [CalendarEvent]
    
    private enum ValueCodingKey: String, CodingKey {
        case value
    }
    
    init(from decoder:Decoder) throws {
        let eventsValue =  try decoder.container(keyedBy: ValueCodingKey.self)
        events = try eventsValue.decode([CalendarEvent].self, forKey: .value)
    }
    
    struct CalendarEvent: Codable {
        
        let idString: String
        var id: UUID = UUID()
        var title: String
        var shortDescription: String = ""
        var longDescription: String = ""
        var htmlDescription: String = ""
        var start: Date
        var end: Date
        var theme: ThemeEvent = .teal
        
        private enum SimpleCodingKeys: String, CodingKey {
            case id, subject, bodyPreview, body, start, end
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: SimpleCodingKeys.self)
            let body = try container.decode(Body.self, forKey: .body)
            self.idString = try container.decode(String.self, forKey: .id)
            self.title = try container.decode(String.self, forKey: .subject)
            self.shortDescription = try container.decode(String.self, forKey: .bodyPreview)
            self.htmlDescription = body.content
            self.start = try container.decode(Date.self, forKey: .start)
            self.end = try container.decode(Date.self, forKey: .end)
        }
        
        struct Body: Codable {
            var content: String
        }
    }
    
    struct Date: Codable {
        var dateTime: String
        var timeZone: String
        var hour: String = ""
        var date: String = ""
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.dateTime = try container.decode(String.self, forKey: .dateTime)
            self.timeZone = try container.decode(String.self, forKey: .timeZone)
            
            self.getLocalTimeZoneDate()
        }
        
        init(with dateTime: String, timeZone: String = "", hour: String = "", date: String = "") {
            self.dateTime = dateTime
            self.timeZone = timeZone
            self.hour = hour
            self.date = date
        }
        
//        UTC To Local Time Date
        mutating func getLocalTimeZoneDate() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            dateFormatter.timeZone = TimeZone(abbreviation: timeZone)
            
            if let date = dateFormatter.date(from: self.dateTime) {
                dateFormatter.timeZone = TimeZone.current
                dateFormatter.dateFormat = "EEEE d 'de' MMMM 'de' YYYY 'a las' h:mm a"
                self.dateTime = dateFormatter.string(from: date)
                dateFormatter.dateFormat = "EEEE d 'de' MMMM 'de' YYYY"
                self.date = dateFormatter.string(from: date)
                dateFormatter.dateFormat = "h:mm a"
                self.hour = dateFormatter.string(from: date)
            }
        }
    }
}


struct OldCalendarEvent: Codable {
    var id: UUID = UUID()
    var title: String
    var shortDescription: String = ""
    var longDescription: String = ""
    var date: Date = Date()
    var theme: ThemeEvent = .lavender
}
