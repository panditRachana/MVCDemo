//
//  CellEmployee.swift
//  MVCDemo
//
//  Created by Rachana Pandit on 08/11/22.
//

import UIKit

class CellEmployee: UITableViewCell {

@IBOutlet weak var lblEmployeeId:UILabel!
@IBOutlet weak var lblEmpName:UILabel!
@IBOutlet weak var lblEmpLastName:UILabel!
@IBOutlet weak var lblEmpSalary:UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
