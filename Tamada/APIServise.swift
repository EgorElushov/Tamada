//
//  APIServise.swift
//  evelushovPW2
//
//  Created by Егор Елушов on 08.12.2022.
//

import UIKit


protocol APIServiseProtocol {
    typealias Model = NewsModel
    func getNews(_ request: Model.GetNews.Request, completion: @escaping (Model.NewsList) -> ())
    func loadImage(from urlString: String, completion: @escaping (_ data: Data?) -> ())
}

class APIServise: APIServiseProtocol {
    private let decoder: JSONDecoder = JSONDecoder()
    private let session: URLSession = URLSession.shared

    func getNews(_ request: Model.GetNews.Request, completion: @escaping (Model.NewsList) -> ()) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=ee9ca92cd41042da8e521e286fd0389c") else {
            return
        }
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            if let data = data,
               let news = try? self?.decoder.decode(Model.NewsList.self, from: data) {
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


enum NewsModel {
    enum GetNews {
        struct Request {
        }

        struct Response {
            var articles: NewsList
        }
    }

    // MARK: - News

    struct NewsList: Decodable {
        let articles: [Article]?
    }

    // MARK: - Article

    struct Article: Decodable {
        let source: Source?
        let author: String?
        let title: String?
        let description: String?
        let sourceLink: String?
        let imageLink: String?
        let publishTime: String?
        let content:String?

        enum CodingKeys: String, CodingKey {
            case source, author, title, description, content
            case sourceLink = "url"
            case imageLink = "urlToImage"
            case publishTime = "publishedAt"
        }
    }

    // MARK: -Source

    struct Source: Decodable {
        let id: String?
        let name: String?
    }
}

