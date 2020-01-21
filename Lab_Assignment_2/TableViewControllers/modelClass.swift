//
//  modelClass.swift
//  Lab_Assignment_2
//
//  Created by Anmol Sharma on 2020-01-21.
//  Copyright © 2020 anmol. All rights reserved.
//

import Foundation
class modelClass
{
    internal init() {
        self.taskToDo = String()
        self.totalDays = Int(Int64())
        self.totalDaysCompleted = Int(Int64())
       // self.date = Date()
        //self.dateString = String()
        
    }
    
    internal init(taskToDo: String, totalDays: Int, totalDaysCompleted: Int) {
        self.taskToDo = taskToDo
        self.totalDays = totalDays
        self.totalDaysCompleted = totalDaysCompleted
        //newdate = Date(timeIntervalSince1970: TimeInterval(self.date))
//        self.date = Date()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM/yyyy"
//        self.dateString = formatter.string(from: date)
        }
    
    
    var taskToDo : String
    var totalDays : Int
    var totalDaysCompleted : Int
   // var date : Date
    //var dateString : String
    //var newdate : Date
    
    
    
    
    
    
    
    
}
extension Date
{
    
    func dateformatter() -> String {
        let dateFormatterPrint=DateFormatter()
        dateFormatterPrint.dateFormat="dd/MM/yyyy"
        let formattedDate = dateFormatterPrint.string(from: self)
        return formattedDate
        
    }
    
    
}
