//
//  ExpenseEntryHeaderView.swift
//  Finn
//
//  Created by t-sawass on 7/24/18.
//  Copyright © 2018 t-sawass. All rights reserved.
//

import UIKit

class ExpenseEntryHeaderView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var ExpenseTypeImage: UIImageView!
    @IBOutlet weak var ExpenseTypeLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.localInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.localInit()
    }
    
    func localInit() {
        Bundle.main.loadNibNamed("ExpenseEntryHeader", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    func configureExpenseHeader(expenseImage: UIImage?, expenseType: String?) {
        if let image = expenseImage {
            ExpenseTypeImage.image = image
        }
        if let expense = expenseType {
            ExpenseTypeLabel.text = expense

            switch expense {
            case "Travel":
                self.contentView.backgroundColor = UIColor.init(red: 228/255.0, green: 126/255.0, blue: 48/255.0, alpha: 1.0)
            case "Medical":
                self.contentView.backgroundColor = UIColor.init(red: 226/255.0, green: 76/255.0, blue: 65/255.0, alpha: 1.0)
            case "Onboarding":
                self.contentView.backgroundColor = UIColor.init(red: 43/255.0, green: 119/255.0, blue: 168/255.0, alpha: 1.0)
            case "Food":
                self.contentView.backgroundColor = UIColor.init(red: 48/255.0, green: 173/255.0, blue: 99/255.0, alpha: 1.0)
            case "Conference":
                self.contentView.backgroundColor = UIColor.init(red: 141/255.0, green: 72/255.0, blue: 171/255.0, alpha: 1.0)
            default: // configured as "other" state
                self.contentView.backgroundColor = UIColor.init(red: 233/255.0, green: 188/255.0, blue: 46/255.0, alpha: 1.0)
            }
        }
    }
}
