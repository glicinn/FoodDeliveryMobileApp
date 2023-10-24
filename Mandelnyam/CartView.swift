//
//  CartView.swift
//  Mandelnyam
//
//  Created by Дмитрiй Дѣренъ on 19.10.2023.
//

import SwiftUI

struct CartView: View {
    
    var body: some View {
        
        ZStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 0){
                    HStack(alignment: .bottom){
                        VStack(alignment: .leading, spacing: 8){
                            
                            //\\
                            //                            Text ("СРЕДА 18 ОКТЯБРЯ")
                            //                                .font (.callout)
                            //                                .foregroundColor (.gray)
                            
                            Text ("Корзина")
                                .bold()
                                .font(Font.custom("Avenir", size: 40))
                            
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    Text ("КОРЗИНА ПУСТА")
                        .font (.callout)
                        .foregroundColor (.gray)
                        .padding(.vertical, 20)
                    
                    
                }
                .padding(.vertical)
                .padding(.bottom, 30)
                
            }
            .background(Color.primary.opacity(0.12).ignoresSafeArea())
            // небольшое затемнение фона
            
        }
    }
}

#Preview {
    CartView()
}
