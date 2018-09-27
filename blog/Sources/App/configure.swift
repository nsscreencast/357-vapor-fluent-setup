import Vapor
import FluentSQLite

/// Called before your application initializes.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#configureswift)
public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
) throws {
    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
    
    try services.register(FluentSQLiteProvider())
    
    let db = try SQLiteDatabase(storage: .file(path: "db.sqlite"))
    
    var dbConfig = DatabasesConfig()
    dbConfig.add(database: db, as: .sqlite)
    services.register(dbConfig)
    
    var migrations = MigrationConfig()
    migrations.add(model: Post.self, database: .sqlite)
    services.register(migrations)
}
