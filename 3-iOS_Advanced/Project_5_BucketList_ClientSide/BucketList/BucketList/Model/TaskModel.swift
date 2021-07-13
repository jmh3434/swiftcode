//
//  TaskModel.swift
//  BucketList
//
//  Created by James Hunt on 7/12/21.
//

import Foundation

class TaskModel {
    static func getAllTasks(completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = URL(string: "http://localhost:8000/tasks/")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
    static func addTaskWithObjective(objective: String, completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
     // Create the url to request
            if let urlToReq = URL(string: "http://localhost:8000/tasks/") {
                // Create an NSMutableURLRequest using the url. This Mutable Request will allow us to modify the headers.
                var request = URLRequest(url: urlToReq)
                // Set the method to POST
                request.httpMethod = "POST"
                // Create some bodyData and attach it to the HTTPBody
                let bodyData = "objective=\(objective)"
                request.httpBody = bodyData.data(using: .utf8)
                // Create the session
                let session = URLSession.shared
                let task = session.dataTask(with: request as URLRequest, completionHandler: completionHandler)
                task.resume()
            }
    }
    static func updateTask(id:Int, task: NSDictionary, completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        
        let url = URL(string: "http://localhost:8000/tasks/\(id)/")
        var request = URLRequest(url: url!)
        request.httpMethod = "PUT"
        
        do {
            let bodyData = try JSONSerialization.data(withJSONObject: task, options: .prettyPrinted)
            request.httpBody = bodyData
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            print("printingrequesthttpbody",request.httpBody!)
            let session = URLSession.shared
            
            let task = session.dataTask(with: request, completionHandler: completionHandler)
            
            task.resume()
            
        } catch {
            print(error)
        }
        
        
    }
    static func deleteTask(id: Int, completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        
        let url = URL(string: "http://localhost:8000/tasks/\(id)")
        var request = URLRequest(url: url!)
        request.httpMethod = "DELETE"
        
        
        let bodyData = "id=\(id)"
        print("id is ",bodyData)
        request.httpBody = bodyData.data(using: .utf8)
        // Create the session
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: completionHandler)
        
        task.resume()
    }

}
