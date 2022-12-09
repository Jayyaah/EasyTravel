//
//  Test.swift
//  EasyTravel
//
//  Created by Valentine on 08/12/2022.
//

import SwiftUI

struct Test: View {
    private var pickerEvent = ["Locations", "Vols"]
    @State private var location = "Locations"
    
    var body: some View {
        VStack {
            Picker("Hello", selection: $location) {
                Text("test")
                Text("test")
                Text("test")
                Text("test")
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}

