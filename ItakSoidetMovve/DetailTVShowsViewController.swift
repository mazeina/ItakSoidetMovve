//
//  DetailTVShowsViewController.swift
//  ItakSoidetMovve
//
//  Created by admin on 02.06.2022.
//

import Foundation
import UIKit

class DetailTVShowsViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var actorsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func goToWebVersion(_ sender: UIButton) {

    }

    @IBAction func addToWatchLaterButtonPressed(_ sender: UIBarButtonItem) {
    }

}

