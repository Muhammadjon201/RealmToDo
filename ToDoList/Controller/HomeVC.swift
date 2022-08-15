//
//  HomeVC.swift
//  ToDoList
//
//  Created by ericzero on 6/26/22.
//

import UIKit

class HomeVC: UIViewController {
 
    @IBOutlet weak var reminderView: UIView! {
        didSet {
            reminderView.layer.cornerRadius = 5
        }
    }
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var navImg: UIButton! {
        didSet {
            navImg.layer.cornerRadius = 25
        }
    }
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var tableViewT: UITableView! {
        didSet {
            tableViewT.delegate = self
            tableViewT.dataSource = self
            tableViewT.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        }
    }
    
    var info = [List(id: "", image1: "", image2: "cellBell", time: "", title: "There are   bunch of todos you can enter bunch of todos you can enter", isSelected: true),
                List(id: "", image1: "", image2: "cellBell", time: "", title: "There are bunch of todos you can enter", isSelected: true),
                List(id: "", image1: "", image2: "cellBell", time: "", title: "There are bunch of todos you can enter", isSelected: true),
                List(id: "", image1: "", image2: "cellBell", time: "", title: "There are bunch of todos you can enter", isSelected: true),
                List(id: "", image1: "", image2: "cellBell", time: "", title: "There are bunch of todos you can enter", isSelected: true)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

//MARK: - Image PickerController..

extension HomeVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBAction func avatarImg(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        guard let image = info[.editedImage] as? UIImage else {return}
//        //navImg.image = image
//        dismiss(animated: true)
//   }
}
//MARK: - TableView Cell..
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewT.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {return UITableViewCell() }
        cell.updateCell(list: info[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
   
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // delete
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            completionHandler(true)
        }
        delete.image = UIImage(named: "delete")
        delete.backgroundColor = UIColor.white
        // action
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
}

