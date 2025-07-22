//
//  ZoneClickable.swift
//  APP VOYAGE
//
//  Created by Marlène on 12/12/2022.
//

import SwiftUI

struct ZoneClickable: View {
    let text: String
    @State var changeColor: Bool = false
    var body: some View {
        
      
        Button(action: {
            changeColor.toggle()
            
        }, label: {
            Text(text)
        })
        .padding()
        .background(changeColor == true ? (Color("MyYellow")) : (Color("MyBlue")))
        .foregroundColor(changeColor == true ? (Color("MyBlue")) : (Color(.white)))
        .cornerRadius(10)
    }
}


struct ZoneClickable_Previews: PreviewProvider {
    static var previews: some View {
        ZoneClickable (text: "gtyhthn")
    }
 }



