import Foundation

enum User {
    case NewUser, ExistingUser, InvalidUser
}

struct ResponseHeaders {
    var contentType: String
    var accessToken: String
    var client: String
    var uid: String
}
