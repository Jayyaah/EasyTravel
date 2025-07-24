//
//  IsClicQuiz.swift
//  APP VOYAGE
//
//  Created by Marlène on 13/12/2022.
//

import SwiftUI
//surprenez moi
struct IsClicQuizNavigation<Destination: View>: View {
    var textQuestion: String
    var textReponse: [String]
    var destination: () -> Destination

    @State private var buttonSelected: Int?

    var body: some View {
        VStack(spacing: 50) {
            Text(textQuestion)
                .font(.largeTitle)
                .padding(.bottom, 50)

            ForEach(0..<textReponse.count, id: \.self) { index in
                Button(action: {
                    buttonSelected = index
                }) {
                    Text(textReponse[index])
                        .frame(maxWidth: 300)
                        .font(.title2)
                        .padding()
                        .foregroundColor(.white)
                        .background(buttonSelected == index ? Color("MyOrange") : Color("MyBlue"))
                        .cornerRadius(10)
                }
            }

            NavigationLink(destination: destination()) {
                Text("Suivant")
                    .frame(maxWidth: 300)
                    .font(.title2)
                    .foregroundColor(Color("MyBlue"))
                    .padding()
                    .background(Color("MyYellow"))
                    .cornerRadius(10)
            }
            .disabled(buttonSelected == nil)
            .opacity(buttonSelected == nil ? 0 : 1)
            .animation(.easeInOut, value: buttonSelected)
        }
        .navigationTitle("Surprenez-moi !")
    }
}


struct IsClicQuizAction: View {
    var textQuestion: String
    var textReponse: [String]
    var onValidate: () -> Void

    @State private var buttonSelected: Int?

    var body: some View {
        VStack(spacing: 50) {
            Text(textQuestion)
                .font(.largeTitle)
                .padding(.bottom, 50)

            ForEach(0..<textReponse.count, id: \.self) { index in
                Button(action: {
                    buttonSelected = index
                }) {
                    Text(textReponse[index])
                        .frame(maxWidth: 300)
                        .font(.title2)
                        .padding()
                        .foregroundColor(.white)
                        .background(buttonSelected == index ? Color("MyOrange") : Color("MyBlue"))
                        .cornerRadius(10)
                }
            }

            Button(action: onValidate) {
                Text("Suivant")
                    .frame(maxWidth: 300)
                    .font(.title2)
                    .foregroundColor(Color("MyBlue"))
                    .padding()
                    .background(Color("MyYellow"))
                    .cornerRadius(10)
            }
            .disabled(buttonSelected == nil)
            .opacity(buttonSelected == nil ? 0 : 1)
            .animation(.easeInOut, value: buttonSelected)
        }
        .navigationTitle("Surprenez-moi !")
    }
}




struct IsClicQuiz_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var dummy = 0

        var body: some View {
            IsClicQuizNavigation(
                textQuestion: "Quel est ton délire ?",
                textReponse: ["Urbain", "Neige", "Randonnée"],
                destination: {
                    Quiz1(thirdView: $dummy)
                }
            )
        }
    }

    static var previews: some View {
        PreviewWrapper()
    }
}
