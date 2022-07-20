//
//  BaseViewModel.swift
//  NikeApp
//
//  Created by Алексей Зарицький on 17.07.2022.
//

import SwiftUI

class BaseViewModel: ObservableObject {
   
    //MARK: Tab Bar...
    @Published var currentTab: Tab = .Home
    
    @Published var homeTab = "Sneakers"
    
    // Detail View Properties...
    @Published var currentProduct: Product?
    @Published var showDetail = false
    
    
    @Published var likedProducts: [Product] = []
}

// Enum Case for Tab Items...
enum Tab: String{
    case Home = "home"
    case Favorite = "favorite"
    case ClipBoard = "clipboard"
    case Person = "person"
}

