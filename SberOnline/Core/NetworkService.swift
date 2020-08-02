import Foundation // swiftlint:disable:this foundation_using

protocol NetworkServiceProtocol: AnyObject {
    func get(path: String, completion: @escaping (Result<Data, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func get(path: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString)?.appendingPathComponent(path) else { completion(.failure(NSError())); return }
        URLSession.shared.dataTask(with: url, result: completion).resume()
    }
}
