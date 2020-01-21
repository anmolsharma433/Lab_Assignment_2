//
//  CoreData.swift
//  Lab_Assignment_2
//
//  Created by Anmol Sharma on 2020-01-21.
//  Copyright © 2020 anmol. All rights reserved.
//

import UIKit
import CoreData
class CoreData: UIViewController {
    
    
    var taskArray : [modelClass] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //deleteData()
        
        // Do any additional setup after loading the view.
    }
    
    
    func saveTask(taskToDo : String,tDays : Int,tdaysCom : Int)
    {
        //Setting up the app delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        //creating context from the container
        let context = appDelegate.persistentContainer.viewContext
        
        //creating entity
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)
        
       
        let data = NSManagedObject(entity: entity!, insertInto: context)
        data.setValue(taskToDo, forKey: "task")
        data.setValue(tDays, forKey: "tDays")
        data.setValue(tdaysCom, forKey: "tDaysCom")
        //data.setValue(Date().dateformatter(), forKey: "date")
    
        
       taskArray.append(modelClass(taskToDo: taskToDo, totalDays: tDays, totalDaysCompleted: tdaysCom))
        do{
            try context.save()
            print("Data Saved")
        }catch let error as NSError{
            print("Error Could not save Data. \(error),\(error.userInfo)")
        }
    }
    
    
    //retrieve Contact
    func retrieveTask()
    {
        if taskArray.count != 0
        {
            deleteData()
        }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        
        let Context = appDelegate.persistentContainer.viewContext
        
        //preparing the request of type NsFetchRequestfor the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        
        do{
            let result = try Context.fetch(fetchRequest)
            for data in result as! [NSManagedObject]
            {
                let todo = data.value(forKey: "task")
                let tdays = data.value(forKey: "tDays")
                let tdaysCom = data.value(forKey: "tDaysCom")
//                let date = data.value(forKey: "date") as! String
//                  let formatter = DateFormatter()
//                formatter.dateFormat = "dd/MM/yyyy"
//                let temp = formatter.date(from: date)
                taskArray.append(modelClass(taskToDo: todo as! String, totalDays: tdays as! Int, totalDaysCompleted: tdaysCom as! Int))
                print("Data Successfully retrieved")
            }
            
        }
        catch let error as NSError{
            print("Error Could not save Data. \(error),\(error.userInfo)")
        }
        
    }
    
    func updateData()
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //preparing the request of type NsFetchRequestfor the entity
        let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Task")
        fetchRequest.predicate = NSPredicate(format: "", "")
        do{
            let test = try managedContext.fetch(fetchRequest)
            
            //            for user in (test as? [NSManagedObject])! {
            //                user.setValue("abc", forKey: "name")
            //            }
            do{
                try managedContext.save()
            }
            catch let error as NSError{
                print("Error Could not save Data. \(error),\(error.userInfo)")
            }
        }
        catch{
            print(error)
        }
    }
    
    func deleteData()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        fetchRequest.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(fetchRequest)
            
            for managedObjects in results{
                if let managedObjectsData = managedObjects as? NSManagedObject
                {
                    context.delete(managedObjectsData)
                }
                
            }
        }
        catch let error as NSError{
            print("Error Could not save Data. \(error),\(error.userInfo)")
        }
    }
}
