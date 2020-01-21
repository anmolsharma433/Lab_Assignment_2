//
//  TableViewController.swift
//  Lab_Assignment_2
//
//  Created by Anmol Sharma on 2020-01-21.
//  Copyright © 2020 anmol. All rights reserved.
//

import UIKit
import CoreData
class TableViewController: UITableViewController {
    
    let coreData = CoreData()
    override func viewDidLoad() {
        super.viewDidLoad()
        coreData.retrieveTask()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return coreData.taskArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.title.text = coreData.taskArray[indexPath.row].taskToDo
        let working = coreData.taskArray[indexPath.row].totalDays - coreData.taskArray[indexPath.row].totalDaysCompleted
        cell.workingDays.text = String("Days Worked : \(working)")
        cell.totalDays.text = String("Total Days : \(coreData.taskArray[indexPath.row].totalDays)")
        cell.daysLeft.text =  String("Days Left : \(coreData.taskArray[indexPath.row].totalDaysCompleted)")
        
        
        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let appdelegate = UIApplication.shared.delegate as! AppDelegate;
            let context = appdelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Task")
            do
            {
                let fetch = try context.fetch(fetchRequest)
                let result = fetch as! [Task]
//                print(result.count)
//                print("deleting \(result[indexPath.row])")
                context.delete(result[indexPath.row])
//                print(indexPath.row )
                do
                {
                    try context.save()
                }
                catch{
                    print("error")
                }
                self.coreData.taskArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.reloadData()
            }
            catch
            {
            }
           
    }
}


/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */



}
