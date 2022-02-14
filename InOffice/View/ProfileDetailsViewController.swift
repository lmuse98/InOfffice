//
//  ProfileDetailsViewController.swift
//  InOffice
//
//  Created by Luka Muše on 15.12.2021..
//

import UIKit

class ProfileDetailsViewController: UIViewController {

    var viewModel: ProfileDetailsViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        //setupBackground()
        self.title = "Profile"
        setupViews()
        setupConstraints()
        viewModel.delegate = self
        viewModel.loaded()
    }

    init(viewModel: ProfileDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: CGRect(x: 10, y: 10, width: view.frame.size.width-20, height: view.frame.size.height-20))
        scroll.contentSize = CGSize(width: view.frame.size.width, height: 2200)
        scroll.backgroundColor = .green
        return scroll
    }()

    private lazy var tableView: UITableView = {
       let table = UITableView()
       return table
    }()

    private lazy var faceIconView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "facebook")
        return imgView
    }()

    private lazy var instaIconView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "instagram")
        return imgView
    }()

    private lazy var linkIconView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "linkedin")
        return imgView
    }()

    private lazy var gitIconView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "github")
        return imgView
    }()

    private lazy var phoneIconView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "phone")
        return imgView
    }()

    private lazy var mailIconView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "mail")
        return imgView
    }()

    private lazy var slackIconView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "slack")
        return imgView
    }()

    private lazy var avatar: UIImageView = {
        let image = UIImageView()
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.layer.cornerRadius = 60
        image.clipsToBounds = true
        return image
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        return label
    }()

    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Personal", "Social"])
        control.selectedSegmentIndex = 0
        control.layer.borderColor = UIColor.gray.cgColor
        control.tintColor = .gray
        control.addTarget(self, action: #selector(handleSegmentedControl(_:)), for: .valueChanged)
        return control
    }()

    private lazy var upperView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemFill
        view.layer.cornerRadius = 30
        return view
    }()

    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.backgroundColor = .systemFill
        stack.layer.cornerRadius = 20
        return stack
    }()

    private lazy var stackView2: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.backgroundColor = .systemPink
        stack.layer.cornerRadius = 20
        return stack
    }()

    @objc private func handleSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            stackView.isHidden = true
            stackView2.isHidden = false
        case 1:
            stackView2.isHidden = true
            stackView.isHidden = false
        default: view.addSubview(stackView2)
        }
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

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(upperView)
        scrollView.addSubview(avatar)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(segmentedControl)
        scrollView.addSubview(editButton)
        scrollView.addSubview(tableView)
        scrollView.addSubview(stackView)
        scrollView.addSubview(stackView2)
        stackView.isHidden = true
        stackView.addArrangedSubview(faceIconView)
        stackView.addArrangedSubview(instaIconView)
        stackView.addArrangedSubview(linkIconView)
        stackView.addArrangedSubview(gitIconView)
        stackView.addArrangedSubview(slackIconView)
        stackView2.addArrangedSubview(mailIconView)
        stackView2.addArrangedSubview(phoneIconView)
    }

    private func setupConstraints() {
        avatar.snp.makeConstraints { make in
            make.centerX.equalTo(upperView)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
        upperView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.height.equalTo(260)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
        }
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(upperView.snp.bottom).offset(70)
            make.width.equalTo(300)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(upperView)
            make.bottom.equalTo(avatar.snp.bottom).offset(45)
        }
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(70)
            make.trailing.equalTo(view).offset(-70)
            make.top.equalTo(segmentedControl.snp.bottom).offset(75)
            make.height.equalTo(320)
            make.centerX.equalTo(view)
        }
        stackView2.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(70)
            make.trailing.equalTo(view).offset(-70)
            make.top.equalTo(segmentedControl.snp.bottom).offset(75)
            make.height.equalTo(320)
            make.centerX.equalTo(view)
        }
    }
}

extension ProfileDetailsViewController: ProfileDetailsViewModelDelegate {
    func show(user: User?) {
        titleLabel.text = user?.name
        //avatar.image = user.photoId
    }
}
