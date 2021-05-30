//
//  ToDoDetailTableViewController.swift
//  ToDoList
//
//  Created by Gordon Choi on 2021/05/31.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var isCompleteButton: UIButton!
    @IBOutlet var dueDateLebel: UILabel!
    @IBOutlet var dueDatePickerView: UIDatePicker!
    @IBOutlet var notesTextView: UITextView!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    var isPickerHidden = true
    
    let dateLabelIndexPath = IndexPath(row: 0, section: 1)
    let datePickerIndexPath = IndexPath(row: 1, section: 1)
    let notesTextViewIndexPath = IndexPath(row: 0, section: 2)
    
    let normalCellHeight: CGFloat = 44
    let largeCellHeight: CGFloat = 200
    
}

extension ToDoDetailTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDatePickerView.date = Date().addingTimeInterval(86400)
        updateDueDateLabel(date: dueDatePickerView.date)
        updateSaveButtonState()
    }
}


extension ToDoDetailTableViewController {
    
    func updateSaveButtonState() {
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    func updateDueDateLabel(date: Date) {
        dueDateLebel.text = ToDo.dueDateFormatter.string(from: date)
    }
}


extension ToDoDetailTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datePickerIndexPath:
            return isPickerHidden ? 0 :
                dueDatePickerView.frame.height
        case notesTextViewIndexPath:
            return largeCellHeight
        default:
            return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == dateLabelIndexPath {
            isPickerHidden = !isPickerHidden
            dueDateLebel.textColor = isPickerHidden ? .black :
                tableView.tintColor
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension ToDoDetailTableViewController {
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePickerView.date)
    }
}
