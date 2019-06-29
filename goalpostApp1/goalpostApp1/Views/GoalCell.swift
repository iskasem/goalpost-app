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
    @IBOutlet weak var completionView: UIView!
    
  
    
    func configureCell(goal : Goal) {
        self.goalDescriptionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String (describing: goal.goalProgress)
    
        if goal.goalProgress == goal.goalCompletionValue {
            self.completionView.isHidden = false
        }else{
            self.completionView.isHidden = true
        }
    }


}
