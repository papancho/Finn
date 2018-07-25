//
//  AddExpenseInfoViewController.swift
//  Finn
//
//  Created by t-sawass on 7/24/18.
//  Copyright © 2018 t-sawass. All rights reserved.
//

import UIKit
import DatePickerDialog

class AddExpenseInfoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, ExpenseEntryHeaderViewDelegate {

    @IBOutlet weak var expenseHeader: ExpenseEntryHeaderView!
    var expenseImage: UIImage?
    var expenseType: String?
    var imagePicked: UIImage?
    
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
        //self.continueButton.isUserInteractionEnabled = false
        self.setTextFieldDelegates()
        self.setTextFieldDismissKeys()
        self.expenseHeader.delegate = self
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
    
    func makeContinueButtonActive() {
        self.continueButton.backgroundColor = self.expenseHeader.backgroundColor
        self.continueButton.setTitleColor(UIColor.white, for: .normal)
        self.continueButton.isUserInteractionEnabled = true
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imagePicked = image
        self.receiptImageUploaded = true
        if areAllFieldsCompleted() {
            self.makeContinueButtonActive()
        }
        dismiss(animated:true, completion: nil)
    }
    
    // MARK: UITextFieldDelegate Functions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    func setTextFieldDelegates() {
        expenseDateTextField.delegate = self
        expenseNameTextField.delegate = self
        amountTextField.delegate = self
    }
    
    func setTextFieldDismissKeys() {
        expenseDateTextField.returnKeyType = .done
        expenseNameTextField.returnKeyType = .done
        amountTextField.returnKeyType = .done
    }
    
    func showLoadingState() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        blurView.alpha = 0;
        self.view.addSubview(blurView)
        
        UIView.animate(withDuration: 0.5) {
            blurView.alpha = 1.0
        }
    }
    
    // MARK: ExpenseEntryHeaderViewDelegate
    
    func didPressHomeButton(sender: ExpenseEntryHeaderView) {
        // This is some sketchy shit lol
        weak var weakPresentingController = self.presentingViewController
        self.dismiss(animated: true) {
            if let _ = weakPresentingController {
                weakPresentingController?.dismiss(animated: true, completion: nil)
            }
        }
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
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
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
        self.showLoadingState()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func finishedEditingExpenseName(_ sender: Any) {
        if areAllFieldsCompleted() {
            self.makeContinueButtonActive()
        }
    }
    
    @IBAction func finishedEditingExpenseDate(_ sender: Any) {
        if areAllFieldsCompleted() {
            self.makeContinueButtonActive()
        }
    }

    @IBAction func finishedEditingExpenseAmount(_ sender: Any) {
        if areAllFieldsCompleted() {
            self.makeContinueButtonActive()
        }
    }
    
}

