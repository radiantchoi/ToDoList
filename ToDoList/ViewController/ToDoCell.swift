//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Gordon Choi on 2021/06/01.
//

import UIKit

protocol ToDoCellDelegate: class {
    func checkMarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
    
    @IBOutlet var isCompleteButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    weak var delegate: ToDoCellDelegate?
    
}

extension ToDoCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ToDoCell {
    @IBAction func completeButtonTapped() {
        delegate?.checkMarkTapped(sender: self)
    }
}
