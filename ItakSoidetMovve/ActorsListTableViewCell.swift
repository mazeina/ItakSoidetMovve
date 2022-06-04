//
//  ActorsListTableViewCell.swift
//  ItakSoidetMovve
//
//  Created by Nikita Nesporov on 30.05.2022.
//

import UIKit

class ActorsListTableViewCell: UICollectionViewCell {

    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var name2: UILabel!
    /**
     need collectionView
     */
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.setupCell()

    }
    override func layoutSubviews() {
        super.layoutSubviews()

        //self.imageLabel.layer.cornerRadius = 2
    }

    func configureWith(actor: ResponseCreditsMovie.Cast) {
        self.name1.text = actor.name
        self.name2.text = actor.character
        self.loadImage(profilePath: actor.profile_path)
        self.setupCell()
    }
    private func setupCell() {
        self.imageLabel.contentMode = .scaleToFill
        name1.textColor = .systemGray
        name1.font = .boldSystemFont(ofSize: 13)
        name2.textColor = .systemGray
    }

    private func loadImage(profilePath: String?) {

        guard let profilePath = profilePath else {
            return
        }
        let imageURL = URL(string: Constants.NetWork.defaultImagePath + profilePath)
        self.imageLabel.sd_setImage(with: imageURL, completed: nil)
    }
    
}
