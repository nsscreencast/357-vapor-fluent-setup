import Vapor
import FluentSQLite

final class Post : SQLiteModel {
    var id: Int?
    var title: String
    var body: String
    var author: String
    var publishedAt: Date?
    
    static let entity = "posts"
    
    init(title: String, body: String, author: String) {
        self.title = title
        self.body = body
        self.author = author
    }
}

extension Post : Migration {}
