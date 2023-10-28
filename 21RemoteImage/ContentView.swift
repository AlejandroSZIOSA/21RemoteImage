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
        
        AsyncImage(url: URL(string: imageURL)) {
          
            image in image
            image.imageModifier() //Using the extension
                
        } placeholder: {
            //then other atributes
            //Using extension
            Image(systemName:"photo.circle.fill").iconModifier()
               
        }
        .padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
