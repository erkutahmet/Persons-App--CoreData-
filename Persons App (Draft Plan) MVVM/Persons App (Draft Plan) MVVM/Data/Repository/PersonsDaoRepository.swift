//
//  PersonsDaoRepository.swift
//  Persons App (Draft Plan) MVVM
//
//  Created by Ahmet Erkut on 25.10.2023.
//

import Foundation
import RxSwift

class PersonsDaoRepository {
    var personsList = BehaviorSubject<[PersonsModel]>(value: [PersonsModel]())
    
    func save(person_name: String, person_phone: String) {
        print("Person Save: \(person_name) - \(person_phone)")
    }
    
    func update(person: PersonsModel, person_name: String, person_phone: String) {

    }
    
    func delete(person: PersonsModel) {
        
        uploadPersons()
    }
    
    func search(searchText: String) {
        print("Person Search: \(searchText)")
    }
    
    func uploadPersons() {
        //personsList.onNext(list)
    }
}
