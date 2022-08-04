//
//  Personal.swift
//  Quizzy
//
//  Created by Ali on 04/08/2022.
//

import SwiftUI

struct Personal: View {
    @State private var yourName = ""
    @State private var age = ""
    static let ages = ["Under 14", "14-18", "Over 18"]
    
    var body: some View {
   
            
            VStack {
                Text("Quizzy")
                    .font(.system(size: 50))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Form {
                    Picker("age", selection: $age) {
                        ForEach(Self.ages, id: \.self) {
                            age in
                            Text(age)
                        }
                    }
                    
                    
                    TextField("Write your name here", text: $yourName)
                
            }
        }
    }
}

struct Personal_Previews: PreviewProvider {
    static var previews: some View {
        Personal()
    }
}
