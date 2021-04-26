//
//  EntryListTableViewController.swift
//  JournalCoreData
//
//  Created by James Chun on 4/26/21.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EntryController.sharedInstance.fetchEntries()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.sharedInstance.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath) as? EntryTableViewCell else { return UITableViewCell() }
        
        let entry = EntryController.sharedInstance.entries[indexPath.row]
        
        cell.configure(with: entry)

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entry = EntryController.sharedInstance.entries[indexPath.row]
            EntryController.sharedInstance.deleteEntry(entry)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        if segue.identifier == "toEditEntry" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? EntryDetailViewController else { return }
            
            let entryToSend = EntryController.sharedInstance.entries[indexPath.row]
            destinationVC.entry = entryToSend
        }
    }

}//End of class


