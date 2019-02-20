//
//  SaveDataController.swift
//  SavingData
//
//  Created by Nitesh  on 20/02/19.
//  Copyright © 2019 Nitesh . All rights reserved.
//

import UIKit

class SaveDataController: UIViewController {
    
    var name: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.textAlignment = .center
        return label
    }()
    
    let phoneNumber: UILabel = {
        let label = UILabel()
        label.text = "phone number"
        label.textAlignment = .center
        return label
    }()
    
    lazy var saveDataButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("SAVE DATA", for: .normal)
        button.addTarget(self, action: #selector(saveDataToCoreData), for: .touchUpInside)
        return button
    }()
    
    @objc func saveDataToCoreData() {
        print("data saved")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        guard let name = name.text else { return }
        guard let phoneNum = phoneNumber.text else { return }
        print("Name: \(name), PhoneNumber: \(phoneNum)")
    }
    
    func setupViews() {
        let stackViews = UIStackView(arrangedSubviews: [name, phoneNumber, saveDataButton])
        stackViews.distribution = .fillEqually
        stackViews.axis = .vertical
        stackViews.spacing = 10
        view.addSubview(stackViews)
        stackViews.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 200)
    }
    
}
