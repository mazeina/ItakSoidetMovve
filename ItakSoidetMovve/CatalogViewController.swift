//
//  ViewController.swift
//  ItakSoidetMovve
//
//  Created by Полина Дусин on 30.05.2022.
//

import UIKit
 
// MARK: - TableView DataSource

extension CatalogViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        ///example
        let indexPathRow = indexPath.row 
        switch indexPathRow {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.filmsCellID,
                                                           for: indexPath) as? FilmsTableViewCell else {
                return UITableViewCell()
            }
            cell.testLabel.text = "movies"
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.serialsCellID,
                                                           for: indexPath) as? SerialsTableViewCell else {
                return UITableViewCell()
            }
            cell.testLabel.text = "tvshows"
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.actorsCellID,
                                                           for: indexPath) as? ActorsListTableViewCell else {
                return UITableViewCell()
            }
            cell.testLabel.text = "actors"
            return cell
        }
    }
}

// MARK: - TableView Delegate

extension CatalogViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        ///example
        let indexPathRow = indexPath.row
        switch indexPathRow {
        case 0:
            return 200
        case 1:
            return 150
        default:
            return 100
        }
    }
}

// MARK: - Catalog View Controller

class CatalogViewController: UIViewController {
 
    @IBOutlet var catalogTableView: UITableView!
    
    let allCells = [
        FilmsTableViewCell(),
        SerialsTableViewCell(),
        ActorsListTableViewCell()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catalogTableView.delegate = self
        catalogTableView.dataSource = self
        registerCells()
     
    }
 
    private func registerCells() {
        catalogTableView.register(UINib(nibName: Constants.filmsNibName, bundle: nil),
                                  forCellReuseIdentifier: Constants.filmsCellID)
        catalogTableView.register(UINib(nibName: Constants.serialsNibName, bundle: nil),
                                  forCellReuseIdentifier: Constants.serialsCellID)
        catalogTableView.register(UINib(nibName: Constants.actorsNibName, bundle: nil),
                                  forCellReuseIdentifier: Constants.actorsCellID)
    }
}