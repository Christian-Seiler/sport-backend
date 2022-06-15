//
//  CreateTeamMember.swift
//  
//
//  Created by Christian Seiler on 15.06.22.
//

import Fluent

struct CreateTeamMember: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        try await database.schema(TeamMember.schema)
            .id()
            .field("name", .string)
            .field("birthdate", .date)
            .create()
    }
    
    
}
