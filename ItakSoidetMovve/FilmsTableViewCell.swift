//
//  FilmsTableViewCell.swift
//  ItakSoidetMovve
//
//  Created by Nikita Nesporov on 30.05.2022.
//

import UIKit

class FilmsTableViewCell: UITableViewCell {

    @IBOutlet weak var moviesCollectionView: UICollectionView!

    lazy var catalogVC: CatalogViewController = CatalogViewController()

    override func awakeFromNib() {
        super.awakeFromNib()

        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        setupCollectionViewUI()
        catalogVC.loadMovies {
            DispatchQueue.main.async {
                self.moviesCollectionView.reloadData()
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCollectionViewUI(){

        self.moviesCollectionView.register(UINib(nibName: Constants.movieCollectionCell, bundle: nil),forCellWithReuseIdentifier: Constants.movieCollectionCellID)
        moviesCollectionView.reloadData()
    }
}


extension FilmsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        catalogVC.movies?.results.count ?? 1

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let currentMovie = catalogVC.movies?.results[indexPath.row]

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.movieCollectionCellID,for: indexPath) as? MovieCollectionViewCell else {

            return UICollectionViewCell()
        }

        cell.configureWith(movieName: currentMovie?.title, profilePath:                 currentMovie?.poster_path, releaseDate: currentMovie?.release_date)

        return cell
    }
}
extension FilmsTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 135, height: 270)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
