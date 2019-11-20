//
//  CreateEventController.swift
//  Scheduler
//
//  Created by Eric Davenport on 11/20/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import UIKit

class CreateEventController: UIViewController {
    
    @IBOutlet weak var createEventTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createEventTextField.delegate = self
        event = Event(date: Date(), name: "Swift Rocks Lab")   // Date() - initialize date object with today date as the current date
        
    }
    
    @IBAction func datePickerChanged(sender: UIDatePicker) {
        // update date of event
        event?.date = sender.date
    }
        
}

extension CreateEventController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // dismiss the keyboard
        textField.resignFirstResponder()
        
        // update name of event
        event?.name = textField.text ?? "No event name"
        
        return true
    }
}
