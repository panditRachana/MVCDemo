//
//  SecondViewController.swift
//  MVCDemo
//
//  Created by Rachana Pandit on 07/11/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var empIdTextField: UITextField!
    @IBOutlet weak var empFirstNameTextField: UITextField!
    @IBOutlet weak var empLastNameTextField: UITextField!
    @IBOutlet weak var empSalaryTextField:UITextField!
    @IBOutlet weak var btnToAddEmployee:UIButton!
    var delegateOnSecondViewController:BackDataPassingProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
   
    
// MARK:- Button Action
    @IBAction func btnClickToAddEmployee(_ sender:Any)
    {
        guard let delegate = delegateOnSecondViewController else{
         print("delegate not found")
         return
        }
        
        let idInt = Int(empIdTextField.text!) ?? 0
        let firstName = empFirstNameTextField.text ?? "First Name"
        let lastName = empLastNameTextField.text ?? "Last Name"
        let salaryFloat = Float(empSalaryTextField.text!) ?? 0.0
        
        let empObject = Employee(empId: idInt, empName: firstName, empLastName: lastName, empSalary: salaryFloat)
        
        delegate.passingDataToFirstViewController(employee: empObject)
        
        self.navigationController?.popViewController(animated: true)
    }

   

}
