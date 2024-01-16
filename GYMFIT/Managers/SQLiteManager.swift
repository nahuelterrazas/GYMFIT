//
//  SQLManager.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 12/01/2024.
//

import Foundation
import SQLite3


class SQLiteManager {
    
    static let shared = SQLiteManager()
    
    var db : OpaquePointer?
    var path : String = "myDataBase.sqlite"
    
    init() {
          self.db = createDB()
          self.createTable()
      }
      
    
      func createDB() -> OpaquePointer? {
          let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(path)
          
          var db : OpaquePointer? = nil
          
          if sqlite3_open(filePath.path, &db) != SQLITE_OK {
              print("There is error in creating DB")
              return nil
          } else {
              print("Database has been created with path \(path)")
              return db
          }
      }
    
    
    func createTable()  {
        let query = "CREATE TABLE IF NOT EXISTS exercises (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT UNIQUE, weight INTEGER);"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Table creation success")
            } else {
                print("Table creation fail")
            }
        } else {
            print("Preparation fail")
        }
    }
    
    
    func insert(name: String, weight: Int) {
        let query = "INSERT INTO exercises (id, name, weight) VALUES (?, ?, ?);"
        var statement : OpaquePointer? = nil

        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            
            if read().isEmpty {
             sqlite3_bind_int(statement, 1, 1)
            }
            sqlite3_bind_text(statement, 2, NSString(string: name).utf8String, -1, nil)
            sqlite3_bind_int(statement, 3, Int32(weight))
 
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Data inserted success")
            } else {
                print("Data is not inserted in table")
            }
        } else {
          print("Query is not as per requirement")
        }
    }
    
    
    func readWhere(name: String) -> [ExerciseSQL] {
        var mainList: [ExerciseSQL] = []

        let query = "SELECT * FROM exercises WHERE name = '\(name)';"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            while sqlite3_step(statement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(statement, 0))
                let name = String(describing: String(cString: sqlite3_column_text(statement, 1)))
                let weight = Int(sqlite3_column_int(statement, 2))
                let model = ExerciseSQL(id: id, name: name, weightRow: weight)

                mainList.append(model)
            }
        }
        return mainList
    }
    
    
    
    func read() -> [ExerciseSQL] {
        var mainList: [ExerciseSQL] = []

        let query = "SELECT * FROM exercises;"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            while sqlite3_step(statement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(statement, 0))
                let name = String(describing: String(cString: sqlite3_column_text(statement, 1)))
                let weight = Int(sqlite3_column_int(statement, 2))
                let model = ExerciseSQL(id: id, name: name, weightRow: weight)

                mainList.append(model)
            }
        }
        return mainList
    }
    
    
    func update(weight: Int, where name: String) {
          let query = "UPDATE exercises SET weight = \(weight) WHERE name = '\(name)';"
          var statement : OpaquePointer? = nil
        
          if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
              if sqlite3_step(statement) == SQLITE_DONE {
                  print("Data updated success")
              } else {
                  print("Data is not updated in table")
              }
          }
      }
    
      
      func delete(name: String) {
          let query = "DELETE FROM exercises where name = '\(name)';"
          var statement : OpaquePointer? = nil
          
          if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
              if sqlite3_step(statement) == SQLITE_DONE {
                  print("Data delete success")
              } else {
                  print("Data is not deleted in table")
              }
          }
      }
}


