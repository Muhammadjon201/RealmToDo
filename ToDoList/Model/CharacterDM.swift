//
//  Items.swift
//  ToDoList
//
//  Created by ericzero on 6/27/22.
//

import UIKit

// model for CollectionView
struct CharacterDM {
    let title: String
    let title2: String
    let image: String
    let backView: String
    let isSelected: Bool
}

// model for TableView
struct List {
    let id: String
    let image1: String
    let image2: String
    let time: String
    let title: String
    let isSelected: Bool
}

// model for addTask collectionView
struct OptionDM {
    let image: String
    let title: String
    let isSelected: Bool = false
}
