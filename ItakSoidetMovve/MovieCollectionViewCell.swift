//
//  MovieCollectionViewCell.swift
//  ItakSoidetMovve
//
//  Created by admin on 01.06.2022.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.setupCell()

    }
    override func layoutSubviews() {
        super.layoutSubviews()


        self.cellImageView.layer.cornerRadius = 16

    }

    func configureWith(movieName: String?, profilePath: String?, releaseDate: String?) {
        self.titleLabel.text = movieName
        self.loadImage(profilePath: profilePath)
        self.releaseDateLabel.text = releaseDate
        self.setupCell()
    }
    private func setupCell() {
        self.cellImageView.contentMode = .scaleAspectFill
        titleLabel.textColor = .systemGray
        titleLabel.font = .boldSystemFont(ofSize: 13)
        releaseDateLabel.textColor = .systemGray

    }

    private func loadImage(profilePath: String?) {

        guard let profilePath = profilePath else {
            return
        }
        let imageURL = URL(string: Constants.NetWork.defaultImagePath + profilePath)
        self.cellImageView.sd_setImage(with: imageURL, completed: nil)
    }

}
