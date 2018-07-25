//
//  AddExpenseInfoViewController.swift
//  Finn
//
//  Created by t-sawass on 7/24/18.
//  Copyright © 2018 t-sawass. All rights reserved.
//

import UIKit
import DatePickerDialog

class AddExpenseInfoViewController: UIViewController {

    @IBOutlet weak var expenseHeader: ExpenseEntryHeaderView!
    var expenseImage: UIImage?
    var expenseType: String?
    
    @IBOutlet weak var expenseNameTextField: UITextField!
   
    @IBOutlet weak var expenseDateTextField: UITextField!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.expenseHeader.configureExpenseHeader(expenseImage: self.expenseImage, expenseType: self.expenseType)
    }
    
    //IB Actions **************************************
    
    @IBAction func dateFieldPressed(_ sender: Any) {
        DatePickerDialog().show("Transaction Date", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let d = date {
                    self.expenseDateTextField.text = "\(d)"
            }
        }
    }
    
}

