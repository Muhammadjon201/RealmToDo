//
//  ListVC.swift
//  ToDoList
//
//  Created by ericzero on 6/26/22.
//

import UIKit

class ListVC: UIViewController {
    @IBOutlet weak var listCV: UICollectionView! {
        didSet {
            listCV.delegate = self
            listCV.dataSource = self
            listCV.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        }
    }
    
    let numberOfColumns: CGFloat = 2
    
    var items = [CharacterDM(title: "Personal", title2: "0 Task", image: "user", backView:
                     "personalColor", isSelected: true),
                 CharacterDM(title: "Work", title2: "2 Tasks", image: "work", backView: "workColor", isSelected: false),
                 CharacterDM(title: "Meeting", title2: "5 Tasks", image: "meeting", backView: "meetingColor", isSelected: false),
                 CharacterDM(title: "Shopping", title2: "2 Tasks", image: "shopping", backView: "shoppingColor", isSelected: false),
                 CharacterDM(title: "Party", title2: "1 Task", image: "party", backView: "partyColor", isSelected: false),
                 CharacterDM(title: "Study", title2: "6 Tasks", image: "study", backView: "studyColor", isSelected: false),
                 CharacterDM(title: "Personal", title2: "0 Task", image: "user", backView:
                     "personalColor", isSelected: false),
                 CharacterDM(title: "Work", title2: "2 Tasks", image: "work", backView: "workColor", isSelected: false),
                 CharacterDM(title: "Meeting", title2: "5 Tasks", image: "meeting", backView: "meetingColor", isSelected: false),
                 CharacterDM(title: "Shopping", title2: "2 Tasks", image: "shopping", backView: "shoppingColor", isSelected: false),
                 CharacterDM(title: "Party", title2: "1 Task", image: "party", backView: "partyColor", isSelected: false),
                 CharacterDM(title: "Study", title2: "6 Tasks", image: "study", backView: "studyColor", isSelected: false)
    ]
    func initView(){
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        listCV.dataSource = self
        listCV.delegate = self
        listCV.register(UINib(nibName: "ListCC", bundle: nil), forCellWithReuseIdentifier: "ListCC")
        initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}

//MARK: - Collection view..
extension ListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = listCV.dequeueReusableCell(withReuseIdentifier: "ListCC", for: indexPath) as? ListCC else {return UICollectionViewCell() }
        
        cell.updateCell(data: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(((collectionView.frame.size.width - 20) / 2) - 5), height: CGFloat(((collectionView.frame.size.width - 20) / 2) - 5) * 1.1)

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    
}
