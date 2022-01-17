//
//  ViewController.swift
//  InOffice
//
//  Created by Luka Muše on 22.11.2021..
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {

    var viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self

        let color = UIColor(named: "background")
        view.backgroundColor = color
        setupViews()
        setupConstraints()
    }

    @objc func onClickLoginButton(sender: AnyObject) {

        guard let email = mailTextField.text, let password = passTextField.text else { return }
        viewModel.sendValue(email: email, password: password)
        let FrontPageVC = FrontPageViewController()
        let navVC = UINavigationController(rootViewController: FrontPageVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }

    private let loginContentView: UIView = {
      let view = UIView()
      view.backgroundColor = .white
      view.layer.cornerRadius = 15
      return view
    }()

    private let registerContentView: UIView = {
       let register = UIView()
        register.backgroundColor = .white
        register.layer.cornerRadius = 15
        return register
    }()

    private let mailTextField: UITextField = {
        let txtField = UITextField()
        txtField.backgroundColor = .white
        txtField.layer.cornerRadius = 7
        txtField.placeholder = "Email"
        txtField.borderStyle = .roundedRect
        return txtField
    }()

    private let passTextField: UITextField = {
        let txtField = UITextField()
        txtField.placeholder = "Password"
        txtField.layer.cornerRadius = 7
        txtField.borderStyle = .roundedRect
        return txtField
    }()

    private lazy var btnLogin: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .black
        btn.setTitle("Login", for: .normal)
        btn.layer.cornerRadius = 7
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(onClickLoginButton), for: .touchUpInside)
        return btn
    }()

    private let titleregister: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.text = "Register"
        return label
      }()

    private let textLabel: UILabel = {
        let textl = UILabel()
        textl.text = "I dont have an account?"
        textl.textColor = .gray
        return textl
    }()

    private let titleLabel: UILabel = {
        let text2 = UILabel()
        text2.text = "I forget password?"
        text2.textColor = .darkGray
        return text2
    }()

    private lazy var btnLoginMicr: UIButton = {
        let btn = UIButton(type: .system)
        btn.layer.cornerRadius = 7
        btn.backgroundColor = .systemBlue
        btn.setTitle("Register by Microsoft", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(onClickLoginButton), for: .touchUpInside)
        return btn
    }()

    private func setupViews() {
        view.addSubview(loginContentView)
        view.addSubview(mailTextField)
        view.addSubview(passTextField)
        view.addSubview(mailTextField)
        view.addSubview(btnLogin)
        view.addSubview(registerContentView)
        view.addSubview(textLabel)
        view.addSubview(titleLabel)
        view.addSubview(titleregister)
        view.addSubview(btnLoginMicr)
    }
    private func setupConstraints() {
        loginContentView.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(35)
            make.trailing.equalTo(view).offset(-35)
            make.height.equalTo(view.safeAreaLayoutGuide).offset(-400)
            make.centerY.equalTo(view)
        }

        mailTextField.snp.makeConstraints { make in
            make.top.equalTo(loginContentView).offset(60)
            make.leading.equalTo(loginContentView).offset(30)
            make.trailing.equalTo(loginContentView).offset(-30)
            make.height.equalTo(40)
        }

        passTextField.snp.makeConstraints { make in
            make.top.equalTo(mailTextField).offset(60)
            make.leading.equalTo(loginContentView).offset(30)
            make.trailing.equalTo(loginContentView).offset(-30)
            make.height.equalTo(40)
        }

        btnLogin.snp.makeConstraints { make in
            make.top.equalTo(passTextField).offset(90)
            make.leading.equalTo(loginContentView).offset(30)
            make.trailing.equalTo(loginContentView).offset(-30)
            make.height.equalTo(40)
        }

        registerContentView.snp.makeConstraints { make in
            make.bottom.equalTo(view)
            make.height.equalTo(loginContentView).offset(-270)
            make.leading.equalTo(view).offset(30)
            make.trailing.equalTo(view).offset(-30)
        }

        textLabel.snp.makeConstraints { make in
            make.centerY.equalTo(registerContentView)
            make.centerX.equalTo(registerContentView).offset(-30)
        }

        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(loginContentView).offset(50)
            make.centerX.equalTo(view)
        }

        titleregister.snp.makeConstraints { make in
            make.leading.equalTo(textLabel.snp.trailing).offset(5)
            make.centerY.equalTo(textLabel.snp.centerY)
        }

        btnLoginMicr.snp.makeConstraints { make in
            make.top.equalTo(btnLogin).offset(60)
            make.leading.equalTo(loginContentView).offset(30)
            make.trailing.equalTo(loginContentView).offset(-30)
            make.height.equalTo(40)
        }
    }
}

extension UIViewController {
      func openAlert(title: String?, message: String?, actionTitles: [String?], actionStyle: [UIAlertAction.Style], actions: [((UIAlertAction) -> Void)?]) {
             let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
             for (index, title) in actionTitles.enumerated() {
                  let action = UIAlertAction(title: title, style: actionStyle[index], handler: actions[index])
                  alert.addAction(action)
             }
          self.present(alert, animated: true)
        }
   }

extension ViewController: LoginViewModelDelegate {
    func showError(_ error: Error, _ message: String) {
        openAlert(title: "Pogreska", message: message, actionTitles: ["U redu"], actionStyle: [.default], actions: [nil])
    }
}
