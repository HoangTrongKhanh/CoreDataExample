//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Hoàng Khánh on 4/18/18.
//  Copyright © 2018 Hoàng Khánh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func btnAdd(_ sender: UIButton) {
        
        let department = DepartmentMO.insertNewDepartment(address: "An Example Adress", city: "Hanoi", name: "Sale department", zipCode: 123456)
        let department1 = DepartmentMO.insertNewDepartment(address: "An example address 1", city: "Hanoi", name: "Information Technology", zipCode: 222222)
        let department2 = DepartmentMO.insertNewDepartment(address: "An example address 2", city: "Hanoi", name: "Information Security", zipCode: 333333)

        var employees = Set<EmployeeMO>()
        
        if let employee1 = EmployeeMO.insertNewEmployee(name: "Employee name 1",
                                                        dateOfBirth: NSDate.calculateDate(day: 1, month: 1, year: 1990),
                                                        hireDate: NSDate(),
                                                        identifier: "A0001",
                                                        isManager: true,
                                                        title: "Sale manager 1") {
            employee1.department = department
            employees.insert(employee1)
        }
        
        if let employee2 = EmployeeMO.insertNewEmployee(name: "Employee name 2",
                                                        dateOfBirth: NSDate.calculateDate(day: 2, month: 2, year: 1990),
                                                        hireDate: NSDate(),
                                                        identifier: "A0002",
                                                        isManager: false,
                                                        title: "Sale manager 2") {
            employee2.department = department
            employees.insert(employee2)
        }
        
        if let employee3 = EmployeeMO.insertNewEmployee(name: "Employee name 3",
                                                        dateOfBirth: NSDate.calculateDate(day: 3, month: 3, year: 1991),
                                                        hireDate: NSDate(),
                                                        identifier: "A0003",
                                                        isManager: true,
                                                        title: "Sale manager 3") {
            employee3.department = department
            employees.insert(employee3)
        }
        department?.addToEmployees(employees as NSSet)
    }
    
    @IBAction func btnFetch(_ sender: UIButton) {
//        let employees = EmployeeMO.getAllEmployees()
//        if employees.count == 0 {
//            print("No employee found")
//            return
//        }
//        for employee in employees {
//            print("Employee name: \(employee.name ?? "")")
//        }
        
//        let departments = DepartmentMO.fetchDepartmentsWithFilter(nameContains: "information", nameExactly: nil)
        let departments = DepartmentMO.fetchDepartmentWithFilter(nameContains: nil, nameExactly: "Information Security")
        for department in departments {
            (department as DepartmentMO).toString()
        }
        
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        EmployeeMO.deleteAllEmployees()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

