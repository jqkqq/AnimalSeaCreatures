//
//  HomeView.swift
//  AnimalSeaCreatures


import SwiftUI
import ASCollectionView
import Combine

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        NavigationView {
            ASCollectionView(data: viewModel.seaFeature, dataID: \.name) { item, _ in
                NavigationLink(destination: SeaFeatureDetailView(seaFeature: item, hide: false)) {
                    SeaFeatureView(seaFeature: item)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .layout {
                .grid(layoutMode: .adaptive(withMinItemSize: UIScreen.main.bounds.width / 3),
                      itemSpacing: 5,
                      lineSpacing: 25,
                      itemSize: .absolute(UIScreen.main.bounds.width / 3))
            }
            .background(Color.init(red: 187/255, green: 1, blue: 1))
            .navigationBarTitle("海洋生物", displayMode: .inline)
        }
        
    }
}
