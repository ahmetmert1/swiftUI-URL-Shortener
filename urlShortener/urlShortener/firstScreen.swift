//
//  firstScreen.swift
//  urlShortener
//
//  Created by Ahmet Mert ÖZ on 26.07.2022.
//

import SwiftUI

struct firstScreen: View {
    var body: some View {
  
        NavigationView{
            ZStack {
                LinearGradient(gradient: Gradient(colors: []), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack{
                    Spacer()
                    Image("link")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100, alignment: .center)
                        .padding()
                    
                    Text("Let's Make")
                        .font(.system(size: 25, weight: .light, design: .default))
                    Text("Shorter")
                        .font(.system(size: 25, weight: .light, design: .default))
                        .padding()
                    Spacer()
                    
                    NavigationLink(
                        destination: ContentView(),
                        label: {
                            VStack {
                                Text("Click to shorten")
                                    .frame(width: 200, height: 50, alignment: .center)
                                    .background(Color.indigo)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            
                        }
                    )
                    
                }
                .navigationTitle("URL Shortener")
            }
        
            
            
            
        }
        
        
  
}

struct firstScreen_Previews: PreviewProvider {
    static var previews: some View {
        firstScreen()
    }
}
}
