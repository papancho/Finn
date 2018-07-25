//
//  ExpenseTypeView.swift
//  Finn
//
//  Created by t-sawass on 7/23/18.
//  Copyright © 2018 t-sawass. All rights reserved.
//

import UIKit

protocol ExpenseTypeViewDelegate:AnyObject  {
    func didPressExpense(sender: ExpenseTypeView)
}

class ExpenseTypeView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var ExpenseImage: UIImageView!
    @IBOutlet weak var ExpenseLabel: UILabel!
    weak var delegate: ExpenseTypeViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.localInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.localInit()
    }
    
    func localInit() {
        Bundle.main.loadNibNamed("ExpenseTypeView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.backgroundColor = UIColor.clear
        
        // Tap Gesture Recognizer on Expense Image
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didPressExpenseImage))
        singleTap.numberOfTapsRequired = 1;
        ExpenseImage.addGestureRecognizer(singleTap)
        ExpenseImage.isUserInteractionEnabled = true
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @objc func didPressExpenseImage(_ sender: UIImage) {
        if let _ = self.delegate {
            self.delegate?.didPressExpense(sender: self)
        }
        
        // TODO: logic for passing along expense color
    }
}
