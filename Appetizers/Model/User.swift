//
//  User.swift
//  Appetizers
//
//  Created by Weerawut Chaiyasomboon on 26/9/2566 BE.
//

import Foundation

struct User: Codable{
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
