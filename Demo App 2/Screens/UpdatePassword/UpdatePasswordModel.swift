import Foundation

struct UpdatePasswordResponse : Codable {
    var message: String
}

struct UpdatePasswordData {
    var password: String
    var passwordConfirmation: String
    var currentPassword: String
}
