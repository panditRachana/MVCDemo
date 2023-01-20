//
//  ViewController.swift
//  MVCDemo
//
//  Created by Rachana Pandit on 07/11/22.
//

import UIKit

class ViewController: UIViewController{
    
@IBOutlet weak var tblEmployeeList:UITableView!
var employeeArray = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblEmployeeList.delegate = self
        tblEmployeeList.dataSource = self
        
// MARK:- Register Xib Cell
        let nib = UINib(nibName: "CellEmployee", bundle: nil)
        tblEmployeeList.register(nib, forCellReuseIdentifier: "CellEmployee")
    }
    
//MARK:- Button Action
    @IBAction func btnToNavigateSecondVC(_ sender : Any)
    {
        let SecondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        SecondVC.delegateOnSecondViewController = self
        navigationController?.pushViewController(SecondVC, animated: true)
    }
}

//MARK:- TableViewDelegate Methods
extension ViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}

// MARK:- TableViewDataSource Methods
extension ViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return employeeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblEmployeeList.dequeueReusableCell(withIdentifier: "CellEmployee", for: indexPath) as! CellEmployee
        let eachEmployee = employeeArray[indexPath.row]
        cell.lblEmployeeId.text = String(eachEmployee.empId)
        cell.lblEmpName.text = eachEmployee.empName
        cell.lblEmpLastName.text = eachEmployee.empLastName
        cell.lblEmpSalary.text = String(eachEmployee.empSalary)
        return cell
    }
}

// MARK:- Conforming to BackDataPassingProtocol
extension ViewController:BackDataPassingProtocol
{
    func passingDataToFirstViewController(employee: Employee)
    {
        let empObject =  Employee(empId: employee.empId,
                                  empName: employee.empName,
                                  empLastName: employee.empLastName,
                                  empSalary: employee.empSalary)
     
        employeeArray.append(empObject)
        tblEmployeeList.reloadData()
    }
}
