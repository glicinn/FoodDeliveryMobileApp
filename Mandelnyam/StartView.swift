//
//  StartView.swift
//  Mandelnyam
//
//  Created by Дмитрiй Дѣренъ on 18.10.2023.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView{

                
                VStack{
                    Spacer()
                    Spacer()
                    
                    OnboardView(
                        systemImageName: "logo",
                        title: "Мандельням",
                        description: "Приложение Mandelnyam поможет вам быстро и доступно получить еду на дом "
                    )
                    
                    

                    
                    NavigationLink(destination: AuthorizationView().navigationBarBackButtonHidden(true)){
                        Text("Начать")
                            .bold()
                            .font(Font.custom("Avenir", size: 25))
                            .padding(12)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 125)
                            .background(Color("m"))
                            .foregroundColor(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 25))

                    } .padding(.vertical, 30)
                    
                    Spacer()

                }
                
            
        }
    }
}



#Preview {
    StartView()
}


struct OnboardView: View {
    let systemImageName: String
    let title: String
    let description: String
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemImageName)
                .resizable()
                .scaledToFit ()
                .frame (width: UIScreen.main.bounds.size.width/2)
                .foregroundColor (.teal)
            Text(title)
                .font(Font.custom("Avenir", size: 30))
                .bold ()
            Text(description)
                .multilineTextAlignment (.center)
                .foregroundColor (.secondary)
        }
        .padding (.horizontal, 40)
    }
}
