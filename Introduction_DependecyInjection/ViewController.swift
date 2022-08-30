//
//  ViewController.swift
//  Introduction_DependecyInjection
//
//  Created by 新垣 清奈 on 2022/08/30.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    private var models = [EmailAccount]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        models = setUpModels()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let account = models[indexPath.row]
        cell.textLabel?.text = account.domain
        return cell
    }

    private func setUpModels() -> [EmailAccount] {
        return [Gmail(), Yahoo(), Outlook()]
    }
}

protocol EmailAccount {
    var name: String { get }
    var domain: String { get }
    var lastRecieveEmailData: Date { get }
}

class Gmail: EmailAccount {
    var name: String {
        "google"
    }

    var domain: String {
        "gmail.com"
    }

    var lastRecieveEmailData: Date {
        return Date()
    }

}
class Yahoo: EmailAccount {
    var name: String {
        "yahoo"
    }

    var domain: String {
        "yahoo.com"
    }

    var lastRecieveEmailData: Date {
        return Date()
    }


}

class Outlook: EmailAccount {
    var name: String {
        "outlook"
    }

    var domain: String {
        "outlook.com"
    }

    var lastRecieveEmailData: Date {
        return Date()
    }
}
