//
//  DetailInformations.swift
//  EasyTravel
//
//  Created by Valentine on 08/12/2022.
//

import SwiftUI

struct DescriptionIcon: Identifiable {
    var id = UUID()
    var descriptionIconHealth: String
    var descriptionIconCost: String
    var descriptionIconSecurity: String
    var descriptionIconWeather: String
}

// Permet d'afficher les informations sur la destination
struct DetailInformation: View {
    
    let selectedVoyage: Voyage2
    //Variable permettant de remplir la page détail avec les informations sur la destination
    //var title: String
//    var arrayImages = ["ImageSydney2", "ImageSydney1", "ImageSydney3", "ImageSydney4"]
    var arrayIcons = ["checkmark.shield.fill","dollarsign","cross.fill","cloud.sun.rain.fill"]
//    var arrayDetail = [
//        DetailRow(title: "Sydney, Australie", descriptionIconHealth: "Aucun vaccin exigé pour débarquer sur le sol australien. Il est simplement recommandé d’être à jour dans ses vaccinations « universelles » : diphtérie, tétanos, polio, coqueluche, rougeole, oreillons, hépatite B.", descriptionIconCost: "Si vous faites vos courses au supermarché, vous pouvez vous en sortir pour 20 AU$ (13 €) par personne et par jour.La taxe sur les biens et les services (goods and services tax, GST) est de 10 %. Elle est incluse dans les prix affichés (c’est la loi). ", descriptionIconSecurity: "Aucun vaccin exigé pour débarquer sur le sol australien. Il est simplement recommandé d’être à jour dans ses vaccinations « universelles » : diphtérie, tétanos, polio, coqueluche, rougeole, oreillons, hépatite B.", descriptionIconWeather: "Le climat y est subtropical humide, c’est-à-dire que les étés sont chauds et pluvieux, les hivers en général assez courts et frais.", description: "Sydney, installée sur une superbe baie, est la plus ancienne ville d’Australie et un port important. Fondée à la fin du XIXe siècle par les colons européens, elle est aujourd’hui la ville la plus peuplée du pays. Sydney a réussi le pari d’entrer d’un bond dans le XXIe siècle tout en gardant un charme ancien.")
//    ]
    var arrayDetail = DescriptionIcon(descriptionIconHealth: "Aucun vaccin exigé pour débarquer sur le sol australien. Il est simplement recommandé d’être à jour dans ses vaccinations « universelles » : diphtérie, tétanos, polio, coqueluche, rougeole, oreillons, hépatite B.", descriptionIconCost: "Si vous faites vos courses au supermarché, vous pouvez vous en sortir pour 20 AU$ (13 €) par personne et par jour.La taxe sur les biens et les services (goods and services tax, GST) est de 10 %. Elle est incluse dans les prix affichés (c’est la loi). ", descriptionIconSecurity: "En dehors des quartiers pauvres, comme Redfern à Sydney, l’Australie est un pays très sûr, au taux de criminalité très bas. Un comble pour un pays peuplé à l’origine par des bagnards ! Malgré tout, il est préférable de ne pas attirer les regards avec vos objets de valeur, l’occasion faisant toujours le larron.", descriptionIconWeather: "Le climat y est subtropical humide, c’est-à-dire que les étés sont chauds et pluvieux, les hivers en général assez courts et frais.")
    //Variables des boutons icones
    @State var buttonIcons: Int = 4
    
    //Variables des informations concernant la destination
    
    //var descriptionIconCost: String
    //var descriptionIconSecurity: String
    //var descriptionIconWeather: String
    @State var test = ""
    //var description: String
    
    @State var isClicked: Bool =  false
    
    var body: some View {
        
        VStack {
            //Nom de la destination
            ZStack {
                HStack {
                    Text("\(selectedVoyage.nom), \(selectedVoyage.pays)")
                }.font(.title)
                    .bold()
                .foregroundColor(Color("MyOrange"))
//                Image("lola")
//                    .resizable()
//                    .frame(width: 100, height: 100)
//                    .padding(.leading, 250)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                
            //Affichage des images
                HStack {
                    TabView(selection: $test) {
                    
                        ForEach(selectedVoyage.imageDeLaDestination, id: \.self) { num in
                            Image(num)
                                .resizable()
                                .scaledToFill()
                        }
                    }.tabViewStyle(.page)
                        .frame(width: 360, height: 250)
                        .border(.gray, width: 1)
                        .padding()
                }
            }
            
            //Bouton des icones pour info sur la destination
            HStack(spacing: 60) {

                
                ZStack {
                    Circle()
                        .fill(buttonIcons == 0 ? Color("MyOrange") : Color("MyBlue"))
                        .frame(width: 40, height: 40)
                    Image(systemName: "checkmark.shield.fill")
                        .foregroundColor(.white)
                    //cercle blanc derrierepour le style
                    Circle()
                        .frame(width: 12)
                        .foregroundColor(.white)
                        .padding(.leading, 32)
                        .padding(.bottom, 29)
                    //cercle de couleur selon les infos sur la destination
                    Circle()
                        .frame(width: 10)
                        .foregroundColor(.green)
                        .padding(.leading, 33)
                        .padding(.bottom, 30)
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
                    //cercle blanc derrierepour le style
                    Circle()
                        .frame(width: 12)
                        .foregroundColor(.white)
                        .padding(.leading, 32)
                        .padding(.bottom, 29)
                    //cercle de couleur selon les infos sur la destination
                    Circle()
                        .frame(width: 10)
                        .foregroundColor(.orange)
                        .padding(.leading, 33)
                        .padding(.bottom, 30)
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
                    //cercle blanc derrierepour le style
                    Circle()
                        .frame(width: 12)
                        .foregroundColor(.white)
                        .padding(.leading, 32)
                        .padding(.bottom, 29)
                    //cercle de couleur selon les infos sur la destination
                    Circle()
                        .frame(width: 10)
                        .foregroundColor(.red)
                        .padding(.leading, 33)
                        .padding(.bottom, 30)
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
                    //cercle blanc derrierepour le style
                    Circle()
                        .frame(width: 12)
                        .foregroundColor(.white)
                        .padding(.leading, 32)
                        .padding(.bottom, 29)
                    //cercle de couleur selon les infos sur la destination
                    Circle()
                        .frame(width: 10)
                        .foregroundColor(.green)
                        .padding(.leading, 33)
                        .padding(.bottom, 30)
                }
                .onTapGesture {
                buttonIcons = 3
                }
            }
            
            //Affichage du texte sous les icones
            VStack {
                if buttonIcons == 0 {
                    Text(arrayDetail.descriptionIconSecurity)
                        .padding()
                        .background(Color("MyOrange"))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .overlay {
                            HStack {
                                VStack {
//                                    Circle()
//                                        .frame(width: 10)
//                                        .foregroundColor(.green)
//                                        .padding([.leading, .top], 10)
                                    Spacer()
                                }
                                
                                Spacer()
                            }
                        }
                } else if buttonIcons == 1 {
                    Text(arrayDetail.descriptionIconCost)
                        .padding()
                        .background(Color("MyOrange"))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .overlay {
                            HStack {
                                VStack {
//                                    Circle()
//                                        .frame(width: 10)
//                                        .foregroundColor(.green)
//                                        .padding([.leading, .top], 10)
                                    Spacer()
                                }
                                
                                Spacer()
                                
                                
                            }
                        }
                } else if buttonIcons == 2 {
                    Text(arrayDetail.descriptionIconHealth)
                        .padding()
                        .background(Color("MyOrange"))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .overlay {
                            HStack {
                                VStack {
//                                    Circle()
//                                        .frame(width: 10)
//                                        .foregroundColor(.green)
//                                        .padding([.leading, .top], 10)
                                    Spacer()
                                }
                                
                                Spacer()
                                
                                
                            }
                        }
                } else if buttonIcons == 3 {
                    Text(arrayDetail.descriptionIconWeather)
                        .padding()
                        .background(Color("MyOrange"))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .overlay {
                            HStack {
                                VStack {
//                                    Circle()
//                                        .frame(width: 10)
//                                        .foregroundColor(.green)
//                                        .padding([.leading, .top], 10)
                                    Spacer()
                                }
                                Spacer()
                            }
                        }
                }
                
            }
            .padding(.top, 8)
            
            // VStack description sur la destination
            VStack(alignment: .leading) {
                Text(selectedVoyage.description)
                    
            }.padding(.horizontal, 10)
        }
        .onTapGesture {
            buttonIcons = 4
        }
    }
}

struct DetailInformations_Previews: PreviewProvider {
  
    static var previews: some View {
        DetailInformation(selectedVoyage: arrayVoyages[0])
        
        
        
        
        
        
        
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
