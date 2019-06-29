//
//  ViewController.swift
//  goalpostApp1
//
//  Created by Islam Kasem on 29/05/2019.
//  Copyright © 2019 Islam Kasem. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate  as?  AppDelegate


class GoalsVC: UIViewController {
    
 

    @IBOutlet weak var tableView: UITableView!
    
    var    goals : [Goal] = []
    
   
    @IBAction func undoBtnWasPressed(_ sender:
        Any) {
    
    }
    
    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        guard let createGoalVc = storyboard?.instantiateViewController(withIdentifier: "createGoalVC") else{
            return
        }
        presentDetail(createGoalVc)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       fetchData()
       tableView.reloadData()
    }
    
    func fetchData(){
        self.fetch { (complete) in
            if complete {
                if goals.count >= 1 {
                    tableView.isHidden = false
        
                }else{
                    tableView.isHidden = true
                }
            }
         
        }
    }

}
extension GoalsVC :UITableViewDelegate ,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
        
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath)
            in
            
             self.fetchData()
                  self.removeGoal(atIndexPAth: indexPath)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                self.fetchData()
            
           
        }
        
        let addAction = UITableViewRowAction(style: .normal, title: "ADD 1") { (rowAction, indexPath) in
            self.setGoalProgress(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        addAction.backgroundColor  = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return [deleteAction ,addAction] 
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {
            return UITableViewCell()
        }
        let goal = goals[indexPath.row]
        cell.configureCell(goal: goal)
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
}

extension GoalsVC {
    
    func setGoalProgress(atIndexPath indexPath : IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let chosenGoal = goals[indexPath.row]
        if chosenGoal.goalProgress < chosenGoal.goalCompletionValue{
            chosenGoal.goalProgress = chosenGoal.goalProgress + 1
        }else{
            return
        }
        do {
            try managedContext.save()
            print("sucessully set the progress")
        }catch{
            debugPrint("could not save the progress\(error.localizedDescription)")
            
        }
    }
    
    func removeGoal (atIndexPAth indexPath : IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        managedContext.delete(goals[indexPath.row])
        do {
            try managedContext.save()
            print("sucessfully removed goal!")
        }catch {
            debugPrint("cannot save \(error)")
        }
    }
    func fetch (completion : (_ complete : Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
      
        do {
       goals =  try managedContext.fetch(fetchRequest)
            print("sucessfully fetched data")
            completion(true)
        } catch {
            debugPrint("could not fetch: \(error.localizedDescription)")
            completion(false)
        }
        
    }
}

