//
//  AddExpenseViewController.swift
//  Finn
//
//  Created by t-sawass on 7/23/18.
//  Copyright © 2018 t-sawass. All rights reserved.
//

import UIKit

class AddExpenseViewController: UIViewController, ExpenseTypeViewDelegate {

    @IBOutlet weak var TravelExpense: ExpenseTypeView?
    @IBOutlet weak var MedicalExpense: ExpenseTypeView?
    @IBOutlet weak var OnboardingExpense: ExpenseTypeView?
    @IBOutlet weak var FoodExpense: ExpenseTypeView?
    @IBOutlet weak var ConferenceExpense: ExpenseTypeView!
    @IBOutlet weak var OtherExpense: ExpenseTypeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureExpenseViews()
        self.configureExpenseViewDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureExpenseViews() {
        TravelExpense?.ExpenseImage.image = UIImage(named: "travelIcon")
        TravelExpense?.ExpenseLabel.text = "Travel"
        
        MedicalExpense?.ExpenseImage.image = UIImage(named: "medicalIcon")
        MedicalExpense?.ExpenseLabel.text = "Medical"
        
        OnboardingExpense?.ExpenseImage.image = UIImage(named: "onboardingIcon")
        OnboardingExpense?.ExpenseLabel.text = "Onboarding"
        
        FoodExpense?.ExpenseImage.image = UIImage(named: "foodIcon")
        FoodExpense?.ExpenseLabel.text = "Food"
        
        ConferenceExpense?.ExpenseImage.image = UIImage(named:"conferenceIcon")
        ConferenceExpense?.ExpenseLabel.text = "Conference"
        
        OtherExpense?.ExpenseImage.image = UIImage(named:"otherExpenseIcon")
        OtherExpense?.ExpenseLabel.text = "Other"
    }
    
    func configureExpenseViewDelegates() {
        TravelExpense?.delegate = self
        MedicalExpense?.delegate = self
        OnboardingExpense?.delegate = self
        FoodExpense?.delegate = self
        ConferenceExpense?.delegate = self
        OtherExpense?.delegate = self
    }

    func didPressExpense(sender: ExpenseTypeView) {
        
    }
    

}
