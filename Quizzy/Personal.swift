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
    @State private var educationLevel = ""
    static let educationLevels = ["Primary School", "Middle School", "High School"]
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text("")
                    .font(.system(size: 20))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(9)
                
                Text("Personal information:")
                    .font(.system(size: 20))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                
                Form {
                    TextField("Write your name here", text: $yourName)
                 //       .padding()

                    Picker("Age", selection: $age) {
                        ForEach(Self.ages, id: \.self) {
                            age in
                            Text(age)
                        }
                    }
            //        .padding()
                    Picker("Educational level", selection: $educationLevel) {
                        ForEach(Self.educationLevels, id: \.self) {
                            educationLevel in
                            Text(educationLevel)
                        }
                    }
           //         .padding()
                }
                Text("")
                    .font(.system(size: 20))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(95)
                NavigationLink("Next Quistion", destination: QustionOne())
                   .navigationBarTitle("Quizzy").navigationBarHidden(false).foregroundColor(.orange)
                    .overlay (
                      RoundedRectangle(cornerRadius: 5)
                         .stroke(Color.red, lineWidth:2)
                         .padding(-4)
                   )
         //           .padding(120)

                    .font(.system(size: 18))

                Spacer()
            }
            
            
   //         .font(.system(size: 20))
            
        }
    }
    
    func studyPhase() {
        print("COLL")
    }
}
struct Personal_Previews: PreviewProvider {
    static var previews: some View {
        Personal()
    }
}
