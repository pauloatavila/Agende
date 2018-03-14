//
//  Consulta.swift
//  agende
//
//  Created by Paulo Atavila on 30/11/17.
//  Copyright © 2017 Paulo Atavila. All rights reserved.
//

import Foundation

class Consulta{
    var areaMedica: String
    var medico: String
    var data:String
    var horario:String
    
    init(areaMedica: String, medico:String, data:String, horario:String){
        self.areaMedica = areaMedica
        self.medico = medico
        self.data = data
        self.horario = horario
    }
}

class ConsultaDAO{
    static func getList() -> [Consulta]{
        return [
            Consulta(areaMedica: "Dermatologia", medico: "Paulo Ricardo", data: "04/12/2017", horario: "15:20"),
            Consulta(areaMedica: "Neurologia", medico: "Brenda Vieira Cunha", data: "07/12/2017", horario: "8:00")
        ]
    }
}
