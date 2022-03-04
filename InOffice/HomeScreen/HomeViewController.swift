//
//  HomeViewController.swift
//  InOffice
//
//  Created by Luka Muše on 24.02.2022..
//

import UIKit


class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    private var shouldResize: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViews()
        setupBackground()
        view.backgroundColor = .white
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showImage(false)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showImage(true)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let shouldResize = shouldResize
        else { assertionFailure("shouldResize wasn't set. reason could be non-handled device orientation state"); return }

        if shouldResize {
            moveAndResizeImageForPortrait()
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let shouldResize = shouldResize
        else { assertionFailure("shouldResize wasn't set. reason could be non-handled device orientation state"); return }

        if shouldResize {
            moveAndResizeImageForPortrait()
        }
    }

    private var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "user"))
        //let tapImage = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapImage:)))
        //image.isUserInteractionEnabled = true
        //image.addGestureRecognizer(tapImage)
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

    func setupViews() {
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
        title = "Name"

        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        imageView.layer.cornerRadius = Const.ImageSizeForLargeState / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor,
                                             constant: -Const.ImageRightMargin),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,
                                              constant: -Const.ImageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    /*
     @objc func imageTapped(tapImage: UITapGestureRecognizer) {
     
     let tappedImage = tapImage.view as! UIImageView
     
     //let viewModel = ProfileDetailsViewModel(user: user)
     let profileDetailsVC = ProfileDetailsViewController(viewModel: viewModel)
     profileDetailsVC.modalPresentationStyle = .pageSheet
     navigationController?.pushViewController(profileDetailsVC, animated: true) */

    private func moveAndResizeImageForPortrait() {
        guard let height = navigationController?.navigationBar.frame.height else { return }

        let coeff: CGFloat = {
            let delta = height - Const.NavBarHeightSmallState
            let heightDifferenceBetweenStates = (Const.NavBarHeightLargeState - Const.NavBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }()

        let factor = Const.ImageSizeForSmallState / Const.ImageSizeForLargeState

        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()

        let sizeDiff = Const.ImageSizeForLargeState * (1.0 - factor)

        let yTranslation: CGFloat = {
            let maxYTranslation = Const.ImageBottomMarginForLargeState - Const.ImageBottomMarginForSmallState + sizeDiff
            return max(0, min(maxYTranslation, (maxYTranslation - coeff * (Const.ImageBottomMarginForSmallState + sizeDiff))))
        }()

        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)

        imageView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }

    private func resizeImageForLandscape() {
        let yTranslation = Const.ImageSizeForLargeState * Const.ScaleForImageSizeForLandscape
        imageView.transform = CGAffineTransform.identity
            .scaledBy(x: Const.ScaleForImageSizeForLandscape, y: Const.ScaleForImageSizeForLandscape)
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

        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfficeCollectionViewCell.identifier, for: indexPath)
            return cell
        }
        else if indexPath.section == 1 {
            
            if indexPath.item == 0 {

                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LunchStatisticsCollectionViewCell.identifier, for: indexPath)
                return cell
            }
            else {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeskReservationsCollectionViewCell.identifier, for: indexPath)
                return cell
            }
        }
        else if indexPath.section == 2 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeskCollectionViewCell.identifier, for: indexPath)
            return cell
        }
        else if indexPath.section == 3 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LunchCollectionViewCell.identifier, for: indexPath)
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }

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
        static let ImageSizeForLargeState: CGFloat = 40
        static let ImageRightMargin: CGFloat = 16
        static let ImageBottomMarginForLargeState: CGFloat = 12
        static let ImageBottomMarginForSmallState: CGFloat = 6
        static let ImageSizeForSmallState: CGFloat = 32
        static let NavBarHeightSmallState: CGFloat = 44
        static let NavBarHeightLargeState: CGFloat = 96.5
        static let ScaleForImageSizeForLandscape: CGFloat = 0.65
    }
}
