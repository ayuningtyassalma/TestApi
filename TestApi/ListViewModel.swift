//
//  listModel.swift
//  TestApi
//
//  Created by Phincon on 13/03/23.
//

import Foundation

protocol ListViewProtocol {
    var url : String {get set}
    var bindEmployeData: ((Employee?) -> ())? { get set }
    func fetchDataEmployee()
}

class ListViewModel{
//    buat property buat API service
    private let apiService : ApiServieEmployee?
    //buat ngmbil url
    private var url : String = ""
    
    // buat property untuk parsing data
//    private{set}; var employeeData : firstModel?{
//        didSet{
//            self.bindEmployeData()
//        }
//    }
//
    
    //closure?
    var bindEmployeData: ((Employee?) -> ())?
    
    init(url:String){
        self.url = url
        self.apiService = ApiServieEmployee(url: self.url)
        
        fetchDataEmployee()
    }
    
    func fetchDataEmployee(){
        self.apiService?.callApi(completion: {listModel in
            if let listModel = listModel {
                self.bindEmployeData?(listModel)
            } else {
                self.bindEmployeData?(nil)
            }
        })
    }
}
