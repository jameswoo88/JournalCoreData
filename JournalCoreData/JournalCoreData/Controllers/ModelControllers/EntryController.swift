//
//  EntryController.swift
//  JournalCoreData
//
//  Created by James Chun on 4/26/21.
//

import CoreData

class EntryController {
    //MARK: - Properties
    static let sharedInstance = EntryController()
    
    //SOT
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
        
    }()

    
    //MARK: - Functions
    //CRUD
    func createEntry(title: String, body: String) {
        let entry = Entry(title: title, bodyText: body)
        entries.append(entry)
        CoreDataStack.saveContext()
    }
    
    func fetchEntries() {
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print("# of entries: \(entries.count)")
        self.entries = entries
    }
    
    func updateEntry(_ entry: Entry) {
        CoreDataStack.saveContext()
    }
    
    func deleteEntry(_ entry: Entry) {
        guard let index = entries.firstIndex(of: entry) else { return }
        entries.remove(at: index)
        CoreDataStack.context.delete(entry)
        CoreDataStack.saveContext()
    }
    
}//End of class
