//
//  ContentView.swift
//  ApiTest
//
//  Created by Franco Carreiro Eugenio on 27/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var contacto = [Contacto]()
    var body: some View {
        
        List(contacto,  id: \.id) { item in
            VStack {
                Text(item.Mensaje)
                Text(item.Direccion)
                Text(item.Instagram)
                Text(item.Whatsapp)
            }
        } .task {
            await requestdata()
        }
    }
    
  
    
        
}

#Preview {
    ContentView()
}
