//
//  AddVC.swift
//  ToDoList
//
//  Created by ericzero on 6/26/22.
//

import UIKit


class AddVC: UIViewController {

    @IBOutlet weak var addTaskTF: UITextField!
    @IBOutlet weak var addDateTF: UITextField!
    @IBOutlet weak var addTaskBtn: UIButton! {
        didSet {
            addTaskBtn.layer.shadowColor = UIColor(named: "partyColor")?.cgColor

            addTaskBtn.layer.shadowOpacity = 0.7
            addTaskBtn.layer.shadowRadius = 5
            addTaskBtn.layer.masksToBounds = false
            addTaskBtn.layer.shadowOffset = CGSize(width: 5, height: 1)
            addTaskBtn.backgroundColor = UIColor(red: 0.4003935456, green: 0.6815440655, blue: 1, alpha: 1)
        }
    }
    @IBOutlet weak var addCollectionView: UICollectionView! {
        didSet {
            addCollectionView.delegate = self
            addCollectionView.dataSource = self
            addCollectionView.register(UINib(nibName: "AddTaskCell", bundle: nil), forCellWithReuseIdentifier: "AddTaskCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerSettings()
        
    }
    
    var infos = [OptionDM(image: "personalColor", title: "Personal"),
                 OptionDM(image: "workColor", title: "Work"),
                 OptionDM(image: "meetingColor", title: "Meeting"),
                 OptionDM(image: "shoppingColor", title: "Shopping"),
                 OptionDM(image: "partyColor", title: "Party"),
                 OptionDM(image: "studyColor", title: "Study")
                  
    ]
    @IBAction func xBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // MARK: - Date Picker
    var datePicker = UIDatePicker()
    var dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateFormat = "dd/MM/yyyy"
      return formatter
    }()
    
    func datePickerSettings() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = UIDatePicker.Mode.date
        addDateTF.inputView = datePicker
        datePicker.addTarget(self, action: #selector(pickDate), for: .valueChanged)
    }
    @objc func pickDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        addDateTF.text = dateFormatter.string(from: datePicker.date)
    }
    
}

// MARK: - addCollectionCell
extension AddVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddTaskCell", for: indexPath) as? AddTaskCell
        else {return UICollectionViewCell()}
        
        cell.updateCell(info: infos[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {


    }
    
    
}


// MARK: TextField
//extension AddVC: UITextViewDelegate {
//    
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        guard let txtDate = textField.text else { return true }
//           if textField == addDateTF, let dt = dateFormatter.date(from: txtDate) {
//               if let datePicker = textField.inputView as? UIDatePicker {
//                   datePicker.setDate(dt, animated: true)
//               }
//           }
//           return true
//    }
//}

