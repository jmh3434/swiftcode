//
//  ViewController.swift
//  HelloCoreData
//
//  Created by James Hunt on 7/13/21.
//

import UIKit
import CoreData

let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let users = [
            ["firstName": "John", "email": "john.blake@example.com"],
            ["firstName": "Rodney", "email": "rodney.roberts20@example.com"]
        ]
        users.forEach {
            user in
            let newUser = User(context: managedObjectContext) // Should have been declared as a constant within the ViewController's scope
            newUser.firstName = user["firstName"]
            newUser.email = user["email"]
            do {
                try managedObjectContext.save()
                print("Success view did load")
            } catch {
                print("Unresolved error \(error)")
                abort()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        do {
            let userRequest = try managedObjectContext.fetch(User.fetchRequest())
            
            userRequest.forEach {
                user in
                if let thisUser = user as? User {
                    if let email = thisUser.email, let firstName = thisUser.firstName  {
                        print("Email: \(email), First Name: \(firstName)")
                    }
                }
            }
        } catch {
            print("Error: \(error)")
        }
            super.viewDidAppear(animated)
    }

    

    
    
    @IBAction func save(_ sender: UIButton) {
        let user = User(context: managedObjectContext)
        
        // Under the 'saveUser' method, after the 'let user = ....' statement
        user.firstName = "Bob"
        user.email = "Bob@bobmail.com"
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Success!")
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
        
    }
    
    
    
}

