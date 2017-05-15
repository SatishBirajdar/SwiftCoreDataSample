//
//  ViewController.swift
//  CoreDataSampleApp
//
//  Created by User on 2017-05-11.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import UIKit

import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var TF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
  
    // Core Data Stack Setup for In-Memory Store
    public func createMainContext() -> NSManagedObjectContext {
        
        // Replace "Model" with the name of your model
        let modelUrl = Bundle.main.url(forResource: "Model", withExtension: "momd")
        guard let model = NSManagedObjectModel.init(contentsOf: modelUrl!) else { fatalError("model not found") }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: model)
        try! psc.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
        
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = psc
        
        return context
    }
    
    
    

    
    @IBAction func buttonClicked(_ sender: Any) {
        let context = createMainContext()
        
        // Insert a new Entity
        let ent = NSEntityDescription.insertNewObject(forEntityName: "Entity", into: context)
        ent.setValue(42, forKey: "attribute")
        
        try! context.save()
        
        // Perform a fetch request
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        let result = try! context.fetch(fr)
        
//        result.valueForKey("attribute")
//        
//        print(result.value(forKeyPath: "attribute")!)
        
       
        
        print(result)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

