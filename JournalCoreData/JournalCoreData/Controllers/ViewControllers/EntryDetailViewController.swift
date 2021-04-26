//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by James Chun on 4/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    //MARK: - Properties
    //Landing Pad
    var entry: Entry?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        bodyTextView.delegate = self
        bodyTextView.layer.borderColor = UIColor.gray.cgColor
        bodyTextView.layer.borderWidth = 2
        bodyTextView.layer.cornerRadius = 10
        titleTextField.layer.borderColor = UIColor.gray.cgColor
        titleTextField.layer.borderWidth = 2
        titleTextField.layer.cornerRadius = 10

        updateViews()
    }
    
    //MARK: - Actions

    @IBAction func saveEntryButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextView.text, !body.isEmpty else { return }
        
        if let entry = entry {
            entry.title = title
            entry.bodyText = body
            EntryController.sharedInstance.updateEntry(entry)
        } else {
            EntryController.sharedInstance.createEntry(title: title, body: body)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        titleTextField.placeholder = "Enter Journal Title here..."
        bodyTextView.text = ""
    }
    
    //MARK: - Functions
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
    }
    
}//End of class

//MARK: - Extensions

extension EntryDetailViewController: UITextFieldDelegate, UITextViewDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
    }
    
}
