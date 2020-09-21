import UIKit
import CoreData

extension ChatViewController {
    func saveMessage(_ textMessage: String, context: NSManagedObjectContext) {
        let message = Messages(entity: Messages.entity(), insertInto: context)
        message.setValue(textMessage, forKey: "message")
        
        do {
            try context.save()
            messages.append(message)
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let result = try context.fetch(Messages.fetchRequest())
            messages = result as! [Messages]
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
}
