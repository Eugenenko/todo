//
//  People.swift
//  ToDoFB
//
//  Created by Eugene Tkachenko on 09.04.2021.
//

import Foundation
import Firebase

struct People {
    
    let uid: String
    let email: String
    
    init(people: User) {
        self.uid = people.uid
        self.email = people.email!
    }
}
