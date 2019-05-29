//
//  GoalCell.swift
//  goalpost-app
//
//  Created by Islam Kasem on 25/05/2019.
//  Copyright © 2019 Islam Kasem. All rights reserved.
//

import UIKit


class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    
    func configureCell(description : String,type : String , goalProgressAmount : Int){
        
    self.goalDescriptionLbl.text = description
    self.goalTypeLbl.text = type
    self.goalProgressLbl.text = String(describing: goalProgressAmount)
    
    }
}
