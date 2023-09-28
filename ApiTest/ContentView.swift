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
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://api-dermacycle.clearsky.com.ar/Promocion.ashx") else {
            print("invalid url")
            return }
    
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(response.self, from: data) {
                contacto = decodedResponse.contacto
            }
            
        } catch {
            print("invalid data")
        }
    }
    
        
}

#Preview {
    ContentView()
}
