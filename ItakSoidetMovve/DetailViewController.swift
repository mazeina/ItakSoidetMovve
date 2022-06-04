//
//  DetailViewController.swift
//  ItakSoidetMovve
//
//  Created by Nikita Nesporov on 30.05.2022.
//

import UIKit
import Cosmos

class DetailMoviesViewController: UIViewController {
    
    var actorsArray: [ResponseCreditsMovie.Cast]?
    var actorsMovie: ResponseCreditsMovie.Cast?
    var movies: ResponseMovies?
    var tvShows: ResponseTV?
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var actorsCollectionView: UICollectionView!
    @IBOutlet weak var detailMoviesViewOutlet: UIView!
    @IBOutlet weak var ratingStar: CosmosView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
        loadTVShows()
        loadActorsMovies() {
            print("sdfsdfs")
            DispatchQueue.main.async {
                self.actorsCollectionView.reloadData()
            }
        }
        
        var settings = CosmosSettings()
        settings.fillMode = .half
        settings.totalStars = 10
        ratingStar.settings = settings
        
        self.actorsCollectionView.dataSource = self
        self.actorsCollectionView.delegate = self
        
        self.actorsCollectionView.register(UINib(nibName: "ActorsListTableViewCell", bundle: nil), forCellWithReuseIdentifier: "ActorsListTableViewCell")
        self.actorsCollectionView.reloadData()
        
 }
    
    override func viewWillAppear(_ animated: Bool) {
        fillupViewWithData()
    }
    
    @IBAction func goToWebVersion(_ sender: UIButton) {
        if Constants.movieToTVSwitcher == true {
            if let url = URL(string: "https://www.themoviedb.org/movie/\(movies?.results[Constants.indexOfMovie].id ?? 0)") {
                UIApplication.shared.open(url)
            }
        } else {
            if let url = URL(string: "https://www.themoviedb.org/tv/\((tvShows?.results[Constants.indexOfMovie].id ?? 0))") {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func addToWatchLaterButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    func loadMovies() {
        NetworkManager.shared.getDiscoverMovies { movies in
            self.movies = movies
        }
    }
    
    func loadTVShows() {
        NetworkManager.shared.getDiscoverTV { tvShows in
            self.tvShows = tvShows
        }
    }
    
    func loadActorsMovies(completion: @escaping(() -> ())) {
        if Constants.movieToTVSwitcher == true {
            NetworkManager.shared.getDiscoverCreditsMovie { actors in
                self.actorsArray = actors.cast
            }
        } else {
            NetworkManager.shared.getDiscoverCreditsMovie { actors in
                self.actorsArray = actors.cast
            }
        }
        completion()
    }
    
    func fillupViewWithData() {
        let indx = Constants.indexOfMovie
        let resultsMovies = movies?.results[indx]
        let resultTV = tvShows?.results[indx]
        let urlMovies = URL(string: "\(Constants.NetWork.defaultImagePath + (resultsMovies?.posterPath ?? "nil"))")!
        let dataMovies = try? Data(contentsOf: urlMovies)
        let urlTV = URL(string: "\(Constants.NetWork.defaultImagePath + (resultTV?.posterPath ?? "nil"))")!
        let dataTV = try? Data(contentsOf: urlTV)
        
        if Constants.movieToTVSwitcher == true {
            nameLabel.text = resultsMovies?.title
            releaseDateLabel.text = "Дата выхода: \(resultsMovies?.releaseDate ?? "0.0")"
            posterImageView.image = UIImage(data: dataMovies ?? Data())
            descriptionTextView.text = resultsMovies?.overview
            ratingStar.rating = resultsMovies?.voteAverage ?? 0.0
        } else if Constants.movieToTVSwitcher == false {
            nameLabel.text = resultTV?.name
            releaseDateLabel.text = "Дата выхода: \(resultTV?.firstAirDate ?? "nil")"
            posterImageView.image = UIImage(data: dataTV ?? Data())
            descriptionTextView.text = resultTV?.overview
            ratingStar.rating = resultTV?.voteAverage ?? 0.0
        }
    }
    @IBAction func dismissButtonPresed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}

extension DetailMoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        actorsArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActorsListTableViewCell", for: indexPath) as! ActorsListTableViewCell
        
        let actor =  actorsArray![indexPath.item]
        cell.configureWith(actor: actor)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 70)
    }

}
