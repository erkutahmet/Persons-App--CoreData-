//
//  PersonsDaoRepository.swift
//  Persons App (Draft Plan) MVVM
//
//  Created by Ahmet Erkut on 25.10.2023.
//

import Foundation
import RxSwift
import CoreData

class PersonsDaoRepository {
    var personsList = BehaviorSubject<[PersonsModel]>(value: [PersonsModel]())
    
    let context = appDelegate.persistentContainer.viewContext
    
    func save(person_name: String, person_phone: String) {
        let person = PersonsModel(context: context)
        person.person_name = person_name
        person.person_phone = person_phone
        
        appDelegate.saveContext()
    }
    
    func update(person: PersonsModel, person_name: String, person_phone: String) {
        person.person_name = person_name
        person.person_phone = person_phone
        
        appDelegate.saveContext()
    }
    
    func delete(person: PersonsModel) {
        context.delete(person)
        appDelegate.saveContext()
        
        uploadPersons()
    }
    
    func search(searchText: String) {
        do {
            let fr = PersonsModel.fetchRequest()
            fr.predicate = NSPredicate(format: "person_name CONTAINS[c] %@", searchText)
            let list = try context.fetch(fr)
            personsList.onNext(list)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func uploadPersons() {
        do {
            let list = try context.fetch(PersonsModel.fetchRequest())
            personsList.onNext(list)
        } catch {
            print(error.localizedDescription)
        }
    }
}
