//
//  ViewController.swift
//
//
//  Created by Tomas on 3/1/23.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    var profileImageView = UIImageView()
    let nameLabel = UILabel()
    var addItem = UITextField()
    var items_list = UITextView()
    var editProfileButton = UIButton()
    var duedate = UITextField()
    let date = Date()
    let dateFormatter = DateFormatter()
    var borderColor : UIColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        profileImageView.image = UIImage(named: "profileImage")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        
        nameLabel.text = "MEMORY"
        nameLabel.font = .systemFont(ofSize: 50)
        nameLabel.textColor = UIColor.white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        editProfileButton.setTitle("ADD ITEM", for: .normal)
        editProfileButton.setTitleColor(.green, for: .normal)
        editProfileButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editProfileButton)
        
        items_list.layer.borderWidth = 0.5
        items_list.layer.borderColor = borderColor.cgColor
        items_list.layer.cornerRadius = 7
        items_list.backgroundColor = UIColor.black
        items_list.translatesAutoresizingMaskIntoConstraints = false
        items_list.isUserInteractionEnabled = false
        view.addSubview(items_list)
        
        addItem.attributedPlaceholder = NSAttributedString(
            string: "Write new task",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        )
        addItem.textColor = UIColor.white
        addItem.font = .systemFont(ofSize: 20)
        addItem.borderStyle = .bezel
        addItem.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addItem)
        
        dateFormatter.dateFormat = "MM/dd"
        
        setupConstraints()
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            profileImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
            
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addItem.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            addItem.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            addItem.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            items_list.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            items_list.topAnchor.constraint(equalTo: editProfileButton.bottomAnchor),
            items_list.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            items_list.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            editProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            editProfileButton.bottomAnchor.constraint(equalTo: addItem.bottomAnchor, constant: 30)
        ])
        
    }
    
    
    @objc func buttonAction() {
        var day = dateFormatter.string(from: date)
        items_list.text += day + "     " + addItem.text! + "\n"
        addItem.text = ""
        duedate.text = ""
    }
}
