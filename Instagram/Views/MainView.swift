//
//  MainView.swift
//  Instagram
//
//  Created by 정다운 on 2024/03/10.
//

import UIKit

final class MainView: UIView {

    var mainStoryData: [MainStoryData] = []
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.allowsSelection = false
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.bounces = true
        view.showsVerticalScrollIndicator = true
        view.contentInset = .zero
        view.register(MainStoryTableViewCell.self, forCellReuseIdentifier: MainStoryTableViewCell.id)
        view.register(MainFeedTableViewCell.self, forCellReuseIdentifier: MainFeedTableViewCell.id)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    
    //MARK: - 생성자
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        self.addSubview(tableView)
    }
    
    
    
    //MARK: - 오토레이아웃
    override func updateConstraints() {
        setConstraint()
        super.updateConstraints()
    }
    
 
    func setConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        ])
    }
    
    
    
}
