import Fluent

struct CreateTodo: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("albums")
            .id()
            .field("title", .string, .required)
            .field("image", .custom("VARCHAR(500)"), .required)
            .field("description", .string, .required)
            .field("artist", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("albums").delete()
    }
}
      

