import Fluent
import Vapor
import Foundation


final class TeamMember: Model, Content {
        static let schema = "teammembers"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String?
    
    @Field(key: "birthdate")
    var birthdate: Date?
    
    // MARK: - Initializers
    
    init() {}
    
    init(id: UUID? = nil, name: String, birthdate: Date?) {
        self.id = id
        self.name = name
        self.birthdate = birthdate
    }
}
