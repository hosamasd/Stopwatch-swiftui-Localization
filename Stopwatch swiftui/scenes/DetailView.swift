//
//  DetailView.swift
//  Stopwatch swiftui
//
//  Created by hosam on 3/11/21.
//

import SwiftUI
import SafariServices

struct DetailView: View {
    
    
    @EnvironmentObject var vm : MainViewModel
    var links = ["https://apps.apple.com/us/developer/hosam-mohamed/id1482369833",
                 "https://github.com/hosamasd?tab=repositories", "https://www.facebook.com/hosammohamedasd", "https://www.linkedin.com/in/hosam-mohamed-425a83119/"]
    @State var showSafari = false
    // initial URL string
    @State var urlString = "https://github.com/hosamasd?tab=repositories"
    @Binding var show:Bool
    
    var body: some View {
        
        VStack {
            
            HStack{
                Button(action: {
                    withAnimation{
                        self.show.toggle()
                    }
                }, label: {
                    Image(systemName: "arrowshape.turn.up.backward")
                        .font(.largeTitle)
                })
                
                Spacer()
            }
            .padding(.horizontal)
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
                    withAnimation{
                        urlString=links[0]
                        showSafari.toggle()
                        
                    }
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
                    withAnimation{
                        urlString=links[1]
                        showSafari.toggle()
                        
                    }
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
                    withAnimation{
                        urlString=links[2]
                        showSafari.toggle()
                        
                    }
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
                    withAnimation{
                        self.urlString=links[3]
                        showSafari.toggle()
                        
                    }
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
        .background(Color("Color").edgesIgnoringSafeArea(.bottom))
        
        // summon the Safari sheet
        .sheet(isPresented: $showSafari) {
            SafariView(url:URL(string: self.urlString)!)
        }
        
    }
    
    func loadFirst(index:Int)  {
        if  let url = URL(string: links[index]){
            let safari = SFSafariViewController(url: url)
            
        }
        
    }
}
