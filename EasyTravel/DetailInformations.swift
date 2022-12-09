//
//  DetailInformations.swift
//  EasyTravel
//
//  Created by Valentine on 08/12/2022.
//

import SwiftUI

// Permet d'afficher les informations sur la destination
struct DetailInformation: View {
    //Variable permettant de remplir la page détail avec les informations sur la destination
    var title: String
    var arrayImages = ["ImageSydney1", "ImageSydney2", "ImageSydney3", "ImageSydney4"]
    var arrayIcons = ["checkmark.shield.fill","dollarsign","cross.fill","cloud.sun.rain.fill"]
    
    //Variables des boutons icones
    @State var buttonIcons: Int = 4
    
    //Variables des informations concernant la destination
    @State var descriptionIconHealth: String
    var descriptionIconCost: String
    var descriptionIconSecurity: String
    var descriptionIconWeather: String
    
    var description: String
    
    @State var isClicked: Bool =  false
    
    
    
    var body: some View {
        
        VStack {
            //Nom de la destination
            HStack {
                Text(title)
            }.font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                //Affichage des images
                HStack {
                    //                    TabView {
                    
                    ForEach(arrayImages, id: \.self) { num in
                        Image(num)
                            .resizable()
                        //                                .scaledToFill()
                            .frame(width: 360, height: 250)
                    }
                    //                    }.tabViewStyle(PageTabViewStyle())
                }
            }
            
            //Bouton des icones pour info sur la destination
            HStack(spacing: 65) {

                
                ZStack {
                    Circle()
                        .fill(buttonIcons == 0 ? Color("MyOrange") : Color("MyBlue"))
                        .frame(width: 40, height: 40)
                    Image(systemName: "checkmark.shield.fill")
                        .foregroundColor(.white)
                }
                .onTapGesture {
                buttonIcons = 0
                }
                
                ZStack {
                    Circle()
                        .fill(buttonIcons == 1 ? Color("MyOrange") : Color("MyBlue"))
                        .frame(width: 40, height: 40)
                    Image(systemName: "dollarsign")
                        .foregroundColor(.green)
                }
                .onTapGesture {
                buttonIcons = 1
                }
                
                ZStack {
                    Circle()
                        .fill(buttonIcons == 2 ? Color("MyOrange") : Color("MyBlue"))
                        .frame(width: 40, height: 40)
                    Image(systemName: "cross.fill")
                        .foregroundColor(.red)
                }
                .onTapGesture {
                buttonIcons = 2
                }
                
                ZStack {
                    Circle()
                        .fill(buttonIcons == 3 ? Color("MyOrange") : Color("MyBlue"))
                        .frame(width: 40, height: 40)
                    Image(systemName: "cloud.sun.rain.fill")
                        .foregroundColor(.white)
                        .symbolRenderingMode(.multicolor)
                }
                .onTapGesture {
                buttonIcons = 3
                }
            }
            
            //Affichage du texte sous les icones
            VStack {
                if buttonIcons == 0 {
                    Text(descriptionIconSecurity)
                        .padding()
                        .background(Color("MyOrange"))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .overlay {
                            HStack {
                                VStack {
                                    Circle()
                                        .frame(width: 10)
                                        .foregroundColor(.green)
                                        .padding([.leading, .top], 10)
                                    Spacer()
                                }
                                
                                Spacer()
                            }
                        }
                } else if buttonIcons == 1 {
                    Text(descriptionIconCost)
                        .padding()
                        .background(Color("MyOrange"))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .overlay {
                            HStack {
                                VStack {
                                    Circle()
                                        .frame(width: 10)
                                        .foregroundColor(.green)
                                        .padding([.leading, .top], 10)
                                    Spacer()
                                }
                                
                                Spacer()
                                
                                
                            }
                        }
                } else if buttonIcons == 2 {
                    Text(descriptionIconHealth)
                        .padding()
                        .background(Color("MyOrange"))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .overlay {
                            HStack {
                                VStack {
                                    Circle()
                                        .frame(width: 10)
                                        .foregroundColor(.green)
                                        .padding([.leading, .top], 10)
                                    Spacer()
                                }
                                
                                Spacer()
                                
                                
                            }
                        }
                } else if buttonIcons == 3 {
                    Text(descriptionIconWeather)
                        .padding()
                        .background(Color("MyOrange"))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .overlay {
                            HStack {
                                VStack {
                                    Circle()
                                        .frame(width: 10)
                                        .foregroundColor(.green)
                                        .padding([.leading, .top], 10)
                                    Spacer()
                                }
                                Spacer()
                            }
                        }
                }
                
            }
            .padding()
            
            // VStack description sur la destination
            VStack(alignment: .leading) {
                Text("Description")
                    .font(.title3).bold()
                    .padding(.vertical)
                Text(description)
            }
        }
        .onTapGesture {
            buttonIcons = 4
        }
    }
}

struct DetailInformations_Previews: PreviewProvider {
  
    static var previews: some View {
        DetailInformation(title: "Sydney, Australie", descriptionIconHealth: "Aucun vaccin exigé pour débarquer sur le sol australien. Il est simplement recommandé d’être à jour dans ses vaccinations « universelles » : diphtérie, tétanos, polio, coqueluche, rougeole, oreillons, hépatite B.", descriptionIconCost: "Si vous faites vos courses au supermarché, vous pouvez vous en sortir pour 20 AU$ (13 €) par personne et par jour.La taxe sur les biens et les services (goods and services tax, GST) est de 10 %. Elle est incluse dans les prix affichés (c’est la loi). ", descriptionIconSecurity: "Aucun vaccin exigé pour débarquer sur le sol australien. Il est simplement recommandé d’être à jour dans ses vaccinations « universelles » : diphtérie, tétanos, polio, coqueluche, rougeole, oreillons, hépatite B.", descriptionIconWeather: "Le climat y est subtropical humide, c’est-à-dire que les étés sont chauds et pluvieux, les hivers en général assez courts et frais.", description: "Sydney, installée sur une superbe baie, est la plus ancienne ville d’Australie et un port important. Fondée à la fin du XIXe siècle par les colons européens, elle est aujourd’hui la ville la plus peuplée du pays. Sydney a réussi le pari d’entrer d’un bond dans le XXIe siècle tout en gardant un charme ancien.")
        
        
        
        
        
        
        
    }
}


struct ButtonInfo: View {
    @Binding var clicked: Bool
    @Binding var selectedButton: Int
//    @State private var changeColor = false
    let icon: String
    let color: Color
    let number: Int
    var body: some View {
        Button(action: {
            clicked.toggle()
            selectedButton = number
        }, label: {
            ZStack {
                Circle()
                    .fill(clicked ? Color("MyOrange") : Color("MyBlue"))
                    .frame(width: 40, height: 40)
                Image(systemName: icon)
                    .foregroundColor(color)
                    .symbolRenderingMode(icon == "cloud.sun.rain.fill" ? .multicolor : .monochrome)
            }
        })
    }
}
