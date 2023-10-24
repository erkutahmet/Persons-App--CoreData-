//
//  HomePageViewModel.swift
//  Persons App (Draft Plan) MVVM
//
//  Created by Ahmet Erkut on 25.10.2023.
//

import Foundation
import RxSwift

class HomePageViewModel {
    let pRepo = PersonsDaoRepository()
    var personsList = BehaviorSubject<[PersonsModel]>(value: [PersonsModel]())
    
    init() {
        pRepo.personsList = self.personsList
        uploadPersons()
    }
    
    func delete(person: PersonsModel) {
        pRepo.delete(person: person)
    }
    
    func search(searchText: String) {
        pRepo.search(searchText: searchText)
    }
    
    func uploadPersons() {
        pRepo.uploadPersons()
    }
}
