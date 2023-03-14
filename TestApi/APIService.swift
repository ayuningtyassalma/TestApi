//
//  APIService.swift
//  TestApi
//
//  Created by Phincon on 13/03/23.
//

import Foundation
//to build a protocol for abstraction
protocol ApiServiceDataEmployee {
    var url : String {get} // nampung url
    func callApi(completion : @escaping(Employee?) -> Void)
    //function yg didalemnya untuk handle networking
}

    
    //implementProtocol
    struct ApiServieEmployee: ApiServiceDataEmployee {
        
        var url : String
        init(url: String) {
            //init URL
            self.url = url
        }
        
        //buat url
        func callApi(completion: @escaping (Employee?) -> Void) {
            guard let url = URL(string: self.url) else {return}
            
            //buat url session utk api
            URLSession.shared.dataTask(with: url){ data, response, error in
                
                
                guard let data = data else {return}
            
            
            
            do{
                
                //bikin secoder, passing data ke model, masukin ke completion
                let decoder = JSONDecoder()
                let modelData = try decoder.decode(Employee.self, from: data)
                completion(modelData)
            } catch{
                completion(nil)
            }
                //jgn smpe lupa
            }.resume()
        }
        
}
