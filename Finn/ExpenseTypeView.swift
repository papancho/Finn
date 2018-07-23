//
//  ExpenseTypeView.swift
//  Finn
//
//  Created by t-sawass on 7/23/18.
//  Copyright © 2018 t-sawass. All rights reserved.
//

import UIKit

class ExpenseTypeView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var ExpenseImage: UIImageView!
    @IBOutlet weak var ExpenseLabel: UILabel!
    
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
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
