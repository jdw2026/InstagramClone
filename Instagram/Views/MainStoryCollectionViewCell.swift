//
//  MainStoryCollectionViewCell.swift
//  Instagram
//
//  Created by 정다운 on 2024/03/12.
//

import UIKit

final class MainStoryCollectionViewCell: UICollectionViewCell {
    
    static let id = "MainStoryCollectionViewCell"
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 28
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    lazy var circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(profileImageView)
        return imageView
    }()
    
    let userNicknameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        label.textColor = UIColor(hexCode: "262626")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: - 생성자
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpView() {
        self.addSubview(circleImageView)
        self.addSubview(userNicknameLabel)
    }
    
    func setConstraint() {
        
        NSLayoutConstraint.activate([
            circleImageView.heightAnchor.constraint(equalToConstant: 65),
            circleImageView.widthAnchor.constraint(equalToConstant: 65),
            circleImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            circleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            circleImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
        ])
        
        NSLayoutConstraint.activate([
            userNicknameLabel.topAnchor.constraint(equalTo: circleImageView.bottomAnchor, constant: 5),
            userNicknameLabel.leadingAnchor.constraint(equalTo: circleImageView.leadingAnchor, constant: 1.5),
            userNicknameLabel.trailingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: -1.5)
        ])
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: circleImageView.topAnchor, constant: 5),
            profileImageView.leadingAnchor.constraint(equalTo: circleImageView.leadingAnchor, constant: 5),
            profileImageView.trailingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: -5),
            profileImageView.bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor, constant: -5)
        
        ])
    }
    
    
}
