//
//  ContentView.swift
//  Mandelnyam
//
//  Created by Дмитрiй Дѣренъ on 18.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("uLogin") var userLogin: String = ""
    @State var detailPage = false
    
    var body: some View {
        if userLogin == ""{
            StartView()
            
//            MapView()
//                .environmentObject(vm)
            
//            MainView(selectedTab: $selectedTab, isTapped: $isTapped, tabSelection: 1)
            

        } else {
            
            MainView()
                .edgesIgnoringSafeArea(.top)
            
        }
    }
}

#Preview {
    ContentView()
}
