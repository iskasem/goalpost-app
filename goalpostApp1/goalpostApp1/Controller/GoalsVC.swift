//
//  ViewController.swift
//  goalpostApp1
//
//  Created by Islam Kasem on 29/05/2019.
//  Copyright © 2019 Islam Kasem. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {
    
 

    @IBOutlet weak var tableView: UITableView!
    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
     
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        
    }


}
extension GoalsVC :UITableViewDelegate ,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {
            return UITableViewCell()
        }
        //let aa : GoalType.GoalType = .shortTerm
      //  print (aa)
        cell.configureCell(description : "Eat Salad twice a week" , type :.shortTerm , goalProgressAmount : 3)
        return cell
    }
    
    
}

