//
//  ToDoCell.swift
//  WorkWithSavingData
//
//  Created by Nataliia on 11.09.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {
    @IBOutlet weak var todoText: UILabel!
    @IBOutlet weak var isDoneText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }
}
