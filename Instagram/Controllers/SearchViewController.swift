//
//  SearchViewController.swift
//  Instagram
//
//  Created by 정다운 on 2024/03/10.
//

import UIKit

final class SearchViewController: UIViewController {
    
    private let searchView = SearchView()
    
    override func loadView() {
        view = searchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
    }
    
    
    //네비게이션 바 코드로 설정
    func setupNavigationBar() {
        
        // (네비게이션바 설정관련)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
}
