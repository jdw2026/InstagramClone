//
//  ViewController.swift
//  Instagram
//
//  Created by 정다운 on 2024/03/08.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    
    
    override func loadView() {
        view = loginView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpAddTarget()
    }

    
    func setUpAddTarget() {
        loginView.emailTextField.addTarget(self, action: #selector(setUpAddTarge(_:)), for: .editingChanged)
        loginView.passwordTextField.addTarget(self, action: #selector(setUpAddTarge(_:)), for: .editingChanged)
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    
    //빈곳 클릭시 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        loginView.endEditing(true)
    }

    
    //이메일, 비밀번호 형식에 맞게 작성할 경우에만 로그인 버튼 활성화 및 색상 변경
    @objc func setUpAddTarge(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text == " "{
                textField.text = ""
                return
            }
        }
        
        if (loginView.emailTextField.isValidEmail() || loginView.emailTextField.isValidPhone()) &&
            loginView.passwordTextField.isValidPassword() {
            
            loginView.loginButton.alpha = 1
//            loginView.loginButton.isEnabled = true     ⭐️실행할때 주석 풀기
            
        } else {
            loginView.loginButton.alpha = 0.5
        }
            
    }
    
    
    //로그인 버튼 클릭시 탭바, 네비게이션 만들고 이동
    @objc func loginButtonTapped() {
        
        // 탭바컨트롤러의 생성
        let tabBarVC = UITabBarController()
        
        // 첫번째 화면은 네비게이션컨트롤러로 만들기 (기본루트뷰 설정)
        let vc1 = UINavigationController(rootViewController: MainViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: UploadViewController())
        let vc4 = UINavigationController(rootViewController: LikeViewController())
        let vc5 = UINavigationController(rootViewController: MyViewController())
        
        
        vc1.navigationBar.topItem?.titleView?.largeContentImage = UIImage(named: "mainNaviIcon")
        
        
        // 탭바로 사용하기 위한 뷰 컨트롤러들 설정
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = UIColor(hexCode: "FAFAFA")
        tabBarVC.tabBar.tintColor = UIColor(hexCode: "262626")  //아이템 선택시 컬러
        tabBarVC.tabBar.unselectedItemTintColor = UIColor(hexCode: "262626")
        tabBarVC.tabBar.layer.shadowColor = UIColor.black.cgColor

        
        if #available(iOS 15.0, *) {
//            tabBarVC.tabBar.scrollEdgeAppearance = tabBarVC.tabBar.standardAppearance
            tabBarVC.tabBar.layer.shadowColor = UIColor.black.cgColor
//            tabBarVC.tabBar.tintColor = UIColor(hexCode: "262626")
        } else {

        }

        
        // 탭바 이미지 설정 (이미지는 애플이 제공하는 것으로 사용)
        guard let items = tabBarVC.tabBar.items else { return }
        items[0].image = UIImage(named: "mainIcon")
        items[0].selectedImage = UIImage(named: "mainSelectedIcon")
        items[1].image = UIImage(named: "searchIcon")
        items[1].selectedImage = UIImage(named: "searchSelectedIcon")
        items[2].image = UIImage(named: "uploadIcon")
        items[3].image = UIImage(named: "likeIcon")
        items[3].selectedImage = UIImage(named: "likeSelectedIcon")
        items[4].image = UIImage(named: "myIcon")
        
        tabBarVC.modalTransitionStyle = .crossDissolve
        tabBarVC.modalPresentationStyle = .fullScreen

        present(tabBarVC, animated: true, completion: nil)
        
    }
    
    
    
    

}


