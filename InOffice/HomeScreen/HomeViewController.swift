//
//  HomeViewController.swift
//  InOffice
//
//  Created by Luka Muše on 24.02.2022..
//

import UIKit
import UniformTypeIdentifiers



class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    enum Section: Int {
        case comingToOffice
        case statisticsLunch
        case statisticsReservationDesk
        case deskReservation
        case lunch
    }

    private var shouldResize: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViews()
        setupBackground()
        view.backgroundColor = .white
    }

    private var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "user"))
        //ToDo: Create an action for image
        return image
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(LunchCollectionViewCell.self, forCellWithReuseIdentifier: LunchCollectionViewCell.identifier)
        collectionView.register(OfficeCollectionViewCell.self, forCellWithReuseIdentifier: OfficeCollectionViewCell.identifier)
        collectionView.register(DeskCollectionViewCell.self, forCellWithReuseIdentifier: DeskCollectionViewCell.identifier)
        collectionView.register(LunchStatisticsCollectionViewCell.self, forCellWithReuseIdentifier: LunchStatisticsCollectionViewCell.identifier)
        collectionView.register(DeskReservationsCollectionViewCell.self, forCellWithReuseIdentifier: DeskReservationsCollectionViewCell.identifier)
        return collectionView
    }()

    private func setupViews() {
        view.addSubview(collectionView)
    }

    private func setupBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds

        let color2 = UIColor(red: 0.88, green: 0.93, blue: 1.00, alpha: 1.00).cgColor
        let color3 = UIColor(red: 0.86, green: 0.90, blue: 1.00, alpha: 1.00).cgColor
        let color1 = UIColor(red: 1.00, green: 0.97, blue: 0.92, alpha: 1.00).cgColor

        gradientLayer.colors = [color3, color2, color1]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)

        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Name"

        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        imageView.layer.cornerRadius = Const.imageSizeForLargeState / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor,
                                             constant: -Const.imageRightMargin),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,
                                              constant: -Const.imageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: Const.imageSizeForLargeState),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }

    private func moveAndResizeImageForPortrait() {
        guard let height = navigationController?.navigationBar.frame.height else { return }

        let coeff: CGFloat = {
            let delta = height - Const.navBarHeightSmallState
            let heightDifferenceBetweenStates = (Const.navBarHeightLargeState - Const.navBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }()

        let factor = Const.imageSizeForSmallState / Const.imageSizeForLargeState

        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()

        let sizeDiff = Const.imageSizeForLargeState * (1.0 - factor)

        let yTranslation: CGFloat = {
            let maxYTranslation = Const.imageBottomMarginForLargeState - Const.imageBottomMarginForSmallState + sizeDiff
            return max(0, min(maxYTranslation, (maxYTranslation - coeff * (Const.imageBottomMarginForSmallState + sizeDiff))))
        }()

        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)

        imageView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }

    private func resizeImageForLandscape() {
        let yTranslation = Const.imageSizeForLargeState * Const.scaleForImageSizeForLandscape
        imageView.transform = CGAffineTransform.identity
            .scaledBy(x: Const.scaleForImageSizeForLandscape, y: Const.scaleForImageSizeForLandscape)
            .translatedBy(x: 0, y: yTranslation)
    }

    private func showImage(_ show: Bool) {
        UIView.animate(withDuration: 0.2) {
            self.imageView.alpha = show ? 1.0 : 0.0
        }
    }
}

extension HomeViewController {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return 2
        }
        return 1
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch Section.indexPath {
        case .comingToOffice:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfficeCollectionViewCell.identifier, for: indexPath)
            return cell
        case .statisticsReservationDesk:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeskReservationsCollectionViewCell.identifier, for: indexPath)
            return cell
        case .statisticsLunch:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LunchStatisticsCollectionViewCell.identifier, for: indexPath)
            return cell
        case .deskReservation:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeskCollectionViewCell.identifier, for: indexPath)
            return cell
        case .lunch:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LunchCollectionViewCell.identifier, for: indexPath)
            return cell
        }
        
        }
        /*
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfficeCollectionViewCell.identifier, for: indexPath)
            return cell
        } else if indexPath.section == 1 {

            if indexPath.item == 0 {

                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LunchStatisticsCollectionViewCell.identifier, for: indexPath)
                return cell
            } else {

                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeskReservationsCollectionViewCell.identifier, for: indexPath)
                return cell
            }
        } else if indexPath.section == 2 {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeskCollectionViewCell.identifier, for: indexPath)
            return cell
        } else if indexPath.section == 3 {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LunchCollectionViewCell.identifier, for: indexPath)
            return cell
        }
        else {
            return UICollectionViewCell()
        }
         */
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width / 1.11, height: view.frame.width / 2.4)
        }

        else if indexPath.section == 1 {
            return CGSize(width: view.frame.width / 2.8, height: view.frame.width / 2.6)
        }

        else if indexPath.section == 2 {
            return CGSize(width: view.frame.width / 1.11, height: view.frame.width / 2.6)
        }

        else {
            return CGSize(width: view.frame.width / 1.11, height: view.frame.width / 3.0)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        if section == 1 {
            return UIEdgeInsets(top: 20, left: 25, bottom: 20, right: 25)
        }
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("ovo je \(indexPath.section)")
    }
}
extension HomeViewController {

    private struct Const {
        static let imageSizeForLargeState: CGFloat = 40
        static let imageRightMargin: CGFloat = 16
        static let imageBottomMarginForLargeState: CGFloat = 12
        static let imageBottomMarginForSmallState: CGFloat = 6
        static let imageSizeForSmallState: CGFloat = 32
        static let navBarHeightSmallState: CGFloat = 44
        static let navBarHeightLargeState: CGFloat = 96.5
        static let scaleForImageSizeForLandscape: CGFloat = 0.65
    }
}
