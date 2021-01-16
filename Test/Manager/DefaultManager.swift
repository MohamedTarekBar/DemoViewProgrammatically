//
//  UserDefaultManager.swift
//  Test
//
//  Created by MohamedTarek on 22/12/2020.
//

import UIKit

struct DefaultManager {
    
    
    static func encode<T:Codable> (_ type:T) -> Data? {
        let encoder = JSONEncoder()
        do {
            let encoded = try encoder.encode(type)
            return encoded
        } catch {
            print(error)
        }
        return nil
    }

    static var isLoggedIn: Bool {
        set{
            UserDefaults.standard.set(newValue, forKey: "IsloggedIn")
        }
        get{
            return UserDefaults.standard.bool(forKey: "IsloggedIn")
        }
    }
    
    static var currentUser: User? {
        set{
            let user = encode(newValue)
            UserDefaults.standard.set(user, forKey: "currentUser")
        }
        get{
            do {
                if let user = UserDefaults.standard.object(forKey: "currentUser") as? Data {
                let decoder = JSONDecoder()
                return try decoder.decode(User.self, from: user)
                }
            }
            catch {
                print(error)
            }
            return nil
        }
    }
    
    
    
}
