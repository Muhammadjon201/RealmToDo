//
//  TableViewCell.swift
//  ToDoList
//
//  Created by ericzero on 6/26/22.
//


import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var bigView: UIView! {
        didSet {
            bigView.layer.cornerRadius = 5
            bigView.layer.shadowOpacity = 0.5
            bigView.layer.shadowOffset = CGSize(width: 3, height: 5)
            bigView.layer.shadowRadius = 10
            bigView.layer.borderWidth = 0.02
            bigView.layer.shadowColor = CGColor(red: 240/255, green: 235/255, blue: 227/255, alpha: 1)
        }
    }
    @IBOutlet var sideView: UIView!
    @IBOutlet var timeLbl: UILabel!
    @IBOutlet var contentLbl: UILabel!
    @IBOutlet var cellRingBtn: UIButton!
    @IBOutlet var circleBtn: UIButton!
    var check = true
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBAction func ringBtnPressed(_ sender: Any) {
        if check{
            cellRingBtn.setImage(UIImage(named: "cellBell"), for: .normal)
        }else{
            cellRingBtn.setImage(UIImage(named: "bell2"), for: .normal)
        }
        check = !check
    }
    
    
    @IBAction func circleBtnPressed(_ sender: Any) {
        if check{
                    circleBtn.setImage(UIImage(named: "circle"), for: .normal)
                    contentLbl.textColor = UIColor.black
            contentLbl.attributedText = NSAttributedString(string: "Booked", attributes:[
                        NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
                        NSAttributedString.Key.foregroundColor: UIColor.black])
                }else{
                    contentLbl.attributedText = NSAttributedString(string: "Booked", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2])
                    circleBtn.setImage(UIImage(named: "checked"), for: .normal)
                    contentLbl.textColor = UIColor.systemGray2
                }
                check = !check
    }
    func updateCell(list: List){
        contentLbl.text = list.title
        circleBtn.setImage(UIImage(named: "circle"), for: .normal)
        cellRingBtn.setImage(UIImage(named: "cellBell"), for: .normal)
        }
}


