//
//  HomeViewModel.swift
//  AnimalSeaCreatures

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var seaFeature: [Value] = []
    var cancellationToken: [AnyCancellable] = []
    
    init() {
        loadData()        
    }
        
    func loadData() {
//        APIManager.shared.loadData(completion: {
//            self.seaFeature = $0
//        })
        let token = APIManager.shared.loadSeaFeature()
            .sink(receiveCompletion: { completion in
                print(completion)
            }) { (seaFeature) in
                self.seaFeature =
                    seaFeature
                        .map({ $0.value })
                        .sorted(by: { $0.id < $1.id })
        }
        cancellationToken += [token]
    }
    

}

