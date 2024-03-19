//
//  DataManager.swift
//  Instagram
//
//  Created by 정다운 on 2024/03/11.
//

import Foundation
import UIKit


class DataManager {
    
    private var storyUserArray: [MainStoryData] = []
    private var feedUserArray: [MainFeedData] = []
    
    func makeStoryUserData() {
        storyUserArray = [
            MainStoryData(profileImage: UIImage(named: "user1"), circleImage: UIImage(named: "circleIcon")!, nickName: "Your Story", liveStatus: false),
            MainStoryData(profileImage: UIImage(named: "user2"), circleImage: UIImage(named: "circleIcon")!, nickName: "Karennne", liveStatus: true),
            MainStoryData(profileImage: UIImage(named: "user3"), circleImage: UIImage(named: "circleIcon")!, nickName: "zackjohn", liveStatus: false),
            MainStoryData(profileImage: UIImage(named: "user4"), circleImage: UIImage(named: "circleIcon")!, nickName: "kieron_d", liveStatus: false),
            MainStoryData(profileImage: UIImage(named: "user5"), circleImage: UIImage(named: "circleIcon")!, nickName: "craig_tt", liveStatus: false),
            MainStoryData(profileImage: UIImage(named: "user6"), circleImage: UIImage(named: "circleIcon")!, nickName: "iii8970", liveStatus: false),
            MainStoryData(profileImage: UIImage(named: "user1"), circleImage: UIImage(named: "circleIcon")!, nickName: "Your Story", liveStatus: false),
            MainStoryData(profileImage: UIImage(named: "user2"), circleImage: UIImage(named: "circleIcon")!, nickName: "Karennne", liveStatus: true),
            MainStoryData(profileImage: UIImage(named: "user3"), circleImage: UIImage(named: "circleIcon")!, nickName: "zackjohn", liveStatus: false),
            MainStoryData(profileImage: UIImage(named: "user4"), circleImage: UIImage(named: "circleIcon")!, nickName: "kieron_d", liveStatus: false),
            MainStoryData(profileImage: UIImage(named: "user5"), circleImage: UIImage(named: "circleIcon")!, nickName: "craig_tt", liveStatus: false),
            MainStoryData(profileImage: UIImage(named: "user6"), circleImage: UIImage(named: "circleIcon")!, nickName: "iii8970", liveStatus: false)
        ]
    }
    
    
    func makeFeedUserData() {
        feedUserArray = [
            MainFeedData(userProfileImage: UIImage(named: "feed_profile1"), userNickname: "testuser1", location: "Tokyo, Japan", feedImage: [UIImage(named: "p1"), UIImage(named: "p2"), UIImage(named: "p3")], likeStatus: false, likeCount: 7, likedBy: [nil], content: "The game in Japan was amazing and i want to share some photos", coment: [nil]),
            MainFeedData(userProfileImage: UIImage(named: "feed_profile1"), userNickname: "testuser1", location: "Tokyo, Japan", feedImage: [UIImage(named: "p3")], likeStatus: false, likeCount: 7, likedBy: [nil], content: "The game in Japan was amazing and i want to share some photos", coment: [nil]),
            MainFeedData(userProfileImage: UIImage(named: "feed_profile1"), userNickname: "testuser1", location: "Tokyo, Japan", feedImage: [UIImage(named: "p2")], likeStatus: false, likeCount: 7, likedBy: [nil], content: "The game in Japan was amazing and i want to share some photos", coment: [nil])
        ]
    }
    
    
    
    func getStoryUserData() -> [MainStoryData] {
        return storyUserArray
    }
    
    func getFeedUserData() -> [MainFeedData] {
        return feedUserArray
    }
    
    
}
