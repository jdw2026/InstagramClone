//
//  MainFeedTableViewCell.swift
//  Instagram
//
//  Created by 정다운 on 2024/03/12.
//

import UIKit

final class MainFeedTableViewCell: UITableViewCell {
    
    static let id = "MainFeedTableViewCell"
    static let cellHeight: CGFloat = 547
    
    var item: [UIImage?] = []
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let userNickNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Bold", size: 13)
        label.textColor = UIColor(hexCode: "262626")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userLocationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 11)
        label.textColor = UIColor(hexCode: "262626")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nickLocationStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [userNickNameLabel, userLocationLabel])
        st.axis = .vertical
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    let dotMenuButtonImageView: UIImageView = {
        let button = UIImageView()
        button.image = UIImage(named: "topDotIcon")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var feedTopStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [userProfileImageView, nickLocationStackView])
        st.axis = .horizontal
        st.spacing = 10
        st.alignment = .top
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = .init(width: 375, height: 375)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = true
        view.contentInset = .zero
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.register(MainFeedPhotoCollectionViewCell.self, forCellWithReuseIdentifier: MainFeedPhotoCollectionViewCell.id)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let heartImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Like")
        image.backgroundColor = .clear
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let commentImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Comment")
        image.backgroundColor = .clear
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let messangerImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Messanger")
        image.backgroundColor = .clear
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var middleStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [heartImageView, commentImageView, messangerImageView])
        st.axis = .horizontal
        st.spacing = 17
        st.distribution = .fillProportionally
        st.alignment = .top
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    
    let photoDotImageVIew: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let saveImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Save")
        image.backgroundColor = .clear
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let likeUserProfileImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 8.5
        image.clipsToBounds = true
        image.backgroundColor = .gray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let likeByLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-ExtraLight", size: 13)
        label.textColor = UIColor(hexCode: "262626")
        label.text = "likebytest  231231313143243"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var likeByStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [likeUserProfileImageView, likeByLabel])
        st.axis = .horizontal
        st.spacing = 6.5
        st.alignment = .top
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    let bottomUserNicknameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Bold", size: 13)
        label.textColor = UIColor(hexCode: "262626")
        label.text = "test11112312312321312313123123123123123123123"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: - 생성자
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    //MARK: - 메서드
    func setConstraint() {
        self.contentView.addSubview(dotMenuButtonImageView)
        self.contentView.addSubview(feedTopStackView)
        self.contentView.addSubview(collectionView)
        self.contentView.addSubview(middleStackView)
        self.contentView.addSubview(photoDotImageVIew)
        self.contentView.addSubview(saveImageView)
        self.contentView.addSubview(likeByStackView)
        self.contentView.addSubview(bottomUserNicknameLabel)
        
        NSLayoutConstraint.activate([
            feedTopStackView.heightAnchor.constraint(equalToConstant: 54),
            feedTopStackView.widthAnchor.constraint(equalToConstant: 190),
            feedTopStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            feedTopStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            
            userProfileImageView.widthAnchor.constraint(equalToConstant: 32),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 32),
            userProfileImageView.bottomAnchor.constraint(equalTo: feedTopStackView.bottomAnchor, constant: -11),
            userProfileImageView.topAnchor.constraint(equalTo: feedTopStackView.topAnchor, constant: 11),
            userProfileImageView.leadingAnchor.constraint(equalTo: feedTopStackView.leadingAnchor, constant: 10),
            
            nickLocationStackView.heightAnchor.constraint(equalToConstant: 32),
            nickLocationStackView.topAnchor.constraint(equalTo: userProfileImageView.topAnchor, constant: 0),
            nickLocationStackView.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 30),
            nickLocationStackView.bottomAnchor.constraint(equalTo: feedTopStackView.bottomAnchor, constant: -11),
            
            dotMenuButtonImageView.heightAnchor.constraint(equalToConstant: 3),
            dotMenuButtonImageView.widthAnchor.constraint(equalToConstant: 14),
            dotMenuButtonImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 25.5),
            dotMenuButtonImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 375),
            collectionView.widthAnchor.constraint(equalToConstant: 375),
            collectionView.topAnchor.constraint(equalTo: feedTopStackView.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            middleStackView.heightAnchor.constraint(equalToConstant: 48),
            middleStackView.widthAnchor.constraint(equalToConstant: 120),
            middleStackView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0),
            middleStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            
            heartImageView.heightAnchor.constraint(equalToConstant: 20.58),
            heartImageView.widthAnchor.constraint(equalToConstant: 23.66),
            heartImageView.topAnchor.constraint(equalTo: middleStackView.topAnchor, constant: 13.5),
            heartImageView.leadingAnchor.constraint(equalTo: middleStackView.leadingAnchor, constant: 14),
            
            commentImageView.widthAnchor.constraint(equalToConstant: 22),
            commentImageView.topAnchor.constraint(equalTo: heartImageView.topAnchor, constant: 0),
            commentImageView.leadingAnchor.constraint(equalTo: heartImageView.trailingAnchor, constant: 17.34),
            commentImageView.bottomAnchor.constraint(equalTo: heartImageView.bottomAnchor, constant: 1.5),
            
            messangerImageView.widthAnchor.constraint(equalToConstant: 22.73),
            messangerImageView.topAnchor.constraint(equalTo: commentImageView.topAnchor, constant: 0),
            messangerImageView.leadingAnchor.constraint(equalTo: commentImageView.trailingAnchor, constant: 17.5),
            messangerImageView.bottomAnchor.constraint(equalTo: commentImageView.bottomAnchor, constant: -2.33),
            
            photoDotImageVIew.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            photoDotImageVIew.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            
            saveImageView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 12.68),
            saveImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15.64),
            saveImageView.heightAnchor.constraint(equalToConstant: 23.15),
            saveImageView.widthAnchor.constraint(equalToConstant: 20.5)
        ])
        
        NSLayoutConstraint.activate([
            likeByStackView.topAnchor.constraint(equalTo: middleStackView.bottomAnchor, constant: 0),
            likeByStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            likeByStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            likeByStackView.heightAnchor.constraint(equalToConstant: 23),
            
            likeUserProfileImageView.widthAnchor.constraint(equalToConstant: 17),
            likeUserProfileImageView.topAnchor.constraint(equalTo: likeByStackView.topAnchor, constant: 2),
            likeUserProfileImageView.bottomAnchor.constraint(equalTo: likeByStackView.bottomAnchor, constant: -4),
            likeUserProfileImageView.leadingAnchor.constraint(equalTo: likeByStackView.leadingAnchor, constant: 15.5),
            
            likeByLabel.topAnchor.constraint(equalTo: likeUserProfileImageView.topAnchor, constant: 0),
            likeByLabel.leadingAnchor.constraint(equalTo: likeUserProfileImageView.trailingAnchor, constant: 6.5)
        ])
        
        NSLayoutConstraint.activate([
            bottomUserNicknameLabel.topAnchor.constraint(equalTo: likeByStackView.bottomAnchor, constant: 0),
            bottomUserNicknameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            bottomUserNicknameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
        
    }
    
    
    
}




extension MainFeedTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainFeedPhotoCollectionViewCell.id, for: indexPath) as! MainFeedPhotoCollectionViewCell
        
        cell.feedPhotoImageView.image = item[indexPath.row]
        return cell
        
    }
    
    
    
    
    
}
