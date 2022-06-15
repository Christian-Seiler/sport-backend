//
//  SportEvent.swift
//  
//
//  Created by Christian Seiler on 15.06.22.
//

import Fluent
import Foundation

final class SportEvent: Model {
    
    static let schema = "sportevents"
    
    @ID(key: .id)
    var id: UUID?
    
    init() {}
    
    init(id: UUID? = nil) {
        self.id = id
    }
    
}
