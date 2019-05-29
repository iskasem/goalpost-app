//
//  GoalCell.swift
//  goalpostApp1
//
//  Created by Islam Kasem on 29/05/2019.
//  Copyright © 2019 Islam Kasem. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!

    func configureCell(description : String , type :GoalType , goalProgressAmount : Int){
        self.goalDescriptionLbl.text = description
        self.goalTypeLbl.text = type.rawValue
        self.goalProgressLbl.text = String(describing: goalProgressAmount)
    
    }


}
