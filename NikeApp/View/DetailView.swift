//
//  DetailView.swift
//  NikeApp
//
//  Created by Алексей Зарицький on 18.07.2022.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var baseData: BaseViewModel
    // For Hero Effect...
    var animation: Namespace.ID
    
    @State var size = "US 8"
    @State var shoeColor: Color = .red
    
    var body: some View {
        
        // SafeCheck...
        if let product = baseData.currentProduct,baseData.showDetail{
            
            VStack(spacing: 0){
                
                // top bar...
                HStack{
                    
                    Button {
                        withAnimation{
                            baseData.showDetail = false
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black)
                            .padding(.vertical,12)
                            .padding(.horizontal,12)
                            .background(Color("BG"))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.4), radius: 16, x: 5, y: 5)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(.white)
                            .padding(6)
                            .background(Color.red,in: Circle())
                            .padding(.vertical,10)
                            .padding(.horizontal,10)
                            .background(Color("BG"))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.4), radius: 16, x: 5, y: 5)
                    }
                }
                //.overlay(Image("logo"))
                .overlay(Image("logo1").resizable().aspectRatio(contentMode: .fill).frame(width: 100,height: 80))
                .padding(.horizontal)
                .padding(.bottom)
                
                // Shoe Image...
                Image(product.productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                // Add matched geometry before frame()...
                    .matchedGeometryEffect(id: product.productImage, in: animation)
                    .frame(width: 250, height: 250)
                    .rotationEffect(.init(degrees: -20))
                    .background(
                    
                        ZStack{
                            
                            Circle()
                                .fill(product.productBG)
                                .padding()
                            
                            Circle()
                                .fill(Color.white.opacity(0.5))
                                .padding(60)
                        }
                    )
                    .frame(height: getScreenBounds().height / 3)
                
                //MARK:  Product Detail(title/price)...
                VStack(alignment: .leading, spacing: 18) {
                   
                    HStack {
                        
                        
                        Text(product.productTitle)
                            .font(.title.bold())
                        
                        Spacer(minLength: 10)
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Text("(\(product.productRating))")
                            .foregroundColor(.gray)
                    }
                    
                    Text("We could use a lot of superlatives to describe the Nike Air Max 2021. We could tell you that we've incorporated recycled materials.")
                        .font(.callout)
                        .lineSpacing(10)
                    
                    // Size...
                    HStack(spacing: 0){
                        
                        Text("Size: ")
                            .font(.caption.bold())
                            .foregroundColor(.gray)
                            .padding(.trailing)
                        
                        ForEach(["US 8","US 9","US 10","US 11"],id:
                                    \.self){size in
                            
                            Button {
                                self.size = size
                            } label: {
                                
                                Text(size)
                                    .font(.callout)
                                    .foregroundColor(.black)
                                    .padding(.vertical,8)
                                    .padding(.horizontal)
                                    .background(
                                    
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.orange)
                                            .opacity(self.size == size ? 0.3 : 0)
                                    )
                            }
                            
                        }
                    }
                    .padding(.vertical)
                    
                    // Color...
                    HStack(spacing: 15){
                        
                        let colors: [Color] = [.yellow,.red,.orange,.purple]
                        
                        Text("Available Color: ")
                            .font(.caption.bold())
                            .foregroundColor(.gray)
                            
                        
                        ForEach(colors,id:
                                    \.self){color in
                            
                            Button {
                                self.shoeColor = color
                            } label: {
                                
                                Circle()
                                    .fill(color.opacity(0.5))
                                    .frame(width: 25,height: 25)
                                    .overlay(
                                    
                                        //Ring for current color...
                                        Circle()
                                            .stroke(Color("Dark.blue"),lineWidth: 1.5)
                                            .opacity(shoeColor == color ? 0.2 : 0)
                                            .padding(-4)
                                    )
                            }
                            
                        }
                    }
                    .padding(.vertical)
                    
                    // Add to cart..
                    Button {
                        
                    } label: {
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: "bag.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20,height: 20)
                            
                            Text("Add to Bag")
                                .fontWeight(.bold)
                                 
                        }
                        .foregroundColor(Color("orange"))
                        .padding(.vertical,15)
                        .frame(maxWidth: .infinity)
                        .background(Color("orange").opacity(0.06))
                        .clipShape(Capsule())
                    }
                    .padding(.top)
                }
                .padding(.top)
                .padding()
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
                .background(
                    Color("DarkBlue")
                         .opacity(0.05)
                        .cornerRadius(25)
                        .ignoresSafeArea(.container, edges: .bottom)
                )
            }
            .padding(.top)
            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
            .background(Color.white)
            .transition(.opacity)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}

// Extending View to get screen Bounds...
extension View{
    func getScreenBounds()->CGRect{
        return UIScreen.main.bounds
    }
}
