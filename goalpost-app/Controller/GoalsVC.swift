//
//  GoalsVC.swift
//  goalpost-app
//
//  Created by Islam Kasem on 25/05/2019.
//  Copyright © 2019 Islam Kasem. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        print("button was pressed")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let goal = Goal()
        

        // Do any additional setup after loading the view.
    }
    



}
