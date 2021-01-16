//
//  File.swift
//  Test
//
//  Created by MohamedTarek on 26/12/2020.
//

import UIKit
import SQLite


// this page User History
extension LocalStorage {

    func setupUserHistoryColumns() {
        let columns = self.userHistory.create {
            (table) in
            table.column(email)
            table.column(media)
        }
          do {
            try dataBase.run(columns)
          } catch {
            print(error)
          }
    }
    
    func insertMedia(email: String, media: ItunesMedia) {
        
        guard let mediaToData = CodabelManager.encode(media) else {return}
        
        let media = self.userHistory.insert (
            self.email <- email,
            self.media <- mediaToData
        )
        do {
            try self.dataBase.run(media)
        }
        catch{
            print(error)
        }
    }
    
    func getArrOfMedia(email :String) -> [ItunesMedia]?
    {
        var arrOfMedia:[ItunesMedia] = []
        do {
            let history = try self.dataBase.prepare(self.userHistory)
            for row in history {
                let historyEmail = try row.get(self.email)
                if historyEmail == email {
                    let media = row[LocalStorage.shared.media]
                    
                }
            }
        } catch {
            print(error)
        }
        return nil
    }

    
}
