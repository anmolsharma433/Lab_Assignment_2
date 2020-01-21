//
//  ViewController.swift
//  Lab_Assignment_2
//
//  Created by Anmol Sharma on 2020-01-21.
//  Copyright © 2020 anmol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let coreData = CoreData()
    let table = TableViewController()
    @IBOutlet weak var toDo: UITextField!
    @IBOutlet weak var daysR: UITextField!
    @IBOutlet weak var daysCom: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func saveTask(_ sender: Any) {
        let task = toDo.text!
        let daysRequired = Int(daysR.text!)!
        let daysCompleted = Int(daysCom.text!)!
        let date = Date()
        coreData.saveTask(taskToDo: task, tDays: daysRequired, tdaysCom: daysCompleted)
        
        print("addtask successfully completed")
        navigationController?.popViewController(animated: true)
    }
    

}

