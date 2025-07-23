//
//  ZoneClickable.swift
//  APP VOYAGE
//
//  Created by Marlène on 12/12/2022.
//  Modify by Valentine on 23/070/2025.
//

import SwiftUI

struct ZoneClickable: View {
    let text: String
    var onTap: (() -> Void)? = nil
    @State private var changeColor: Bool = false

    var body: some View {
        Button(action: {
            changeColor.toggle()
            onTap?() // Appelle la fonction externe si elle existe
        }) {
            Text(text)
                .frame(maxWidth: 300)
                .padding()
                .background(changeColor ? Color("MyYellow") : Color("MyBlue"))
                .foregroundColor(changeColor ? Color("MyBlue") : .white)
                .cornerRadius(10)
        }
    }
}


struct ZoneClickable_Previews: PreviewProvider {
    static var previews: some View {
        ZoneClickable (text: "Hello, World!")
    }
 }



