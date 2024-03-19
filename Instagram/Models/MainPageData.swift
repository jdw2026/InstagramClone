//
//  MainStoryUser.swift
//  Instagram
//
//  Created by 정다운 on 2024/03/11.
//

import Foundation
import UIKit


struct MainStoryData: Equatable {

    let profileImage: UIImage?
    let circleImage: UIImage
    let nickName: String
    let liveStatus: Bool
}


struct MainFeedData: Equatable {
    let userProfileImage: UIImage?
    let userNickname: String
    let location: String
    let feedImage: [UIImage?]
    let likeStatus: Bool
    let likeCount: Int
    let likedBy: [LikedBy?]
    let content: String
    let coment: [String?]
    
    
}

struct LikedBy: Equatable {
    let userNickname: String
}
