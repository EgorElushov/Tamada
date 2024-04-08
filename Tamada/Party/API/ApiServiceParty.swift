import UIKit


protocol APIServiseProtocol {
    typealias Model = PartyModel
    func getNews(_ request: Model.GetParty.Request, completion: @escaping (Model.PartyList) -> ())
    func loadImage(from urlString: String, completion: @escaping (_ data: Data?) -> ())
}

class APIServise: APIServiseProtocol {
    private let decoder: JSONDecoder = JSONDecoder()
    private let session: URLSession = URLSession.shared

    func getNews(_ request: Model.GetParty.Request, completion: @escaping (Model.PartyList) -> ()) {
        guard let url = URL(string: "92.118.169.243/api/get_party") else {
            return
        }
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            if let data = data,
               let news = try? self?.decoder.decode(Model.PartyList.self, from: data) {
                completion(news)
            } else {
                print("Could not get any content")
            }
        }

        task.resume()
    }

    func loadImage(from urlString: String, completion: @escaping (_ data: Data?) -> ()) {
        let session = URLSession.shared
        guard let url = URL(string: urlString) else {
            return
        }
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                completion(data)
            } else {
                print("Could not load image")
            }
        }
        dataTask.resume()
    }
}


enum PartyModel {
    enum GetParty {
        struct Request {
        }

        struct Response {
            var parties: PartyList
        }
    }


    struct PartyList: Decodable {
        let parties: [PartyLong]?
    }

    struct PartyLong: Decodable {
        let title: String?
        let description: String?
        let deadline: Date?
        let imageLink: String?


        enum CodingKeys: String, CodingKey {
            case title, description, deadline
            case imageLink = "urlToImage"
        }
    }
}

