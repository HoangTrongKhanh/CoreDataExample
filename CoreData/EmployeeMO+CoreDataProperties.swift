//
//  EmployeeMO+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Hoàng Khánh on 4/18/18.
//  Copyright © 2018 Hoàng Khánh. All rights reserved.
//
//

import Foundation
import CoreData


extension EmployeeMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmployeeMO> {
        return NSFetchRequest<EmployeeMO>(entityName: "Employee")
    }

    @NSManaged public var hireDate: NSDate?
    @NSManaged public var identifier: String?
    @NSManaged public var isManager: Bool
    @NSManaged public var title: String?
    @NSManaged public var department: DepartmentMO?
    
    static func insertNewEmployee(name: String, dateOfBirth: NSDate, hireDate: NSDate, identifier: String, isManager: Bool, title: String) -> EmployeeMO? {
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: AppDelegate.managedObjectContext!) as! EmployeeMO
        employee.name = name
        employee.dateOfBirth = dateOfBirth
        employee.hireDate = hireDate
        employee.identifier = identifier
        employee.isManager = isManager
        employee.title = title
        do {
            try AppDelegate.managedObjectContext?.save()
        } catch {
            let nserror = error as NSError
            print("Cannot insert new employee. Error: \(nserror), \(nserror.userInfo)")
            return nil
        }
        print("Insert employee with name: \(employee.name ?? "") successful")
        return employee
    }
    
    static func getAllEmployees() -> [EmployeeMO] {
        var result = [EmployeeMO]()
        let moc = AppDelegate.managedObjectContext
        do {
            result = try moc!.fetch(EmployeeMO.fetchRequest()) as! [EmployeeMO]
        } catch {
            print("Cannot fetch employees. Error \(error)")
            return result
        }
        return result
    }
    
    static func deleteAllEmployees() -> Bool {
        let moc = AppDelegate.managedObjectContext
        let employees = EmployeeMO.getAllEmployees()
        for employee in employees {
            moc?.delete(employee)
        }
        do {
            try AppDelegate.managedObjectContext?.save()
        } catch {
            let nserror = error as NSError
            print("Delete all employees failed. Error: \(nserror), \(nserror.userInfo)")
            return false
        }
        print("Delete all employees successful")
        return true
    }
    
}
