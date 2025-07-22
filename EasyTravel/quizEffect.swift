//
//  IsClicQuiz.swift
//  APP VOYAGE
//
//  Created by Marlène on 13/12/2022.
//

import SwiftUI
//surprenez moi
struct IsClicQuiz: View {
    let buttons = ["Urbain", "Bataille de neige", "Randonnée"]//quiz1
    
    @State public var buttonSelected: Int?
    @State private var changeColor: Bool = false
    @Binding var secondVue: Int
    
    var body: some View {
        //        NavigationView{
        VStack(spacing : 50){
            //                Image("LOGO")
            Text("Quel est ton délire ?")
                .font(.largeTitle)
                .padding(.bottom, 50)
            ForEach(0..<buttons.count, id:\.self) { button in
                Button(action: {
                    self.buttonSelected = button
                }) {
                    Text("\(self.buttons[button])")
                        .font(.title2)
                        .padding()
                        .foregroundColor(buttonSelected == button ? Color.white : Color.white)
                        .background(buttonSelected == button ? Color("MyOrange"): Color("MyBlue")  )
                        .clipShape(Capsule())
                    
                }
                
            }
            
            NavigationLink(destination: Quiz1(thirdView: $secondVue), label: {
                Text("Suivant")
                    .font(.title2)
                    .foregroundColor(Color("MyBlue"))
                    .padding(20)
                    .background(Color("MyYellow"))
                    .clipShape(Capsule())
            })
            .navigationTitle("Surprenez-moi !")
        }
        //            }
    }
}

struct IsClicQuiz_Previews: PreviewProvider {
    static var previews: some View {
        IsClicQuiz(secondVue: .constant(0))
    }
}

