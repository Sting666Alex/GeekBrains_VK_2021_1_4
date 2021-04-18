//
//  UserClass.swift
//  VK_Belov
//
//  Created by Алексей Белов on 28.02.2021.
//

import Foundation

class User: CustomStringConvertible {
    
    var name:String = ""
    var surname:String = ""
    var age = 0
    var sex: Sex
    var urlFoto: String? = ""
    var section: Int = 0
    
    var firstLetterName: String {
        return String(name.prefix(1))
    }
        
    var firstLetterSurname: String {
        return String(name.prefix(1))
    }
    
    var description: String {
        return name
    }
    
    init(name:String, surname: String, age:Int, sex:Sex, urlFoto:String) {
        self.name = name
        //self.firstLetterName = self.name == "" ? "" : String(self.name.first!)
        self.surname = surname
        //self.firstLetterSurname = self.surname == "" ? "" : String(self.surname.first!)
        self.age = age
        self.sex = sex
        self.urlFoto = urlFoto
        self.section = 0
    }
}

extension User {
    
    static var countFirstLetters: Int = 0
    
    static var firstLetters:[String] = []
    
    static var arrUser:[User]{
        return getFrendsUser()
    }
    
    static func backward(_ s1: User, _ s2: User) -> Bool {
        return s1.name.first! < s2.name.first!
    }
    
    static func randomImage() -> String{
        return String(Int.random(in: 1...6))
    }
    
    static func getFrendsUser() -> [User]{
        return[
        User(name: "John", surname: "", age: 1, sex: .male, urlFoto: self.randomImage()),
        User(name: "Bob", surname: "", age: 1, sex: .male, urlFoto: self.randomImage()),
        User(name: "Monica", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Joana", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        
        User(name: "Lola", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Greg", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        
        User(name: "Alex", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Andrew", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Anton", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        
        User(name: "Dilan", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Colen", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Inga", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Flora", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        
        User(name: "Elionor", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Herb", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Klint", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Nora", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Olga", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Petr", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),

        User(name: "Quwin", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Robert", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Serg", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Tery", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Uliam", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),

        User(name: "Violet", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Wolf", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Xander", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Yellow", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),
        User(name: "Zelda", surname: "", age: 1, sex: .female, urlFoto: self.randomImage()),

        User(name: "Liza", surname: "", age: 1, sex: .female, urlFoto: self.randomImage())
        ]
    }
    
}
