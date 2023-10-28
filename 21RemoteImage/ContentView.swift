//
//  ContentView.swift
//  21RemoteImage
//
//  Created by gabriel Sazo on 2023-10-28.
//

import SwiftUI

//Create an extension :)
extension Image {
    //first asinc atributes
    func imageModifier() -> some View{
        self
            .resizable()
            .scaledToFit()
    }
    func iconModifier() -> some View{
        self
            .imageModifier()
            .frame(maxWidth:128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}


struct ContentView: View {
    //create a variable
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    
    var body: some View {
        
        // 1.Basic
        //Loading the imagen asincronous :)
        //AsyncImage(url: URL(string: imageURL))
        
        //2 SCALE :)
        //AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
        //3 .PLACEHOLDER
        
//        AsyncImage(url: URL(string: imageURL)) {
//
//            image in image
//            image.imageModifier() //Using the extension
//
//        } placeholder: {
//            //then other atributes
//            //Using extension
//            Image(systemName:"photo.circle.fill").iconModifier()
//
//        }
//        .padding(40)
        
        // 4- ASINC PHASE IMAGE
        
        /*AsyncImage(url: URL(string: imageURL)){phase in
            //SUCCESS: The image succefully loaded
            //FAILURE: ERROR
            //EMPTY: NO image is loaded.
            
            if let image = phase.image{
                image.imageModifier()
            }else if phase.error != nil{
                Image(systemName: "ant.circle.fill").iconModifier()
            } else {
                Image(systemName: "photo.circle.fill").iconModifier()
            }
        }
        .padding(40)
        */
        
        //5 - ANIMATION
        
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation:.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) {phase in
                switch phase{
                case .success(let image):
                    image.imageModifier()
                    //Add transition Animation to image :)
                        .transition(.move(edge: .bottom))
                case .failure(_):
                    Image(systemName: "ant.circle.fill").iconModifier()
                case .empty:
                    Image(systemName: "photo.circle.fill").iconModifier()
                @unknown default:
                    ProgressView()//Fix the Problem :)
                }
        }
        .padding(40)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
