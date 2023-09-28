//
//  model.swift
//  ApiTest
//
//  Created by Franco Carreiro Eugenio on 27/09/2023.
//

import Foundation

struct response: Codable {
    var contacto: [Contacto]
}

struct Contacto: Codable, Identifiable{
    var id: Int
    var Mensaje : String
    var Direccion: String
    var Whatsapp: String
    var Instagram: String
    var Email: String
}



