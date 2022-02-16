//
//  HomeViewController.swift
//  InOffice
//
//  Created by Luka Muše on 19.01.2022..
//
/*
import UIKit
import SnapKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupBackground()

    }

    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()

    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .systemFill
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.layer.cornerRadius = 35
        return stack
    }()

    private lazy var horizStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()

    private lazy var lunchImgView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "lunch"))
        return image
    }()

    private lazy var officeContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()

    private lazy var lunchContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()

    private lazy var lunchResultView: UIView = {
        let result = UIView()
        result.backgroundColor = .red
        return result
    }()

    private lazy var emptyView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    func setupBackground() {
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

    private lazy var LunchContent: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.text = "Lunch for today"
        title.textColor = .black
        return title
    }()

    private func setupViews() {
        view.addSubview(mainStackView)
        mainStackView.addSubview(contentStackView)
        contentStackView.addSubview(horizStackView)
        horizStackView.addArrangedSubview(lunchResultView)
        horizStackView.addArrangedSubview(emptyView)
        contentStackView.addArrangedSubview(officeContentView)
        contentStackView.addArrangedSubview(lunchContentView)
    }

    private func setupConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.height.equalTo(view)
            make.bottom.equalTo(view)
        }
        contentStackView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(150)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.height.equalTo(600)
        }
        officeContentView.snp.makeConstraints { make in
            make.top.equalTo(contentStackView).offset(60)
            make.leading.equalTo(contentStackView).offset(27)
            make.trailing.equalTo(contentStackView).offset(-27)
            make.height.equalTo(150)
        }
        lunchContentView.snp.makeConstraints { make in
            make.top.equalTo(officeContentView.snp.bottom).offset(70)
            make.leading.equalTo(contentStackView).offset(25)
            make.trailing.equalTo(contentStackView).offset(-25)
            make.height.equalTo(110)
        }
        horizStackView.snp.makeConstraints { make in
            make.leading.equalTo(contentStackView).offset(25)
            make.trailing.equalTo(contentStackView).offset(-25)
            make.top.equalTo(officeContentView.snp.bottom).offset(20)
            make.height.equalTo(100)
        }
        lunchResultView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        emptyView.snp.makeConstraints { make in
            make.height.width.equalTo(50)
        }
    }
}
 */
