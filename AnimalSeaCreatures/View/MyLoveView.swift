//
//  MyLoveView.swift
//  AnimalSeaCreatures


import SwiftUI
import Combine
import KingfisherSwiftUI

struct MyLoveView: View {
    
    @ObservedObject var viewModel = MyLoveViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(red: 187/255, green: 1, blue: 1, alpha: 1)
        UITableViewCell.appearance().backgroundColor = UIColor(red: 187/255, green: 1, blue: 1, alpha: 1)
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.myLoveData, id: \.name) { seaFeature in
                    NavigationLink(destination: SeaFeatureDetailView(seaFeature: seaFeature.changeToValue(), hide: true)) {
                        HStack {
                            KFImage(URL(string: seaFeature.iconURI))
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                            Group {
                                Text(seaFeature.name)
                                Spacer()
                                Text("\(seaFeature.price) 元").foregroundColor(.red)
                            }
                            .font(.system(size: 20))
                        }
                    }
                    
                }
            }
            .onAppear(perform: {
                self.viewModel.loadData()
            })
            .navigationBarTitle("我的最愛", displayMode: .inline)
        }
        
    }
}

struct MyLoveView_Previews: PreviewProvider {
    static var previews: some View {
        MyLoveView()
    }
}
