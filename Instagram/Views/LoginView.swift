//
//  LoginView.swift
//  Instagram
//
//  Created by 정다운 on 2024/03/09.
//

import UIKit

final class LoginView: UIView {
    
    
    
    //MARK: - 속성
    //로고 이미지
    let LogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Instagram Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    //아이디, 이메일 텍스트필드
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .emailAddress
        tf.backgroundColor = UIColor(hexCode: "FAFAFA")
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.borderStyle = .roundedRect
        tf.font = UIFont(name: "Pretendard-Light", size: 14)
        tf.placeholder = "이메일 또는 전화번호를 입력하세요"
        tf.addLeftPadding()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    //비밀번호 텍스트필드
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor(hexCode: "FAFAFA")
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.borderStyle = .roundedRect
        tf.font = UIFont(name: "Pretendard-Light", size: 14)
        tf.placeholder = "비밀번호를 입력하세요"
        tf.addLeftPadding()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    //텍스트필드 스택뷰
    lazy var textFieldStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        sv.axis = .vertical
        sv.spacing = 12
        sv.distribution = .fill
        sv.alignment = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    //비밀번호를 잊으셨나요? 레이블
    private let forgotPassword: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitle("Forgot password?", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 12)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor(hexCode: "3797EF"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //로그인 버튼
    let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hexCode: "3797EF")
        button.alpha = 0.5
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 14)
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = true   //⭐️ 실행할때 false 로 
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //페이스북 로그인버튼
    let facebookLogin: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "facebookIcon"), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 14)
        button.setTitle("   Log in with Facebook", for: .normal)
        button.setTitleColor(UIColor(hexCode: "3797EF"), for: .normal)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //or 이미지
    let orImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Seperator OR")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //sign up 텍스트
    let signUpLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.textColor = UIColor(hexCode: "999999")
        label.text = "Don't have an account? Sign up."
        label.asColor(targetString: "Sign up.", color: UIColor(hexCode: "3797EF"))
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //하단 라인
    let grayLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hexCode: "999999")
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    
    //하단 스택뷰
    lazy var bottomStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [orImageVIew, signUpLabel, grayLine])
        st.axis = .vertical
        st.spacing = 61
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    //하단 인스타그램 페이스북
    private let bottomTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram ot Facebook"
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-Light", size: 12)
        label.textColor = UIColor(hexCode: "999999")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    lazy var LogoImageViewTopConstraint = LogoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 149)


    //MARK: - 생성자
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupView()
        setupNotification()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    //MARK: - 메서드
    
    func setupView() {
        self.addSubview(LogoImageView)
        self.addSubview(textFieldStackView)
        self.addSubview(forgotPassword)
        self.addSubview(loginButton)
        self.addSubview(facebookLogin)
        self.addSubview(orImageVIew)
        self.addSubview(bottomStackView)
        self.addSubview(bottomTextLabel)
        
    }
    
    //노티피케이션 셋팅
    func setupNotification() {
        
        //키보드가 올라갈때 관찰후 알림
        NotificationCenter.default.addObserver(self, selector: #selector(moveUpAction), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        //키보드가 내려갈때 관찰후 알림
        NotificationCenter.default.addObserver(self, selector: #selector(moveDownAction), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    

    
    
    
    //MARK: - 오토레이아웃 설정
    override func updateConstraints() {
        setConstraint()
        super.updateConstraints()
    }
    
    
    func setConstraint() {
        
        NSLayoutConstraint.activate([
            LogoImageViewTopConstraint,
            LogoImageView.heightAnchor.constraint(equalToConstant: 49),
            LogoImageView.widthAnchor.constraint(equalToConstant: 182),
            LogoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 96.5),
            LogoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -96.5)
        
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            textFieldStackView.heightAnchor.constraint(equalToConstant: 100),
            textFieldStackView.topAnchor.constraint(equalTo: LogoImageView.bottomAnchor, constant: 61),
            textFieldStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textFieldStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        ])
        
        NSLayoutConstraint.activate([
            forgotPassword.heightAnchor.constraint(equalToConstant: 14),
            forgotPassword.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 19),
            forgotPassword.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 237),
            forgotPassword.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            loginButton.topAnchor.constraint(equalTo: forgotPassword.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            facebookLogin.heightAnchor.constraint(equalToConstant: 18),
            facebookLogin.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 37),
            facebookLogin.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor, constant: 87),
            facebookLogin.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor, constant: -87)
            
        ])
        
        NSLayoutConstraint.activate([
            bottomTextLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30.5),
            bottomTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            bottomTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -124)
        ])
        
        NSLayoutConstraint.activate([
            grayLine.heightAnchor.constraint(equalToConstant: 0.2),
            grayLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            grayLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            bottomStackView.bottomAnchor.constraint(equalTo: bottomTextLabel.topAnchor, constant: -32.5),
            bottomStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            orImageVIew.heightAnchor.constraint(equalToConstant: 14),
            orImageVIew.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            orImageVIew.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
        
    }
    
    
    
    //MARK: - objc
    
    @objc func moveUpAction(_ sender: Notification) {
        
        LogoImageViewTopConstraint.constant = 100
        // 실제 레이아웃 변경은 애니메이션으로 줄꺼야
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    @objc func moveDownAction() {
        
        LogoImageViewTopConstraint.constant = 149
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    //메모리에서 내려갈때
    deinit {
        //위에서 등록한 노티피케이션을 없애는 것
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    
    
}
