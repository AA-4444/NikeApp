//
//  BaseView.swift
//  NikeApp
//
//  Created by Алексей Зарицький on 17.07.2022.
//

import SwiftUI

struct BaseView: View {
    @StateObject var baseData = BaseViewModel()
    
    // Hiding Tab Bar...
    init(){
        
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
       
        TabView(selection: $baseData.currentTab) {
            
            Home()
                .environmentObject(baseData)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BG"))
                .tag(Tab.Home)
            
            LikedPage()
                .environmentObject(baseData)
                .tag(Tab.Favorite)
            
            Text("Clipboard")
                .tag(Tab.ClipBoard)
            
            ProfilePage()
                .tag(Tab.Person)
               
        }
        .overlay(
        
             //Custom Tab Bar...
            HStack(spacing: 0){
                //tabButton...
                TabButton(Tab: .Home)
                
                TabButton(Tab: .Favorite)
                    .offset(x: -10)
                 // Center Curved Button...
                Button {
                    
                } label: {
                    Image(systemName: "bag.fill")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26, height: 26)
                        .foregroundColor(.white)
                        .padding(18)
                        .background(Color("orange"))
                        .clipShape(Circle())
                    //shadows...
                        .shadow(color: Color.black.opacity(0.04),radius: 5,x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.04),radius: 5,x: -5, y: -5)
                }
                .offset(y: -30)
                
                
                TabButton(Tab: .ClipBoard)
                    .offset(x: 10)
                
                TabButton(Tab: .Person)
            }
            .background(
                Color.white
                    .clipShape(CustomCurveShape())
                //shadow...
                    .shadow(color: Color.white.opacity(0.04),radius: 5,x: -5, y: -5)
                    .ignoresSafeArea(.container, edges: .bottom)
            )
            // hiding tab bar when detail view is open...
                .offset(y: baseData.showDetail ? 200 : 0)
            
            ,alignment: .bottom
        )
    }
    
    @ViewBuilder
    func TabButton(Tab: Tab)->some View{
        
        Button {
            withAnimation{
                baseData.currentTab = Tab
            }
        } label: {
            
            Image(Tab.rawValue)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(baseData.currentTab == Tab ? Color("orange") : Color.gray.opacity(0.5))
                .frame(maxWidth: .infinity)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
