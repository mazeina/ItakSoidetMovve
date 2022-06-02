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
        //example
        let indexPathRow = indexPath.row
        switch indexPathRow {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.filmsCellID,
                                                           for: indexPath) as? FilmsTableViewCell else {
                return UITableViewCell()
            }
            //example for filling collection
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.serialsCellID,
                                                           for: indexPath) as? SerialsTableViewCell else {
                return UITableViewCell()
            }
            //example for filling collection
            //cell.testLabel.text = tvShows.first?.name
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - TableView Delegate

extension CatalogViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //example
        let indexPathRow = indexPath.row
        switch indexPathRow {
        case 0:
            return 300
        case 1:
            return 300
        default:
            return 100
        }
    }
}

// MARK: - Catalog View Controller

class CatalogViewController: UIViewController {
    
    @IBOutlet var catalogTableView: UITableView!
    
    var movies: ResponseMovies? = nil
    
    let allCells = [
        FilmsTableViewCell(),
        SerialsTableViewCell(),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catalogTableView.delegate = self
        catalogTableView.dataSource = self
        registerCells()
        
        catalogTableView.isScrollEnabled = false
    }
    
    private func registerCells() {
        catalogTableView.register(UINib(nibName: Constants.filmsNibName, bundle: nil),
                                  forCellReuseIdentifier: Constants.filmsCellID)
        catalogTableView.register(UINib(nibName: Constants.serialsNibName, bundle: nil),
                                  forCellReuseIdentifier: Constants.serialsCellID)
    }
    
    func loadMovies(completion: @escaping(() -> ())) {
        NetworkManager.shared.getDiscoverMovies(completion: { movies in
            
            self.movies = movies
            completion()
        })
    }

        func pushMovieDetailController(with indexPath: IndexPath) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let movieIdentifier = String(describing: DetailMoviesViewController.self)
    
            if let detailViewController = storyboard.instantiateViewController(identifier: movieIdentifier) as? DetailMoviesViewController {
                detailViewController.movie = movies?.results[indexPath.row]

                self.navigationController?.pushViewController(detailViewController, animated: true)
            }
        }

//    func pushMovieDetailController(with indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "detailMovieSegue", sender: self)
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == Constants.detailMovieSegue {
//            let destinationController = segue.destination as? DetailMoviesViewController
//            let cell = sender as? // Cell //
//
//            destinationController
//        }
//    }
}
