//
//  MainViewController.swift
//  Instagram
//
//  Created by 정다운 on 2024/03/10.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    let dataManager = DataManager()
    
    var mainStoryData: [MainStoryData] = []
    var mainFeedData: [MainFeedData] = []
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        
        dataManager.makeStoryUserData()
        dataManager.makeFeedUserData()
        mainStoryData = dataManager.getStoryUserData()
        mainFeedData = dataManager.getFeedUserData()
        
        setupNavigationBar()
    }
    
    
    //네비게이션 바 코드로 설정
    func setupNavigationBar() {
        
        //네비게이션 타이틀에 이미지 넣기
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 105, height: 28))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "mainNaviIcon")
        imageView.image = image
        navigationItem.titleView = imageView
        
        // (네비게이션바 설정관련)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    
}


extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    //몇개의 섹션을 만들지
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    //한개의 섹션에 몇개의 cell을 만들지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return mainFeedData.count
        }
        
    }
    
    
    //어떤셀은 보여줄지, 어떤 데이터를 담아줄지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: MainStoryTableViewCell.id, for: indexPath) as! MainStoryTableViewCell
            
            cell.items = mainStoryData
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: MainFeedTableViewCell.id, for: indexPath) as! MainFeedTableViewCell
            
            cell.userProfileImageView.image = mainFeedData[indexPath.row].userProfileImage
            cell.userNickNameLabel.text = mainFeedData[indexPath.row].userNickname
            cell.userLocationLabel.text = mainFeedData[indexPath.row].location
            cell.bottomUserNicknameLabel.text = mainFeedData[indexPath.row].userNickname
            cell.item = mainFeedData[indexPath.row].feedImage
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    //각 셀의 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return MainStoryTableViewCell.cellHeight
        case 1:
            return MainFeedTableViewCell.cellHeight
        default:
            return 0
        }
    }
    
    
    
    
}
