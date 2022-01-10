//
//  ControlView.swift
//  TheThirdPolicemanTrail
//
//  Created by Sarah Kim on 1/8/22.
//

import SwiftUI

struct ControlView: View{
    @Binding var showClue: Bool
    var body: some View{
        VStack{
            
   
            Spacer()
            ControlButtonBar(showClue: $showClue)
            
        }
    }
}

struct ControlButton: View{
    let systemIconName: String
    let action: () -> Void
    
    var body: some View {
        HStack{
            Button(action: {
                self.action()
            }){
                Image(systemName: systemIconName).font(.system(size: 35)).foregroundColor(.white).buttonStyle(PlainButtonStyle())
            }
            .frame(width: 50, height: 50)
        }

        }
    
    }



struct ControlVisibilityToggleButton: View{
    var body: some View {
        HStack{
            Spacer()
            ZStack{
                Color.black.opacity(0.25)
                
                ControlButton(systemIconName: "arrowshape.turn.up.left"){
                    print("back button pressed")
                }
            }
            
        }
    }
}

struct ControlButtonBar: View{
    @Binding var showClue: Bool
    var body: some View {
        HStack{
            ControlButton(systemIconName: "arrowshape.turn.up.left"){
                print("back button pressed")
            }
                
            Spacer()
                
            ControlButton(systemIconName:"book.circle"){
                print("info button pressed")
                self.showClue.toggle()
            }.sheet(isPresented: $showClue, content: {
                //right clue for each card in list
            })
        }
        .frame(maxWidth: 500)
        .padding(30)
        .background(Color.black.opacity(0.25))
    }
}