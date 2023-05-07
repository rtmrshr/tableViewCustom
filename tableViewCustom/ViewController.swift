//
//  ViewController.swift
//  tableViewCustom
//
//  Created by  ratmir on 07.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    let contacts = [("John Smith", "555-1234"), ("Jane Doe", "555-5678"), ("Bob Johnson", "555-9876")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        view.addSubview(tableView)
        
        //MARK: - Constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        let contact = contacts[indexPath.row]
        cell.configure(name: contact.0, phone: contact.1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
        headerView.backgroundColor = .blue.withAlphaComponent(0.5)
        
        let headerLabel = UILabel(frame: CGRect(x: 16, y: 0, width: headerView.frame.width - 16, height: headerView.frame.height))
        headerLabel.text = "Contacts"
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerView.addSubview(headerLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        44
    }
    
}
