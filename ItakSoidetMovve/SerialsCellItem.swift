//
//  SerialsCellItem.swift
//  ItakSoidetMovve
//
//  Created by Сергей Шевелев on 01.06.2022.
//

import UIKit
import SDWebImage

class SerialsCellItem: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.setupCell()

    }
    override func layoutSubviews() {
        super.layoutSubviews()


        self.cellImageView.layer.cornerRadius = 16

    }

    func configureWith(movieName: String?, profilePath: String?) {
        self.titleLabel.text = movieName
        self.loadImage(profilePath: profilePath)
        self.setupCell()
    }
    private func setupCell() {
        self.cellImageView.contentMode = .scaleToFill
        titleLabel.textColor = .systemGray
        titleLabel.font = .boldSystemFont(ofSize: 13)
    }

    private func loadImage(profilePath: String?) {

        guard let profilePath = profilePath else {
            return
        }
        let imageURL = URL(string: Constants.NetWork.defaultImagePath + profilePath)
        self.cellImageView.sd_setImage(with: imageURL, completed: nil)
    }
}
