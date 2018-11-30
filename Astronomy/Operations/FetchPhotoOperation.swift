//
//  FetchPhotoOperation.swift
//  Astronomy
//
//  Created by Yvette Zhukovsky on 11/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class FetchPhotoOperation: ConcurrentOperation {

    init(photo: MarsPhotoReference){
       self.photo = photo

    }
    
    
    override func start() {
        state = .isExecuting
        
        guard let iURL = photo.imageURL.usingHTTPS else {return}
        
        task = URLSession.shared.dataTask(with: iURL) {(data, _, error) in
            defer {self.state = .isFinished}
            
            if let error = error {
                NSLog("Erorr fetching\(error)")
                return
            }
            if let data = data {
                self.imageData = data
            }
            
        }
        task.resume()
    
    }

    
    override func cancel() {
        task.cancel()
    }
    
    
    
    var photo: MarsPhotoReference
    var imageData: Data?
   var task: URLSessionDataTask = URLSessionDataTask()
    
    
}
