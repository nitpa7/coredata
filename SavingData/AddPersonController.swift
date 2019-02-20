//
//  AddPersonController.swift
//  SavingData
//
//  Created by Nitesh  on 20/02/19.
//  Copyright © 2019 Nitesh . All rights reserved.
//

import Foundation
import UIKit

import UIKit

struct Person {
    let name: String
    let phoneNumber: Int
    
    init(name: String, phoneNumber: Int) {
        self.name = name
        self.phoneNumber = phoneNumber
    }
}

class AddPersonController: UITableViewController {
    
    let cellID = "cellID"
    
    var maleNames: [Person] = []
    var femaleNames: [Person] = []
    
    fileprivate func setUpNames() {
        
        let mark = Person(name: "Mark", phoneNumber: 123456789)
        let bean = Person(name: "Bean", phoneNumber: 123456789)
        let sean = Person(name: "Sean", phoneNumber: 123456789)
        let dean = Person(name: "Dean", phoneNumber: 123456789)
        let mean = Person(name: "Mean", phoneNumber: 123456789)
        maleNames.append(mark)
        maleNames.append(bean)
        maleNames.append(sean)
        maleNames.append(dean)
        maleNames.append(mean)
        
        let becca = Person(name: "Becca", phoneNumber: 987654321)
        let rebecca = Person(name: "Rebecca", phoneNumber: 987654321)
        let rabona = Person(name: "Rabona", phoneNumber: 987654321)
        femaleNames.append(becca)
        femaleNames.append(rebecca)
        femaleNames.append(rabona)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        navigationItem.title = "Contacts"
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellID)
        setUpNames()
        print(maleNames.count)
        print(femaleNames.count)
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.textAlignment = .left
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        if section == 0 {
            label.textAlignment = .left
            label.text = "Male"
        } else {
            label.textAlignment = .left
            label.text = "Female"
        }
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return maleNames.count
        } else {
            return femaleNames.count
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsController = SaveDataController()
        if indexPath.section == 0 {
            detailsController.name.text = maleNames[indexPath.row].name
            detailsController.phoneNumber.text = String(maleNames[indexPath.row].phoneNumber)
        } else if indexPath.section == 1 {
            detailsController.name.text = femaleNames[indexPath.row].name
            detailsController.phoneNumber.text = String(femaleNames[indexPath.row].phoneNumber)
        }
        navigationController?.pushViewController(detailsController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
        if indexPath.section == 0 {
            cell.name.text = maleNames[indexPath.row].name
            cell.phoneNumber.text = String(maleNames[indexPath.row].phoneNumber)
        } else if indexPath.section == 1 {
            cell.name.text = femaleNames[indexPath.row].name
            cell.phoneNumber.text = String(femaleNames[indexPath.row].phoneNumber)
        }
        return cell
    }
}

class TableViewCell: UITableViewCell {
    
    var profilePic: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        return iv
    }()
    
    var name: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        return label
    }()
    
    var phoneNumber: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(profilePic)
        addSubview(name)
        addSubview(phoneNumber)
        
        profilePic.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 40, height: 0)
        name.anchor(top: topAnchor, left: profilePic.rightAnchor, bottom: phoneNumber.topAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 0, height: 20)
        phoneNumber.anchor(top: name.bottomAnchor, left: profilePic.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 0, height: 20)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
