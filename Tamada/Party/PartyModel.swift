import UIKit
import MapKit

final class PartyModl : Decodable {
    let title: String
    let description: String
    let imageURL: URL?
    var imageData: Data? = nil
    
    init(title: String, description: String, imageURL: URL?) {
        self.title = title
        self.description = description
        self.imageURL = imageURL
    }
    
    public func toParty() -> Party {
        return Party(party: title)
    }
}

