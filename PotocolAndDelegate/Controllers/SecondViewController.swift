//
//  SecondViewController.swift
//  PotocolAndDelegate
//
//  Created by Nimap on 12/02/24.
//

import UIKit

protocol DataPass {
    func datapass(UserName : String , Password : String )
}

class SecondViewController: UIViewController {
    
    var UserNameTF : UITextField!
    var PasswordTF : UITextField!
    var SaveBtn : UIButton!
    
    var delegate : DataPass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BaseFunc()
    }
    func BaseFunc (){
        
        view.backgroundColor = .white
        
        UserNameTF = UITextField()
        UserNameTF.placeholder = "Enter UserName"
        UserNameTF.borderStyle = .roundedRect
        UserNameTF.delegate = self
        view.addSubview(UserNameTF)
        UserNameTF.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            UserNameTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            UserNameTF.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            UserNameTF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            UserNameTF.heightAnchor.constraint(equalToConstant: 40)
        ])
        PasswordTF = UITextField()
        PasswordTF.placeholder = "Enter Password"
        PasswordTF.borderStyle = .roundedRect
        PasswordTF.delegate = self
        view.addSubview(PasswordTF)
        PasswordTF.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            PasswordTF.topAnchor.constraint(equalTo: UserNameTF.bottomAnchor, constant: 20),
            PasswordTF.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            PasswordTF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            PasswordTF.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        SaveBtn = UIButton()
        SaveBtn = UIButton(type: .system)
        SaveBtn.setTitle("Save", for: .normal)
        SaveBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        SaveBtn.addTarget(self, action: #selector(SaveBtnPassed), for: .touchUpInside)
        view.addSubview(SaveBtn)
        SaveBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            SaveBtn.topAnchor.constraint(equalTo: PasswordTF.bottomAnchor, constant: 20),
            SaveBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            SaveBtn.heightAnchor.constraint(equalToConstant: 40)

        ])
    }
}
extension SecondViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UserNameTF.resignFirstResponder()
        PasswordTF.resignFirstResponder()
        return true
    }
    @objc func SaveBtnPassed() {
        print("Btn Pressed")
        self.navigationController?.popViewController(animated: true)
        delegate.datapass(UserName: UserNameTF.text!.isEmpty ? "Hello" : UserNameTF.text! , Password: PasswordTF.text!.isEmpty ? "World" : PasswordTF.text!)
        }
}
