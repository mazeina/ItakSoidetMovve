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
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.setupCell()

    }
    override func layoutSubviews() {
        super.layoutSubviews()

        self.cellImageView.layer.cornerRadius = 16
    }

    func configureWith(movieName: String?, profilePath: String?, date: String?) {
        self.titleLabel.text = movieName
        self.dateLabel.text = date
        self.loadImage(profilePath: profilePath)
        self.setupCell()
    }
    private func setupCell() {
        self.cellImageView.contentMode = .scaleToFill
        titleLabel.textColor = .systemGray
        titleLabel.font = .boldSystemFont(ofSize: 13)
        dateLabel.textColor = .systemGray
    }

    private func loadImage(profilePath: String?) {

        guard let profilePath = profilePath else {
            return
        }
        let imageURL = URL(string: Constants.NetWork.defaultImagePath + profilePath)
        self.cellImageView.sd_setImage(with: imageURL, completed: nil)
    }
}
