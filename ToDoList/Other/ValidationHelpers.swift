//
//  ValidationHelpers.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 30.10.2023.
//

import Foundation


func validateEmail(_ email: String) -> Bool {
    let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
    return predicate.evaluate(with: email)
}


func isNotEmpty(_ str: String) -> Bool {
    return !str.trimmingCharacters(in: .whitespaces).isEmpty
}
