//
//  SeaFeatureDetailViewModel.swift
//  AnimalSeaCreatures


import Foundation
import Combine
import SwiftUI

class SeaFeatureDetailViewModel: ObservableObject {
    
    @Published var seaFeature: Value
    @Published var isLove = false
    @Published var hide = false
    
    private var cancellables: [AnyCancellable] = []
    private let isLoveSubject = PassthroughSubject<Value, Never>()
    
    init(seaFeature: Value) {
        self.seaFeature = seaFeature
        self.checkIsLove()
    }
    
    func checkNorthMonth(_ month: Int) -> Color {
        let bool = !seaFeature.availability.monthArrayNorthern.filter({
            $0 == month
        }).isEmpty
        return bool ? Color.green: Color.clear
    }
    
    func checkSourthMonth(_ month: Int) -> Color {
        let bool = !seaFeature.availability.monthArraySouthern.filter({
            $0 == month
            }).isEmpty
        return bool ? Color.green: Color.clear
    }
    
    func checkTime(_ hour: Int) -> Color {
        let bool = !seaFeature.availability.timeArray.filter({
            $0 == hour
            }).isEmpty
        return bool ? Color.green: Color.clear
    }
    
    func checkIsLove() {
//        let allData = RealmManager.shared.fetchAll()
//        isLove = !allData.filter({
//            $0.name == seaFeature.name.nameCNzh
//        }).isEmpty
        
        $seaFeature
            .map { (seaFeature) -> Bool in
                let allData = RealmManager.shared.fetchAll()
                let bool = !allData.filter({
                    $0.name == seaFeature.name.nameCNzh
                }).isEmpty
                return bool
        }
        .assign(to: \.isLove, on: self)
        .store(in: &cancellables)
    }
    
    func addLove() {
        RealmManager.shared.add(seaFeature)
        isLove = true
    }
    
    func deleteLove() {
        let allData = RealmManager.shared.fetchAll()
        guard let deleteSea = allData.filter({
            $0.name == seaFeature.name.nameCNzh
        }).first else { return }
        RealmManager.shared.delete(deleteSea)
        isLove = false
        NotificationCenter.default.post(name: NSNotification.Name("refresh"), object: nil)
    }
    
    
}
