//
//  ListCC.swift
//  ToDoList
//
//  Created by ericzero on 6/26/22.
//

import UIKit

class ListCC: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 27
        }
    }
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var personalLbl: UILabel!
    @IBOutlet weak var tasksLbl: UILabel!
    @IBOutlet weak var cellBackgroundView: UIView! {
        didSet{
            cellBackgroundView.layer.cornerRadius = 7
            cellBackgroundView.layer.shadowColor = UIColor.gray.cgColor
            cellBackgroundView.layer.shadowOpacity = 0.5
            cellBackgroundView.layer.shadowRadius = 5
            cellBackgroundView.layer.shadowOffset = CGSize(width: 3, height: 3)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateCell(data: CharacterDM){
        personalLbl.text = data.title
        tasksLbl.text = data.title2
        containerView.backgroundColor = UIColor(named: data.backView)
        userImg.image = UIImage(named: data.image)
    }

}
