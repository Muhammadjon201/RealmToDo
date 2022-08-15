//
//  AddTaskCell.swift
//  ToDoList
//
//  Created by ericzero on 6/29/22.
//

import UIKit

class AddTaskCell: UICollectionViewCell {
    
    @IBOutlet var mainView: UIView! {
        didSet {
            mainView.backgroundColor = .blue
        }
    }
    
    @IBOutlet var taskLbl: UILabel!
    @IBOutlet var circleView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateCell(info: OptionDM) {
    
        taskLbl.text = info.title
        if info.isSelected {
            mainView.backgroundColor = .green
            taskLbl.textColor = .white
            taskLbl.isHidden = true
        }else {
            mainView.backgroundColor = UIColor.white
            taskLbl.textColor = .gray
            taskLbl.isHidden = false
        }
        
    }

}

