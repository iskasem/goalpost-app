//
//  UIViewControllerExt.swift
//  goalpostApp1
//
//  Created by Islam Kasem on 20/06/2019.
//  Copyright © 2019 Islam Kasem. All rights reserved.
//

import UIKit
extension UIViewController{
    func presentDetail(_ viewControllerToPresent : UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition , forKey: kCATransition)
        present(viewControllerToPresent , animated: false , completion: nil)
        
    }
    
    func dismisDetail(){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition , forKey: kCATransition)
       
        dismiss(animated: false, completion: nil)
    }
    
    
    func presentSecondaryDetail(_ viewControllerToPresent : UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition , forKey: kCATransition)
        guard  let presentViewController = presentedViewController else {
            return
        }
        presentViewController.dismiss(animated: false) {
            self.view.window?.layer.add(transition , forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false,completion: nil)
        }
        dismiss(animated: false, completion: nil)
    }
}
