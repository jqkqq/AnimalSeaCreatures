//
//  MyLoveViewModel.swift
//  AnimalSeaCreatures


import Foundation
import Combine

class MyLoveViewModel: ObservableObject {
    
    @Published var myLoveData: [MyLoveSea] = []
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(loadData), name: NSNotification.Name("refresh"), object: nil)
    }
    
    @objc func loadData() {
        myLoveData = RealmManager.shared.fetchAll()
    }
    
}
