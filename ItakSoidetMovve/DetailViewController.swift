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
        
        var settings = CosmosSettings()
        settings.fillMode = .half
        settings.totalStars = 10
        ratingStar.settings = settings
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
}
