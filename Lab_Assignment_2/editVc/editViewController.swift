//
//  editViewController.swift
//  Lab_Assignment_2
//
//  Created by Anmol Sharma on 2020-01-21.
//  Copyright © 2020 anmol. All rights reserved.
//

import UIKit
import CoreData

class editViewController: UIViewController {
    
    var model  = modelClass()
    var tArray = [modelClass]()
    var coreData = CoreData()
    @IBOutlet weak var etitle: UITextField!
    @IBOutlet weak var edaysR: UITextField!
    @IBOutlet weak var edaysC: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        etitle.text = model.taskToDo
        edaysR.text = String(model.totalDays)
        edaysC.text = String(model.totalDaysCompleted)
        coreData.retrieveTask()
        // Do any additional setup after loading the view.
    }
    @IBAction func saveTask(_ sender: Any) {
        let title = etitle.text!
        let eDaysR = Int(edaysR.text!)
        let eDaysC = Int(edaysC.text!)
        
        self.deleteTask()
        self.tArray.removeAll()
        coreData.retrieveTask()
        let updatedTask = modelClass(taskToDo: title, totalDays: eDaysR!, totalDaysCompleted: eDaysC!)
        tArray.append(updatedTask)
        print(tArray.count)
        updateTask()
        navigationController?.popViewController(animated: true)
        
    }
    
    func updateTask()
       {
        print("entered")
           //Setting up the app delegate
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
           //creating context from the container
           let context = appDelegate.persistentContainer.viewContext
           
           //creating entity
           let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)
           
        for i in tArray{
           let data = NSManagedObject(entity: entity!, insertInto: context)
            var etitle = i.taskToDo
            var edaysR = i.totalDays
            var edaysC = i.totalDaysCompleted
        data.setValue(etitle, forKey: "task")
        data.setValue(edaysR, forKey: "tDays")
        data.setValue(edaysC, forKey: "tDaysCom")
        }
           do{
               try context.save()
               print("Task Updated")
           }catch let error as NSError{
               print("Error Could not save Data. \(error),\(error.userInfo)")
           }
       }
    func deleteTask()
    {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        
        fetchRequest.returnsObjectsAsFaults = false
        
        
        let predicate = NSPredicate(format: "task = %@", "\(model.taskToDo)")
        fetchRequest.predicate = predicate
        if let result = try? context.fetch(fetchRequest) {
            for i in result {
                print(i)
                context.delete(i as! NSManagedObject)
            }
        }
        
        
        do
        {
            try context.save()
        }
        catch{
            
            print("error")
        }
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
