//
//  userLocalStorage.swift
//  Test
//
//  Created by MohamedTarek on 26/12/2020.
//

import UIKit
import SQLite


// this page user
extension LocalStorage {

    func setupUserColumns() {
        
        let columns = self.currentUser.create {
            (table) in
            table.column(email, unique: true)
            table.column(phone, unique: true)
            table.column(name)
            table.column(image)
            table.column(address)
        }
          do {
            try dataBase.run(columns)
          } catch {
            print(error)
          }
    }
    
    func insertUser(name: String,
                    email: String,
                    phone: String,
                    address: String,
                    image: Data) {
        
        let user = self.currentUser.insert(
            self.name <- name,
            self.email <- email,
            self.phone <- phone,
            self.address <- address,
            self.image <- image
        )
        do {
            try self.dataBase.run(user)
        }
        catch{
            print(error)
        }
    }
    
    func getUserbyEmail(email :String , completion: @escaping (_ selected: Row) -> Void) {
        var selected :Row?
        do {
            let users = try self.dataBase.prepare(self.currentUser)
            for row in users {
                let user = try row.get(self.email)
                if user == email {
                    selected = row
                    break
                }
            }
        } catch {
            print(error)
        }
        guard selected != nil else {
            return
        }
        
        completion(selected!)
    }
}
