//
//  ViewController.swift
//  CombineCall
//
//  Created by Bharat Lal on 25/03/23.
//

import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!
    
    private let viewModel = RepositoryViewModel()
    private var cancellables = Set<AnyCancellable>()
    private var repositories = [Repository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bind()
        getData()
    }
    
    private func setup() {
        tableView.dataSource = self
    }
    
    private func getData() {
        viewModel.getRepositories()
    }
    
    private func bind() {
        viewModel.$repositories.sink { _ in } receiveValue: { [weak self] repositories in
            self?.repositories = repositories
            self?.tableView.reloadData()
        }
        .store(in: &cancellables)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepoCell
        cell.configure(with: repositories[indexPath.item])
        return cell
    }
}

