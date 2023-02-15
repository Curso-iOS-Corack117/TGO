//
//  DateExtenson.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 07/02/23.
//

import Foundation

extension Date {
    static var tomorrow:  Date { return Date().dayAfter }
    static var dayAfterTomorrow: Date { return Date().dayAfter.dayAfter }
    
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
}
