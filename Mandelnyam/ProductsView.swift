//
//  ProductsView.swift
//  Mandelnyam
//
//  Created by Дмитрiй Дѣренъ on 18.10.2023.
//

import SwiftUI
import Foundation // Для работы с датами

struct ProductsView: View {
    
    @State var selectedTab = "safari"
    @State var isTapped = false
    
    // Animation properties
    @State var currentItem: Product?
    @Binding var showDetailPage: Bool
    
    //Matched Geometry Effect
    @Namespace var animation
    
    // Detail Animation Properties
    @State var animateView: Bool = false
    @State var animateContent: Bool = false
    @State var scrollOffset: CGFloat = 0
    
    @State var day = ""
    
    @State private var find = ""
    
    var body: some View {
//        VStack(){
//            NavigationView{
//
//                ScrollView{
//
//                    Text("News")
//                        .font(Font.custom("Avenir", size: 30))
//                        .bold()
//                        .font (.title) .bold ()
//
//                    NavigationLink(destination: ContentView()){
//                        NewsWindowView(title: "Dog in glasses! Wow!")
//                    }
//                    NavigationLink(destination: ContentView()){
//                        NewsWindowView(title: "Sheeshuahua")
//                    }
//                    NavigationLink(destination: ContentView()){
//                        NewsWindowView(title: "Putin's dog alabai")
//                    }
//
//                }
//
//
//
//            }
//            Spacer()
//            CustomTabBar(selectedTab: $selectedTab, isTapped: $isTapped)
//        }
        
        
        
        
        ZStack(alignment: .bottom){
            
            
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 0){
                    HStack(alignment: .bottom){
                        VStack(alignment: .leading, spacing: 8){
                            
                            Text("\(Date.now, format: .dateTime.weekday(.wide)) \(Date.now, format: .dateTime.day()) \(Date.now, format: .dateTime.month(.wide))")
                                .textCase(.uppercase)
                                .font (.callout)
                                .foregroundColor (.gray)

//\\
//                            Text ("СРЕДА 18 ОКТЯБРЯ")
//                                .font (.callout)
//                                .foregroundColor (.gray)
                            
                            Text ("Продукты")
                                .bold()
                                .font(Font.custom("Avenir", size: 40))
//                                .font(.largeTitle.bold())
                            
//                            TextField("Поиск", text: $find)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .font(Font.custom("Avenir", size: 20))
//                                .padding(.horizontal, 50)
//                                .bold()
                            
                            //                .border(Color.black)
                                
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    .opacity(showDetailPage ? 0 : 1)
                    
                    ForEach(productItems){ item in
                        
                        Button(action: {
                            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                                currentItem = item
                                showDetailPage = true
                            }
                        }
                        ) {
                            CardView(item: item)
                            // For Matched Geometry Effect We Didnt applied Padding
                            // Instead Applying Scaling
                            // Approx Scaling Value to match padding
                                .scaleEffect(currentItem?.id == item.id && showDetailPage ? 1: 0.93)
                        }
                        .buttonStyle(ScaledButtonStyle())
                        .opacity(showDetailPage ? (currentItem?.id == item.id ? 1 : 0) : 1)
                        
                    }
                    
                }
                .padding(.vertical)
                .padding(.bottom, 30)
                
            }
            .overlay{
                if let currentItem = currentItem, showDetailPage{
                    DetailView(item: currentItem)
                        .ignoresSafeArea(.container, edges: .top)
//                        .background(Color.white)
                        .background(Color.primary.opacity(0.12).ignoresSafeArea())
                }
            }
            .background(animateView ? nil : Color.primary.opacity(0.12).ignoresSafeArea())
            // небольшое затемнение фона
            
            

//                .offset (y: showDetailPage ? 120 : 0) // Сдвиг при выборе новости
            
        }
        
        .background(alignment: .top){
            RoundedRectangle(cornerRadius: 15, style: .continuous)
//                .fill(Color.white)
                .fill(.thickMaterial)
//                .fill(Color("BG"))
                .frame(height: animateView ? nil : 350, alignment: .top)
                .scaleEffect(animateView ? 1 : 0.93)
                .opacity(animateView ? 1 : 0)
                .ignoresSafeArea()
        }
    }
    
    
    
    
    
    
    
    
    
    
    // Card View:
    @ViewBuilder
    func CardView(item: Product)->some View{
        VStack(alignment: .leading, spacing: 15){
            ZStack(alignment: .topLeading){
                
                //Banner Image
                GeometryReader{proxy in
                    let size = proxy.size
                    
                    Image(item.artwork)  // Картинка баннера
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 15))
                    
                        .clipShape(CustomCorner(corners: [.bottomLeft, .bottomRight], radius: showDetailPage ? 0: 15)) // Скругление баннера внизу
                    
                }
                .frame(height: 400)
                
                
                LinearGradient(colors: [
                    .black.opacity(0.5),
                    .black.opacity(0.2),
                    .clear
                ], startPoint: .top, endPoint: .bottom)
                .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 15))
                

                
                VStack(alignment: .leading, spacing: 8){ // Над заголовком
                    Text(item.platformTitle.uppercased())
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Text(item.bannerTitle)   // Заголовок
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.leading)
                }
//                .foregroundColor(.primary)
                .foregroundColor(.white)
                .padding()
                .offset(y: currentItem?.id == item.id && animateView ? safeArea().top : 0)
            }
            
            
            
            
//--------------Раскомментировать для появления иконки с описанием -----------------------------------------------------------------------------------------------
            
            
            
            
//            HStack(spacing: 12){
//                Image(item.appLogo)   // Лого приложения
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 60, height: 60)
//                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
//
//
//
//                VStack(alignment: .leading, spacing: 4){
//                    Text(item.platformTitle.uppercased()) // Платформа
//                        .font(.caption)
//                        .foregroundColor(.gray)
//
//                    Text(item.appName)  // Название приложения
//                        .fontWeight(.bold)
//
//                    Text(item.appDescription) // Описание приложения
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                }
//                .foregroundColor(.primary)
//                .frame(maxWidth: .infinity, alignment: .leading)
//
//
//                Button(action: {  // Кнопка Get
//
//                }){
//                    Text("GET")
//                        .fontWeight(.bold)
//                        .foregroundColor(.blue)
//                        .padding(.vertical, 8)
//                        .padding(.horizontal, 20)
//                        .background{
//                            Capsule()
//                                .fill(.ultraThinMaterial)
////                                .fill(Color.white)
//                        }
//                }
//
//            }
//            .padding([.horizontal, .bottom])

            
            
            
//------------------------------------------------------------------------------------------------------------------------------------------------------
            
            
            
        }
        .background{
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.white)
        }
//        .padding(.horizontal, 10)
        .matchedGeometryEffect(id: item.id, in: animation)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    // Detail View:
    @ViewBuilder
    func DetailView(item: Product)->some View{
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                CardView(item: item)
                    .scaleEffect(animateView ? 1 : 0.93)
                
                VStack(spacing: 15){
                    Text(dummyText)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                        .padding(.bottom, 20)
//                        .foregroundColor(Color("antiText"))
                    
                    Divider()
                    
                    Button(action: {
                        
                    }){
                        Label{
                            Text("В корзину")
                        } icon: {
                            Image(systemName: "square.and.arrow.down.fill")
                        }
                        .foregroundColor(.primary)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background{
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .fill(.ultraThinMaterial)
                        }
                        //                        .padding(.bottom, 80)
                    }
                }
                .padding()
                .offset(y: scrollOffset > 0 ? scrollOffset : 0)
                .opacity(animateContent ? 1 : 0)
                .scaleEffect(animateView ? 1 : 0, anchor: .top)
                    
            }
            .offset(y: scrollOffset > 0 ? -scrollOffset : 0)
            .offset(offset: $scrollOffset)
        }
        .coordinateSpace(name: "SCROLL")
        .overlay(alignment: .topTrailing, content: {
            Button{
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                    animateView = false
                    animateContent = false
                }
                
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(0.05)){
                    currentItem = nil
                    showDetailPage = false
                }
                
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .padding(.top, safeArea().top)
            .offset(y: -10)
            .opacity(animateView ? 1 : 0)
        })
        .onAppear{
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                animateView = true
            }
            
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(0.1)){
                animateContent = true
            }
        }
        .transition(.identity)
        
    }
}







// Scaled ButtonStyle

struct ScaledButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.94 : 1)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}

//Safe Area Value
extension View{
    func safeArea()->UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        
        return safeArea
    }
    
    // ScrollView Offset
    func offset(offset: Binding<CGFloat>)->some View{
        return self
            .overlay{
                GeometryReader{proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    
                    Color.clear
                        .preference(key: OffsetKey.self,  value: minY)
                }
                .onPreferenceChange(OffsetKey.self) { value in
                    offset.wrappedValue = value
                }
            }
    }
}

//Offset Key
struct OffsetKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}










//struct NewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsView()
//    }
//}







struct NewsWindowView: View {
//    let imageName: String
    let title: String
//    let description: String

    var body: some View {
        Button(action: {

        }){
            ZStack(alignment: .bottom){
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(.thickMaterial)
                    .padding()
                    .frame(height: 350)
                    .shadow(color: .gray, radius: 2) //легкая тень


                VStack{
                    Image("doginglasses")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 320)
                        .cornerRadius(20)

                    Text(title)
                        .font(Font.custom("Avenir", size: 25))
                        .bold()
                        .padding(.bottom, 30)
                        .foregroundColor(.black)
                }
            }
        }
    }
}



class HapticManager{ // Класс для работы TapticEngine
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle){
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
