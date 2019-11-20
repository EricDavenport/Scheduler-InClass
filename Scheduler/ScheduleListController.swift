//
//  ViewController.swift
//  Scheduler
//
//  Created by Eric Davenport on 11/20/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import UIKit

class ScheduleListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // data - an array of events
    var events = [Event]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        events = Event.getTestData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNewEvent(segue: UIStoryboardSegue) {
        // segue.source when unwinding   -- where is infomation coming from
        // create a eference to CreateEventController
        guard let createEventVC = segue.source as? CreateEventController,
            // createEventVC above is line^^^ - use in let part as well
            let createdEvent = createEventVC.event else {
            fatalError("Failed to access createEventController, check unwind segue (func addNewEvent())")
        }
        // insert in events array - line 17
        events.insert(createdEvent, at: 0)   // at 0 - adds event to top of table view
        
        //  create indexPath to br inserted into the tableview
        let indexPath = IndexPath(row: 0, section: 0) // represents top of table view
    
        // use indexPath to insert into tableview
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

}

extension ScheduleListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count  // must be a valid count in order to return value
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        let event = events[indexPath.row]
        cell.textLabel?.text = event.name
        cell.detailTextLabel?.text = event.date.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .delete:
            print("deleting...")
            events.remove(at: indexPath.row)  // remove event from array
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case .insert:
            print("inserting...")
        default:
            print("default...")
        }
        
    }
    
    

}

