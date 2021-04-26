//
//  EntryTableViewCell.swift
//  JournalCoreData
//
//  Created by James Chun on 4/26/21.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    //MARK: - Actions
    func configure(with entry: Entry) {
        titleLabel.text = entry.title
        dateLabel.text = DateFormatter.entryDate.string(from: entry.timestamp ?? Date())
        timeLabel.text = DateFormatter.entryTime.string(from: entry.timestamp ?? Date())
    }

}//End of class

