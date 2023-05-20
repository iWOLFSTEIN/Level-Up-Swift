import Foundation

class DataContainer {
    static let shared = DataContainer()
    var responseHeaders: ResponseHeaders?
    private init() {}
}
