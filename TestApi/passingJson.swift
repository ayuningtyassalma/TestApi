//
//  passingJson.swift
//  TestApi
//
//  Created by Phincon on 13/03/23.
//

import Foundation

struct Employee : Codable {
    let data : [DataDummyEmployee]
}

struct DataDummyEmployee: Codable {
    let id : Int
    let employeeName : String
    let employeeSalary : Int
    let employeeAge : Int
    let profileImage : String
    
    enum CodingKeys : String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
         
    }
}


//1. buat model dari JSON (biar diparsing)
// 2. buat networking, bisa menggunakan url session atau pod (almofire)
// 3. buat viewmodelnya
//  4. lempar data dari viewmodel ke controller
