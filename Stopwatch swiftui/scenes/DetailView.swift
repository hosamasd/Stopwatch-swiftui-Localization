//
//  DetailView.swift
//  Stopwatch swiftui
//
//  Created by hosam on 3/11/21.
//

import SwiftUI

struct DetailView: View {
    
    
    @EnvironmentObject var vm : MainViewModel
    
    var body: some View {
        
        VStack {
            
            HStack{
                Image(systemName: "arrowshape.turn.up.backward")
                    .font(.largeTitle)
                
                Spacer()
            }
            .padding()
            .background(Color("Color"))
            
            Image("pict")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:120,height:120)
                .clipShape(Circle())
            
            Text("Built By \n HOSAM")
                .font(.system(size: 18))
                .multilineTextAlignment(.leading)
            Spacer()
            
            ScrollView {
                
                SectionHeaderView()
                
                Button(action: {
                    
                }, label: {
                    HStack{
                        Text("AppStore")
                            .font(.system(size: 16))
                            .foregroundColor(Color.black)
                        
                        Spacer()
                    }
                    .padding(.horizontal,30)
                    .padding(.vertical)
                })
                
                Divider()
                    .frame(width:UIScreen.main.bounds.width-64)
                
                
                Button(action: {
                    
                }, label: {
                    HStack{
                        Text("GitHub")
                            .font(.system(size: 16))
                            .foregroundColor(Color.black)
                        
                        Spacer()
                    }
                    .padding(.horizontal,30)
                    .padding(.vertical)
                })
                
                Divider()
                    .frame(width:UIScreen.main.bounds.width-64)
                
                
                Button(action: {
                    
                }, label: {
                    HStack{
                        Text("Facebook")
                            .font(.system(size: 16))
                            .foregroundColor(Color.black)
                        
                        Spacer()
                    }
                    .padding(.horizontal,30)
                    .padding(.vertical)
                })
                
                Divider()
                    .frame(width:UIScreen.main.bounds.width-64)
                
                Button(action: {
                    
                }, label: {
                    HStack{
                        Text("LinkedIn")
                            .font(.system(size: 16))
                            .foregroundColor(Color.black)
                        
                        Spacer()
                    }
                    .padding(.horizontal,30)
                    .padding(.vertical)
                })
                
                
                SectionHeaderView(name: "Language")
                
                Button(action: {
                    withAnimation{
                        vm.ss.toggle()
                    }
                }, label: {
                    HStack{
                        Text("English")
                            .font(.system(size: 16))
                            .foregroundColor(Color.black)
                        
                        Spacer()
                    }
                    .padding(.horizontal,30)
                    .padding(.vertical)
                })
                //
                
            }
            
        }
        .background(Color.white)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
