//
//  ViewController.swift
//  PotocolAndDelegate
//
//  Created by Nimap on 12/02/24.
//

import UIKit

class ViewController: UIViewController, DataPass {
    
    
    
    var FillButton : UIButton!
    var UserNameLabel : UILabel!
    var PasswordLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DisplayView()
    }
    func DisplayView(){
        
        view.backgroundColor = .white
        
        FillButton = UIButton(type: .system)
        FillButton.setTitle("Fill Form", for: .normal)
        FillButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        FillButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        view.addSubview(FillButton)
        FillButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            FillButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            FillButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            FillButton.widthAnchor.constraint(equalToConstant: 200),
//            FillButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        PasswordLabel = UILabel()
        PasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        PasswordLabel.text = "Password"
        PasswordLabel.textColor = .black
        PasswordLabel.textAlignment = .center
        view.addSubview(PasswordLabel)
        NSLayoutConstraint.activate([
            PasswordLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            PasswordLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            PasswordLabel.bottomAnchor.constraint(equalTo: FillButton.topAnchor, constant: -50)
        ])
        
        UserNameLabel = UILabel()
        UserNameLabel.translatesAutoresizingMaskIntoConstraints = false
        UserNameLabel.text = "UserName"
        UserNameLabel.textAlignment = .center
        UserNameLabel.textColor = .black
        view.addSubview(UserNameLabel)
        NSLayoutConstraint.activate([
            UserNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            UserNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            UserNameLabel.bottomAnchor.constraint(equalTo: PasswordLabel.topAnchor, constant: -50)
        ])
        
    }
    @objc func buttonPressed() {
        var vc = FillViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
        print("Fill Btn Pressed")
    }
    func datapass(UserName: String, Password: String) {
        UserNameLabel.text = UserName
        PasswordLabel.text = Password
    }
}

