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
                Image("????")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
            VStack {
                
                StrokeText(text: "Quizzy", width: 2, color: .black)
                        .foregroundColor(.white)
                        .font(.system(size: 70, weight: .bold))
                        .padding()
                
                NavigationLink(destination: Personal().navigationBarBackButtonHidden(true)) {
                    Text("Start Quiz")
                }
                    .font(.system(size: 25))
                    .foregroundColor(.red)
                    .padding(6)
                    .overlay (
                      RoundedRectangle(cornerRadius: 5)
                         .stroke(Color.white, lineWidth:1)
                   )
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
struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}
