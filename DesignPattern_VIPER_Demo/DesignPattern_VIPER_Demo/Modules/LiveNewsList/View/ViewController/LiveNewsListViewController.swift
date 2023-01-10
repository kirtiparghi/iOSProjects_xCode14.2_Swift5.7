//
//  LiveNewsListViewController.swift
//  DesignPattern_VIPER_Demo
//
//  Created by Kirti Parghi on 2023-01-09.
//

import UIKit
import Alamofire

class LiveNewsListViewController: UIViewController {
        
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var presenter: LiveNewsListViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
        presenter?.updateView()
    }

    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "LiveNewsListTableViewCell", bundle: .main), forCellReuseIdentifier: "LiveNewsListTableViewCell")
    }
}

// MARK: - UITableViewDataSource
extension LiveNewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNewsListCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LiveNewsListTableViewCell", for: indexPath) as? LiveNewsListTableViewCell
        let row = indexPath.row
        let news = presenter?.getNews(index: row)
        guard let title = news?.title, let author = news?.author, let description = news?.description else {
            return cell ?? UITableViewCell()
        }
        cell?.setCell(title: title, author: author, description: description)
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension LiveNewsListViewController: UITableViewDelegate {}

// MARK: - LiveNewsListPresenterToViewProtocol
extension LiveNewsListViewController: LiveNewsListPresenterToViewProtocol {

    func showNews() {
        tableView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
