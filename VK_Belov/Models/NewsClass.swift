//
//  NewsClass.swift
//  VK_Belov
//
//  Created by Алексей Белов on 02.04.2021.
//


import Foundation

class NewsClass: CustomStringConvertible {

    var textLable: String
    var titleLable: String
    var who: String
    var date: Date
    var numberOfViewsText: Int
    var urlFoto: String
    var likeNumber: Int
    
    var description: String {
        return textLable
    }
    
    init(textLable:String, titleLable: String, who:String, date:Date, likeNumber: Int, numberOfViewsText:Int , urlFoto:String) {
        self.textLable = textLable
        self.titleLable = titleLable
        self.who = who
        self.date = date
        self.likeNumber = likeNumber
        self.urlFoto = urlFoto
        self.numberOfViewsText = numberOfViewsText
    }
    
}

extension NewsClass {
    static var arrNewsClass:[NewsClass]{
    
        return [
            NewsClass(textLable: "John",
                      titleLable: "",
                      who: "Alex",
                      date: stringToDate("2021-03-01"),
                      likeNumber: 0,
                      numberOfViewsText: randomInt(),
                      urlFoto: ""),
            
            NewsClass(textLable: "John",
                      titleLable: "",
                      who: "Bob",
                      date: stringToDate("2021-04-01"),
                      likeNumber: 0,
                      numberOfViewsText: randomInt(),
                      urlFoto: "")
            ]
    }

    static func stringToDate(_ dateString: String) -> Date{
        // Взято из одного форума
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        if let date = dateFormatter.date(from: dateString)
        {
            return date
        }
        print("Invalid arguments ! Returning Current Date . ")
        return Date()
    }
    
    static func randomInt() -> Int{
        return Int.random(in: 1...6)
    }
    
}
