//
//  ContentView.swift
//  Quizzy
//
//  Created by Ali on 04/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var yourName = ""
    @State private var age = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("?")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Quizzy")
                    .font(.system(size: 70))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                NavigationLink("Start Quiz", destination: Personal())
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension View {
    func rainbow() -> some View {
        self.modifier(Rainbow())
    }
}


struct Rainbow: ViewModifier {
    let hueColors = stride(from: 0, to: 1, by: 0.01).map {
        Color(hue: $0, saturation: 1, brightness: 1)
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(GeometryReader { (proxy: GeometryProxy) in
                ZStack {
                    LinearGradient(gradient: Gradient(colors: self.hueColors),
                                   startPoint: .leading,
                                   endPoint: .trailing)
                        .frame(width: proxy.size.width)
                }
            })
            .mask(content)
    }
}
