//
//  ToDo.swift
//  ToDoList
//
//  Created by Mona Shamsolebad on 2019-09-08.
//  Copyright © 2019 Mona Shamsolebad. All rights reserved.
//

import Foundation
struct ToDo  : Codable{
    var title : String
    var isComplete : Bool
    var dueDate : Date
    var notes: String
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: ArchiveURL) else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self , from: codedToDos)
    }
    static func saveToDos(_ todos : [ToDo]){
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(todos)
        try? codedToDos?.write(to: ArchiveURL , options: .noFileProtection)
        
    }
    static func loadSampleToDos() -> [ToDo]{
        let todo1 = ToDo(title: "ToDo1", isComplete: false, dueDate: Date(), notes: "Notes1")
        let todo2 = ToDo(title: "ToDo2", isComplete: false, dueDate: Date(), notes: "Notes2")
        let todo3 = ToDo(title: "ToDo3", isComplete: false, dueDate: Date(), notes: "Notes3")
        return[todo1,todo2,todo3]
        
    }
    
    static let dueDateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    static let DocumentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
}
