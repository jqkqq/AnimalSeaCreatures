//
//  SeaFeatureView.swift
//  AnimalSeaCreatures


import SwiftUI
import KingfisherSwiftUI

struct SeaFeatureView: View {
    
    var seaFeature: Value
    
    var body: some View {
        VStack {
            KFImage(URL(string: seaFeature.iconURI))
                .resizable()                
                .placeholder({
                    ActivityIndicator()
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(Color.gray)
                })
                
            if UIDevice.current.userInterfaceIdiom == .phone {
                Text("\(seaFeature.name.nameCNzh)")                    
            } else {
                Text("\(seaFeature.name.nameCNzh)")
                    .font(.system(size: 30))
            }
            
        }
    }
}
