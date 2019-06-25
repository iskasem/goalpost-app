//
//  FinishGoalVC.swift
//  goalpostApp1
//
//  Created by Islam Kasem on 21/06/2019.
//  Copyright © 2019 Islam Kasem. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController ,UITextFieldDelegate {
    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription : String!
    var goalType : GoalType!
   
    func initData(description : String , type : GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    override func viewDidLoad() {
        super.viewDidLoad()
createGoalBtn.bindToKeyBoard()
     pointsTextField.delegate = self
    }
    
    @IBAction func createBtnWasPressed(_ sender: Any) {
        //pass data into core data model
        if pointsTextField.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: false, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismisDetail()
    }
    
    func save (completion: (_ finished: Bool) ->()) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do{
          try  managedContext.save()
            print("Successfully saved data")
            completion(true)
        }catch {
            debugPrint("could not save\(error.localizedDescription)")
            completion(false)
        }
    }

}
