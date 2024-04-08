import Foundation

class Party: NSCoding, Encodable, Decodable {
    var party: String
    
    init(party: String) {
        self.party = party
    }
    
    required convenience init(coder decoder: NSCoder) {
        let party = decoder.decodeObject(forKey: "party")  as? String ?? String()
        self.init(party: party)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(party, forKey: "party")
    }
}
