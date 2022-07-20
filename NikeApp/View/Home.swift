//
//  Home.swift
//  NikeApp
//
//  Created by Алексей Зарицький on 17.07.2022.
//

import SwiftUI

struct Home: View {
    
    // Matched Geometry effect...
    @Namespace var animation
    @EnvironmentObject var baseData: BaseViewModel
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15) {
                
                HStack{
                    
                    Button {
                        
                    } label: {
                        Image("menu")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25,height: 25)
                            .foregroundColor(Color.black)
                        // adding white bg for button and other
                            .padding(.vertical,12)
                            .padding(.horizontal,12)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.16), radius: 16, x: 4, y: 4)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25,height: 25)
                            .foregroundColor(Color.black)
                        // adding white bg for button and other
                            .padding(.vertical,12)
                            .padding(.horizontal,12)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.16), radius: 16, x: 4, y: 4)
                    }
                }
                //.overlay(Image("logo"))
                .overlay(Image("logo1").resizable().aspectRatio(contentMode: .fill).frame(width: 100,height: 80))
                
                HStack {
                    
                    Text("Our Products")
                        .font(.title.bold())
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        HStack(spacing: 3){
                            
                            Text("Sort by")
                                .font(.caption.bold())
                            
                            Image(systemName: "chevron.down")
                                .font(.caption.bold())
                        }
                        .foregroundColor(Color.gray)
                    }
                }
                .padding(.top,25)
                
                // Custom Segment Tab...
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 18){
                        
                        // SegmentButton...
                        SegmentButton(image: "p3", title: "Sneakers")
                        
                        SegmentButton(image: "watch", title: "Watch")
                        
                        SegmentButton(image: "backpack", title: "Backpack")
                    }
                    .padding(.vertical)
                }
                
                
                // Product View...
                let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
                
                // Grid View...
                LazyVGrid(columns: columns,spacing: 18) {
                    
                    // Products...
                    ForEach(products){product in
                        CardView(product: product)
                            .onTapGesture{
                                withAnimation{
                                    baseData.currentProduct = product
                                    baseData.showDetail = true
                                }
                            }
                    }
                }
            }
            .padding()
            // Bottom Tab bar approx padding...
            .padding(.bottom,100)
        }
        .overlay(
            DetailView(animation: animation)
                .environmentObject(baseData)
        )
    }
    
    @ViewBuilder
    func CardView(product: Product)->some View{
        
        VStack(spacing: 15) {
            
            Button {
                
            } label: {
                Image(systemName: "suit.heart.fill")
                    .font(.system(size: 13))
                    .foregroundColor(product.isLiked ? .white : .gray)
                    .padding(5)
                    .background(
                    

                        Color.red.opacity(product.isLiked ? 1 : 0),
                        in: Circle()
                )
            }
            .frame(maxWidth: .infinity,alignment: .trailing)
            
            Image(product.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: product.productImage, in: animation)
                .padding()
                .rotationEffect(.init(degrees: -20))
                .background(
                
                    ZStack {
                        Circle()
                            .fill(product.productBG)
                            .padding(-10)
                        // White inner Circle...
                        Circle()
                            .stroke(Color.white,lineWidth: 1.4)
                            .padding(-3)
                    }
                )
            Text(product.productTitle)
                .fontWeight(.semibold)
                .padding(.top)
                
            Text(product.productPrice)
                .font(.title2.bold())
                
            // Star View...
            HStack(spacing: 4){
                
                ForEach(1...4,id: \.self){index in
                    
                    Image(systemName: "star.fill")
                        .font(.system(size: 9.5))
                        .foregroundColor(product.productRating >= index ? .yellow : Color.gray.opacity(0.6))
                }
                
                Text(" (\(product.productRating).0)")
                    .font(.caption.bold())
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white,in: RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
    }
    
    
    @ViewBuilder
    func SegmentButton(image: String,title: String)-> some View {
        Button {
            withAnimation{baseData.homeTab = title}
        } label: {
            
            HStack(spacing: 8) {
                
                Image(image)
                    .resizable()
                   // .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27, height: 27)
                    
                Text(title)
                    .font(.system(size: 12.5))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .padding(.vertical,8)
            .padding(.horizontal,12)
            .background(
            
                ZStack{
                    // Transition Slider...
                    if baseData.homeTab == title{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
                    }
                }
            )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
