//
//  MesVoyagesVisites.swift
//  APP voyage
//
//  Created by Nathanael on 07/12/2022.
//

import SwiftUI

struct MesVoyagesVisites: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Yellowstone")
                                .foregroundColor(Color("MyOrange"))
                                .font(.title)
                                .bold()
                            Spacer()
                            Text("Prix à 400€")
                        }
                        
                        Image("Yell")
                            .resizable()
                            .frame(height: 250)
                            .border(Color.gray, width: 2)
                            .padding(.bottom)
                        HStack {
                            VStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                                Text("Sécurité") // // fin VStack
                            }
                            
                            VStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                                Text("Climat") // // fin VStack
                            }
                            VStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.orange)
                                Text("Prix") // // fin VStack
                            }
                            VStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.red)
                                Text("Santé") // // fin VStack
                                
                            }
                            Spacer()
                            
                            
                            Button (action: {
                                
                            }){
                                Image(systemName: "checkmark")
                                
                                
                            }
                            .padding()
                            .background(Color("MyOrange"))
                            .cornerRadius(30)
                            .foregroundColor(.white)
                        } //fin de la HStack
                        
                        Text("Parc naturel aux Etats-Unis")
                        
                    }
                    
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Macchu Pichu")
                                .foregroundColor(Color("MyOrange"))
                                .font(.title)
                                .bold()
                            Spacer()
                            Text("Prix à 600€")
                        }
                        
                        Image("Machu")
                            .resizable()
                            .frame(height: 250)
                            .border(Color.gray, width: 2)
                            .padding(.bottom)
                        
                        HStack {
                            VStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                                Text("Sécurité") // // fin VStack
                            }
                            
                            VStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                                Text("Climat") // // fin VStack
                            }
                            VStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.orange)
                                Text("Prix") // // fin VStack
                            }
                            VStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.red)
                                Text("Santé") // // fin VStack
                                
                            }
                            Spacer()
                            
                            Button (action: {
                                
                            }){
                                Image(systemName: "checkmark")
                                
                                //                        Text("description")
                            }
                            .padding()
                            .background(Color("MyOrange"))
                            .cornerRadius(30)
                            .foregroundColor(.white)
                        } //fin de la HStack
                        
                        
                        Text("Sanctuaire religieux ancien au Pérou")
                    }
                    
                }
                .listStyle(.plain)
                
            }
            .navigationTitle("Mes Voyages")
        }
    }
}

struct MesVoyagesVisites_Previews: PreviewProvider {
    static var previews: some View {
        MesVoyagesVisites()
    }
}
