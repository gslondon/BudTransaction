//
//  TransactionTableViewCell.swift
//  BudTransaction
//
//  Created by Godfrey Bagley-Clarke on 01/07/2018.
//  Copyright © 2018 Godfrey Bagley-Clarke. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: FieldLabel!
    @IBOutlet weak var valueLabel: FieldLabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
