//
//  MainTableViewCell.swift
//  Instagram
//
//  Created by 정다운 on 2024/03/12.
//

import UIKit

final class MainStoryTableViewCell: UITableViewCell {
    
    static let id = "MainStoryTableViewCell"
    static let cellHeight: CGFloat = 98
    
    var items: [MainStoryData] = []
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.itemSize = .init(width: 75, height: cellHeight)
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
      view.register(MainStoryCollectionViewCell.self, forCellWithReuseIdentifier: MainStoryCollectionViewCell.id)
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setConstraint() {
        self.contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0)
        ])
        
    }
    
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        self.prepare(items: [])
//    }
//
//
//    func prepare(items: [MainStoryData]) {
//        self.items = items
//    }

    
    
    

}


extension MainStoryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainStoryCollectionViewCell.id, for: indexPath) as! MainStoryCollectionViewCell
        
        cell.circleImageView.image = items[indexPath.row].circleImage
        cell.profileImageView.image = items[indexPath.row].profileImage
        cell.userNicknameLabel.text = items[indexPath.row].nickName
        
        
        return cell
    }
    
    
    
}
