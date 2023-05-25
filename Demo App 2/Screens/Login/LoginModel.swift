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

struct Coach: Codable {
    let name: String
}

struct Manager: Codable {
    let name: String
}

struct Office: Codable {
    let address: String
    let name: String
}

struct Plan: Codable {
    let currentPlan: Bool
    let id: Int
    let name: String
    let startedAt: String

    private enum CodingKeys: String, CodingKey {
        case currentPlan = "current_plan?"
        case id, name
        case startedAt = "started_at"
    }
}

struct AuthenticatedUser: Codable {
    let isActive: Bool
    let appPlatform: String
    let appVersion: String
    let canUpdateProgress: Bool
    let coach: Coach
    let deviceToken: String
    let email: String
    let expansionPlans: [String]
    let isFirstLogin: Bool
    let id: Int
    let manager: Manager
    let name: String
    let office: Office
    let plans: [Plan]
    let uid: String

    private enum CodingKeys: String, CodingKey {
        case isActive = "active?"
        case appPlatform = "app_platform"
        case appVersion = "app_version"
        case canUpdateProgress = "can_update_progress?"
        case coach
        case deviceToken = "device_token"
        case email
        case expansionPlans = "expansion_plans"
        case isFirstLogin = "first_login?"
        case id, manager, name, office, plans, uid
    }
}


