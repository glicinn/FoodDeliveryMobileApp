//
//  MainView.swift
//  Mandelnyam
//
//  Created by Дмитрiй Дѣренъ on 18.10.2023.
//

import SwiftUI

import SwiftUI

struct MainView: View {
    
    @State private var tabSelection = 1
    @State var showDetailPage = false
    
    init() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack{
            TabView(selection: $tabSelection){
                ProductsView(showDetailPage: $showDetailPage)
                    .tag(1)
                CartView()
                    .tag(2)
                ProfileView()
                    .tag(3)
            }
            .overlay(alignment: .bottom){
                CustomTabView(tabSelection: $tabSelection, showDetailPage: $showDetailPage)
            }
        }


    }
}


#Preview {
    MainView()
}
