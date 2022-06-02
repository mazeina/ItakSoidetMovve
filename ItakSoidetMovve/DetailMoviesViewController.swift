//
//  DetailMoviesViewController.swift
//  ItakSoidetMovve
//
//  Created by Nikita Nesporov on 30.05.2022.
//

import UIKit

class DetailMoviesViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var actorsCollectionView: UICollectionView!

    var movie: ResponseMovies.Movie? = nil
    var actorsArray: [ResponseCreditsMovie.Cast]? = nil
    var actors: ResponseCreditsMovie.Cast?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionViewUI()
        setupUI()
    }

    func loadActors(completion: @escaping(() -> ())) {
        NetworkManager.shared.getDiscoverCreditsMovie(completion: { actors in
            self.actorsArray = actors
            let dataArray = actors
            let actorResponce = dataArray.first

            self.actors = actorResponce
            completion()
        })
    }

    func setupCollectionViewUI() {

        self.actorsCollectionView.register(UINib(nibName: Constants.movieActorsCollectionViewCell, bundle: nil),forCellWithReuseIdentifier: Constants.movieActorsCollectionViewCellID)

        loadActors(completion: {
            self.actorsCollectionView.reloadData()
        })
    }

    func setupUI() {

        nameLabel.text = movie?.title
        if let posterPath = movie?.posterPath {
            let urlString = Constants.NetWork.defaultImagePath + posterPath
            self.posterImageView.sd_setImage(with: URL(string: urlString), completed: nil)
        }
        descriptionLabel.text = movie?.overview
        ratingLabel.text = String(describing: movie?.voteAverage)

    }
    
    @IBAction func goToWebVersion(_ sender: UIButton) {

    }

    @IBAction func addToWatchLaterButtonPressed(_ sender: UIBarButtonItem) {

    }

}

extension DetailMoviesViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actorsArray?.count ?? 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let currentActor = actorsArray?[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.movieActorsCollectionViewCellID,for: indexPath) as? MovieActorsCollectionViewCell else {

            return UICollectionViewCell()
        }
        
        cell.configureWith(actorName: currentActor?.actorImage, profilePath: currentActor?.actorImage)
        return cell
    }
}
