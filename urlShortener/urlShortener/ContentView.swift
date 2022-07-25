//
//  ContentView.swift
//  urlShortener
//
//  Created by Ahmet Mert ÖZ on 25.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    let ekranboyutu = UIScreen.main.bounds
    
    @StateObject var shortURL = URLShortManager()
    
    var body: some View {
      
        
        Form{
            Section("Link"){
                
                TextEditor(text: $shortURL.inputURL)
                    .frame( height: ekranboyutu.height * 0.1)
                
                HStack{
                    Spacer()
                    Button("Submit"){
                        if shortURL.inputURL.isEmpty {
                            shortURL.resultURL = "Please add a url first..."
                        }else{
                            shortURL.resultURL = "Loading..."
                            shortURL.getData()
                        }
                    }
                    Spacer()
                }
                
                    
            }
            
            Section("Short Link"){
                TextField("Your shortened link will appear here.", text: $shortURL.resultURL)
                    .textSelection(.enabled)
                    .foregroundColor(.green)
                
            }
            
            Section(){
                HStack{
                    Spacer()
                    Button("Reset"){
                        shortURL.inputURL = ""
                        shortURL.resultURL = ""
                    }.foregroundColor(.red)
                   Spacer()
                    
                }
            }
            Section(){
                HStack{
                    Spacer()
                    Button("Copy"){
                        UIPasteboard.general.string = shortURL.resultURL
                    }.foregroundColor(.green)
                   Spacer()
                    
                }
            }
            
        }.environmentObject(shortURL)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
