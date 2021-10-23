//
//  ViewController.swift
//  CDDemo
//
//  Created by Deshmukh, Pratik Prabhakar on 23/10/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createData()
        fetchData()
    }

    
    //MARK: Core Data Methods
    private let entityName = "Users"
    private func createData() {
        guard let managedContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {return}
        
        guard let userEntity = NSEntityDescription.entity(forEntityName: entityName, in: managedContext) else {
            fatalError()
        }
        
        let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
        user.setValue("pratik@gmail.com", forKey: "email")
        user.setValue("1234", forKey: "password")
        user.setValue("Pratik2", forKey: "username")
        
        do {
            try managedContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func fetchData() {
        guard let managedContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {return}
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
       // fetchRequest.predicate = NSPredicate(format: "username = %@", "Pratik1")
        do {
            let result = try managedContext.fetch(fetchRequest)
            for user in result as! [NSManagedObject] {
                let name = user.value(forKey: "username") as! String
                print(name)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func UpdateData() {
        guard let managedContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {return}
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
       // fetchRequest.predicate = NSPredicate(format: "username = %@", "Pratik1")
        do {
            let result = try managedContext.fetch(fetchRequest)
            for user in result as! [NSManagedObject] {
                let name = user.value(forKey: "username") as! String
                print(name)
            }
        } catch {
            print(error.localizedDescription)
        }
    }

}

