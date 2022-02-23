//
//  HomeViewController.swift
//  InOffice
//
//  Created by Luka Muše on 14.02.2022..
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var shouldResize: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupUI()
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
                else { print("shouldResize wasn't set. reason could be non-handled device orientation state"); return }

            if shouldResize {
                moveAndResizeImageForPortrait()
            }
        }


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let shouldResize = shouldResize
        else { print("Cant"); return }
        
        if shouldResize {
            moveAndResizeImageForPortrait()
        }
    }
    
    
    
    
    private let imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "user"))
        image.layer.cornerRadius = Const.ImageSizeForLargeState / 2
        image.clipsToBounds = true
        return image
    }()
    
    func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .red
        
        title = "Ime i prezime"
        
        // Initial setup for image for Large NavBar state since the the screen always has Large NavBar once it gets opened
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        imageView.layer.cornerRadius = 40 / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
         imageView.leftAnchor.constraint(equalTo: navigationBar.leftAnchor, constant: Const.ImageLeftMargin),
         imageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
         imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
         imageView.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 30),
         ])
          
        
    }
    
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

            // Value of difference between icons for large and small states
            let sizeDiff = Const.ImageSizeForLargeState * (1.0 - factor) // 8.0
            
            let yTranslation: CGFloat = {
                /// This value = 14. It equals to difference of 12 and 6 (bottom margin for large and small states). Also it adds 8.0 (size difference when the image gets smaller size)
                let maxYTranslation = Const.ImageBottomMarginForLargeState - Const.ImageBottomMarginForSmallState + sizeDiff
                return max(0, min(maxYTranslation, (maxYTranslation - coeff * (Const.ImageBottomMarginForSmallState + sizeDiff))))
            }()
                
            let xTranslation = max(0, sizeDiff - coeff * sizeDiff)
            
            imageView.transform = CGAffineTransform.identity
                .scaledBy(x: scale, y: scale)
                .translatedBy(x: xTranslation, y: yTranslation)
        }

        
        /// Show or hide the image from NavBar while going to next screen or back to initial screen
        ///
        /// - Parameter show: show or hide the image from NavBar
        private func showImage(_ show: Bool) {
            UIView.animate(withDuration: 0.2) {
                self.imageView.alpha = show ? 1.0 : 0.0
            }
        }

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.frame = view.bounds
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        collectionView.register(OfficeCollectionViewCell.self, forCellWithReuseIdentifier: OfficeCollectionViewCell.identifier)
        view.addSubview(collectionView)
        return collectionView
    }()

    func setupViews() {
        view.addSubview(collectionView)
    }

}
extension HomeViewController {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return 2
        }
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfficeCollectionViewCell.identifier, for: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: view.frame.width / 2.8, height: view.frame.width / 2.6)
        }
        return CGSize(width: view.frame.width / 1.11, height: view.frame.width / 3)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets(top: 20, left: 25, bottom: 20, right: 25)
        }
        return UIEdgeInsets(top: 90, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("ovo je \(indexPath.row )")
    }
}
extension HomeViewController {
    private struct Const {
            /// Image height/width for Large NavBar state
            static let ImageSizeForLargeState: CGFloat = 40
            /// Margin from right anchor of safe area to right anchor of Image
            static let ImageLeftMargin: CGFloat = 16
            /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
            static let ImageBottomMarginForLargeState: CGFloat = 12
            /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
            static let ImageBottomMarginForSmallState: CGFloat = 6
            /// Image height/width for Small NavBar state
            static let ImageSizeForSmallState: CGFloat = 32
            /// Height of NavBar for Small state. Usually it's just 44
            static let NavBarHeightSmallState: CGFloat = 44
            /// Height of NavBar for Large state. Usually it's just 96.5 but if you have a custom font for the title, please make sure to edit this value since it changes the height for Large navb
            static let NavBarHeightLargeState: CGFloat = 96.5
            /// Image height/width for Landscape state
            static let ScaleForImageSizeForLandscape: CGFloat = 0.65
        }
}
