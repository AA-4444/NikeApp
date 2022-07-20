//
//  ProfilePage.swift
//  PanrApp2
//
//  Created by Алексей Зарицький on 15.07.2022.
//

import SwiftUI

struct ProfilePage: View {
    var body: some View {
      
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    Text("My Profile")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 15){
                        
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color("orange"))
                            .frame(width: 60, height: 60)
                            .offset(y: -30)
                            .padding(.bottom,-30)
                        
                        Text("User1")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                        
                        HStack(alignment: .top, spacing: 10) {
                            
                            Image(systemName: "location.north.circle.fill")
                                .foregroundColor(.gray)
                                .rotationEffect(.init(degrees: 180))
                            
                            Text("Addres: 221B Baker Street\nNew Jersey\nUSA")
                                .font(.system(size: 15))
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                      }
                    .padding([.horizontal,.bottom])
                    .background(
                    
                        Color.white
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.16), radius: 16, x: 4, y: 4)
                    )
                    .padding()
                    .padding(.top,40)
                    
                    // Custom navigation links...
                    
                    CustomNavigationLink(title: "Edit Profile") {
                        
                        Text("")
                            .navigationTitle("Edit Profile")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("BG").ignoresSafeArea())
                            
                    }
                    
                    CustomNavigationLink(title: "Shopping address") {
                        
                        Text("")
                            .navigationTitle("Shopping address")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("BG").ignoresSafeArea())
                            
                    }
                    
                    CustomNavigationLink(title: "Order history") {
                        
                        Text("")
                            .navigationTitle("Order history")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("BG").ignoresSafeArea())
                            
                    }
                    
                    CustomNavigationLink(title: "Credit/Debit Cards") {
                        
                        Text("")
                            .navigationTitle("Credit/Debit Cards")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("BG").ignoresSafeArea())
                            
                    }
                    
                    CustomNavigationLink(title: "Notifications") {
                        
                        Text("")
                            .navigationTitle("Notifications")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("BG").ignoresSafeArea())
                            
                    }
                    
                }
                .padding(.horizontal,22)
                .padding(.vertical,20)
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
            
                Color("BG")
                    .ignoresSafeArea()
            )
        }
    }
    
    
    @ViewBuilder
    func CustomNavigationLink<Detail: View>(title: String,@ViewBuilder content: @escaping ()->Detail)->some View{
        
        NavigationLink {
            content()
        } label: {
            
            HStack {
                
                Text(title)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding()
            .background(
            
                Color.white
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.16), radius: 16, x: 4, y: 4)
            )
            .padding(.horizontal)
            .padding(.top,10)
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
