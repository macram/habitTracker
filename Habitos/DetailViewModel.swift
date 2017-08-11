//
//  DetailViewModel.swift
//  Habitos
//
//  Created by Manu Mateos on 11/8/17.
//  Copyright © 2017 Liquid Squad. All rights reserved.
//

import UIKit

class DetailViewModel: NSObject {
    var habit: Habit?
    
    var today: Int {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let todayComponents = calendar.dateComponents([.day, .month, .year], from: Date())
        let todayDate = calendar.date(from: todayComponents)!
//        let aWeekAgoDate = calendar.date(byAdding: .day, value: -7, to: todayDate)
        
        let filterDayPredicate = NSPredicate(format: "timestamp >= %@", argumentArray: [todayDate])
        let todayEvents = habit!.events!.filtered(using: filterDayPredicate)
//        let filterWeekPredicate = NSPredicate(format: "timestamp >= %@", argumentArray: [aWeekAgoDate])
//        let weekEvents = habit!.events!.filtered(using: filterWeekPredicate)
        return todayEvents.count
    }
    var thisWeek: Int {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let todayComponents = calendar.dateComponents([.day, .month, .year], from: Date())
        let todayDate = calendar.date(from: todayComponents)!
        let aWeekAgoDate = calendar.date(byAdding: .day, value: -7, to: todayDate)
        
        let filterWeekPredicate = NSPredicate(format: "timestamp >= %@", argumentArray: [aWeekAgoDate])
        let weekEvents = habit!.events!.filtered(using: filterWeekPredicate)
        return weekEvents.count
    }
    var thisMonth: Int {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let todayComponents = calendar.dateComponents([.day, .month, .year], from: Date())
        var firstDayOfMonthComponents = todayComponents
        firstDayOfMonthComponents.day = 1
        let firstDayOfMonth = calendar.date(from: firstDayOfMonthComponents)
        
        let filterWeekPredicate = NSPredicate(format: "timestamp >= %@", argumentArray: [firstDayOfMonth])
        let monthEvents = habit!.events!.filtered(using: filterWeekPredicate)
        return monthEvents.count
    }
    var events: [Event] {
        return habit!.events?.allObjects as! [Event]
    }
    
    
}
