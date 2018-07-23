//
//  ViewController.swift
//  Finn
//
//  Created by t-sawass on 7/18/18.
//  Copyright © 2018 t-sawass. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialBottomAppBar

class HomeViewController: UIViewController {

    @IBOutlet weak var BottomNavBar: MDCBottomAppBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //BottomNavBar.set
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        BottomNavBar.floatingButton.setImage(UIImage(named: "plus"), for: .normal)
        BottomNavBar.floatingButton.addTarget(self, action: #selector(addExpenseButtonTapped), for: .touchUpInside)

        let hamburgerItem = UIBarButtonItem(image: UIImage(named:"hamburgerMenuIcon"), style: .plain, target: self, action: #selector(hamburgerMenuBarButtonItemTapped))

        let transactionHistory =  UIBarButtonItem(image: UIImage(named:"expenseHistoryIcon"), style: .plain, target: self, action: #selector(hamburgerMenuBarButtonItemTapped))
    
        let leadingBarButtomItems = [hamburgerItem]
        let trailingBarButtonItems = [transactionHistory]
        
        BottomNavBar.leadingBarButtonItems = leadingBarButtomItems
        BottomNavBar.trailingBarButtonItems = trailingBarButtonItems
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func addExpenseButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: Segues.homePageToAddExpense, sender: self)
    }
    
    @objc func transactionHistoryBarButtonItemTapped(_ sender:UIBarButtonItem!) {
        // TODO: logic
    }

    @objc func hamburgerMenuBarButtonItemTapped(_ sender:UIBarButtonItem!)
    {
        /*Launch Hamburger Menu*/
    }

}

