//
//  ExpenseModel.swift
//  Finn
//
//  Created by t-sawass on 7/24/18.
//  Copyright © 2018 t-sawass. All rights reserved.
//

import Foundation
import Realm

struct Expense {
    var title: String
    var description: String
    var type: String // TODO: change to enum
    //var receiptImage:
    var amount: Int // money variable type?
}
