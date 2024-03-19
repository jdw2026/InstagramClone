//
//  MainFeedPhotoCollectionViewCell.swift
//  Instagram
//
//  Created by 정다운 on 2024/03/13.
//

import UIKit

final class MainFeedPhotoCollectionViewCell: UICollectionViewCell {
    
    static let id = "MainFeedPhotoCollectionViewCell"
    
    let feedPhotoImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .yellow
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    
    
    //MARK: - 생성자
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - 메서드
    func setUpConstraints() {
        self.addSubview(feedPhotoImageView)
        
        NSLayoutConstraint.activate([
            feedPhotoImageView.heightAnchor.constraint(equalToConstant: 375),
            feedPhotoImageView.widthAnchor.constraint(equalToConstant: 375),
            feedPhotoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            feedPhotoImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            feedPhotoImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            feedPhotoImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0)
        ])
        
    }
    
    
}
