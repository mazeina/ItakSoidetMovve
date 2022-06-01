//
//  SerialsTableViewCell.swift
//  ItakSoidetMovve
//
//  Created by Nikita Nesporov on 30.05.2022.
//

import UIKit

class SerialsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var serialsViewCollection: UICollectionView!
    
    var serials: ResponseTV? = nil
    let networkManager = NetworkManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()

        serialsViewCollection.dataSource = self
        serialsViewCollection.delegate = self
        setupCollectionViewUI()
        loadMovies {
            DispatchQueue.main.async {
                self.serialsViewCollection.reloadData()
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func loadMovies(completion: @escaping(() -> ())) {
        networkManager.getDiscoverTV(completion: { serials in

            self.serials = serials
            completion()
        })
    }

    func setupCollectionViewUI(){

        self.serialsViewCollection.register(UINib(nibName: Constants.serialCollectionCell, bundle: nil),forCellWithReuseIdentifier: Constants.serialCollectionCellID)
        serialsViewCollection.reloadData()
    }
}


extension SerialsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        serials?.results.count ?? 1

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let currentTV = serials?.results[indexPath.row]

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.serialCollectionCellID,for: indexPath) as? SerialsCellItem else {

            return UICollectionViewCell()
        }

        cell.configureWith(movieName: currentTV?.name, profilePath: currentTV?.posterPath)

        return cell
    }
}
extension SerialsTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 250)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
