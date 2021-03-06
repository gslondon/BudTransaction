//
//  TransactionListWorker.swift
//  BudTransaction
//
//  Created by Godfrey Bagley-Clarke on 29/06/2018.
//  Copyright (c) 2018 Godfrey Bagley-Clarke. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

private enum API {
    static let service = "http://www.mocky.io/"
}

class TransactionListWorker {
    func fetchTransactionsFromRemote(_ request: TransactionList.Index.Request, completionHandler: @escaping (TransactionList.Index.Response) -> Void) {
        let URLString: String = "\(API.service)\(request.version!)/\(request.uniqueId!)"
        
        guard let url = URL(string: URLString) else {
            print("Error: malformed url")
            completionHandler(TransactionList.Index.Response(data: []))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: urlRequest, completionHandler: {(data, response, error) -> Void in
            if (error != nil) {
                print("Error: ", error as Any)
                completionHandler(TransactionList.Index.Response(data: []))
                return
            }

            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(TransactionList.Index.Response.self, from: data)
                completionHandler(TransactionList.Index.Response(data: response.data))
            } catch let err {
                print("Error: ", err)
            }
        })
        task.resume()
    }
}

