//
//  model.swift
//  ApiTest
//
//  Created by Franco Carreiro Eugenio on 27/09/2023.
//

import Foundation

struct response: Codable {
    var contacto: Contacto
}

struct Contacto: Codable, Identifiable{
    var id: Int
    var Mensaje : String
    var Direccion: String
    var Whatsapp: String
    var Instagram: String
    var Email: String
}
func requestdata() async {
    var request = URLRequest(url: URL(string: "https://api-dermacycle.clearsky.com.ar/Promocion.ashx")!, timeoutInterval: Double.infinity)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("Dermacycle2018", forHTTPHeaderField: "User")
    request.addValue("7c4e22f4-6a6c-48de-b1c9-075979233ce5", forHTTPHeaderField: "Password")
    request.addValue("iPhone 7", forHTTPHeaderField: "Dispositivo")
    request.addValue("iOS 11.2.2", forHTTPHeaderField: "VersionSO")
    request.addValue("1.0.1", forHTTPHeaderField: "VersionAPP")
    
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data else {
            print(String(describing: error))
            return
        }
        print(String(data: data, encoding: .utf8)!)
    }
    
    task.resume()
    
    
}

//     func loadData() async {
// guard let url = URL(string: "https://api-dermacycle.clearsky.com.ar/Promocion.ashx") else {
//    print("invalid url")
  //  return }

//do {
  //  let (data, _) = try await URLSession.shared.data(from: url)
    
    //if let decodedResponse = try? JSONDecoder().decode(response.self, from: data) {
      //  contacto = decodedResponse.contacto
    //}
    
//} catch {
  //  print("invalid data")
//}
//}
