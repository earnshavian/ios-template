//
//  APIClient.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 11/1/16.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Alamofire
import Marshal

final class APIClient {
    static var shared = APIClient()

    let manager: Alamofire.SessionManager
    let oauthClient: OAuthClient
    let baseURL: URL
    let authorizationToken: String? = nil

    init(baseURL: URL = BuildType.active.baseURL, configuration: URLSessionConfiguration = .default) {
        self.baseURL = baseURL
        self.oauthClient = OAuthClient(baseURL: baseURL, configuration: configuration)
        configuration.httpAdditionalHeaders?[APIConstants.accept] = APIConstants.applicationJSON
        manager = SessionManager(configuration: configuration)
        manager.adapter = oauthClient
        manager.retrier = oauthClient
    }

    @discardableResult
    func request<Endpoint: APIEndpoint>(_ endpoint: Endpoint, completion: @escaping (Endpoint.ResponseType?, Error?) -> Void) -> DataRequest where Endpoint.ResponseType: Unmarshaling {
        return manager.request(baseURL, endpoint: endpoint, completion: completion)
    }

    @discardableResult
    func request<Endpoint: APIEndpoint>(_ endpoint: Endpoint, completion: @escaping (Endpoint.ResponseType?, Error?) -> Void) -> DataRequest where Endpoint.ResponseType: Collection, Endpoint.ResponseType.Iterator.Element: Unmarshaling {
        return manager.request(baseURL, endpoint: endpoint, completion: completion)
    }

}
