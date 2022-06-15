import Fluent
import Vapor

struct TeamController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let team = routes.grouped("team")
        team.get(use: index)
        team.post(use: create)
        /*
         team.group(":memberID") { team in
            team.delete(use: delete)
        }
        */
    }
    
    func index(req: Request) async throws -> [TeamMember] {
        try await TeamMember.query(on: req.db).all()
    }
    
    func create(req: Request) async throws -> TeamMember {
        let member = try req.content.decode(TeamMember.self)
        try await member.save(on: req.db)
        return member
    }
    
    func delete(req: Request) async throws -> HTTPStatus {
        guard let member = try await TeamMember.find(req.parameters.get("memberID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await member.delete(on: req.db)
        return .noContent
    }
}
