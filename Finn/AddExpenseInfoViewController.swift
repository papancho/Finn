//
//  AddExpenseInfoViewController.swift
//  Finn
//
//  Created by t-sawass on 7/24/18.
//  Copyright © 2018 t-sawass. All rights reserved.
//

import UIKit
import DatePickerDialog

class AddExpenseInfoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var expenseHeader: ExpenseEntryHeaderView!
    var expenseImage: UIImage?
    var expenseType: String?
    
    @IBOutlet weak var expenseNameTextField: UITextField!
   
    @IBOutlet weak var expenseDateTextField: UITextField!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet weak var photoLibraryButton: UIButton!
    
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var photoImageSourceStackView: UIStackView!
    
    var receiptImageUploaded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.continueButton.isUserInteractionEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.expenseHeader.configureExpenseHeader(expenseImage: self.expenseImage, expenseType: self.expenseType)
    }
    
    // Helpers ************************************
    
    func areAllFieldsCompleted() -> Bool {
        if let name = self.expenseNameTextField.text, let date = self.expenseDateTextField.text,
            let amount = self.amountTextField.text {
            return !(name.isEmpty ||
                     date.isEmpty ||
                     amount.isEmpty ||
                    !self.receiptImageUploaded)
        }
        return false
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
    
    @IBAction func photoLibraryButtonPressed(_ sender: Any) {
    }

    @IBAction func cameraButtonPressed(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func continueButtonPressed(_ sender: Any) {
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func finishedEditingExpenseName(_ sender: Any) {
        if areAllFieldsCompleted() {
            self.continueButton.backgroundColor = self.expenseHeader.backgroundColor
            self.continueButton.setTitleColor(UIColor.white, for: .normal)
            self.continueButton.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func finishedEditingExpenseDate(_ sender: Any) {
        if areAllFieldsCompleted() {
            self.continueButton.backgroundColor = self.expenseHeader.backgroundColor
            self.continueButton.setTitleColor(UIColor.white, for: .normal)
            self.continueButton.isUserInteractionEnabled = true
        }
    }

    @IBAction func finishedEditingExpenseAmount(_ sender: Any) {
        if areAllFieldsCompleted() {
            self.continueButton.backgroundColor = self.expenseHeader.backgroundColor
            self.continueButton.setTitleColor(UIColor.white, for: .normal)
            self.continueButton.isUserInteractionEnabled = true
        }
    }
    
}

