//
//  PersonDetailViewModel.swift
//  Persons App (Draft Plan) MVVM
//
//  Created by Ahmet Erkut on 25.10.2023.
//

import Foundation

class PersonDetailViewModel {
    let pRepo = PersonsDaoRepository()
    
    func update(person: PersonsModel, person_name: String, person_phone: String) {
        pRepo.update(person: person, person_name: person_name, person_phone: person_phone)
    }
}
