//
//  Extention.swift
//  Instagram
//
//  Created by 정다운 on 2024/03/09.
//

import UIKit


//MARK: - Hex Color 로 변환하기
extension UIColor {
    
    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}


//MARK: - 텍스트필드 왼쪽 여백주기
extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}



//MARK: - 특정 텍스트 컬러 변경하기
extension UILabel {
    func asColor(targetString: String, color: UIColor) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttribute(.foregroundColor, value: UIColor(hexCode: "3797EF"), range: range)
        attributedText = attributedString
    }
}


//MARK: - 정규표현식으로 (이메일, 핸드폰, 비밀번호)형식 검사
extension UITextField {
    func isValidEmail() -> Bool {
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z0-9]{2,64}"
          let emailCheck = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailCheck.evaluate(with: self.text)
    }
    
    func isValidPhone() -> Bool {
        let phoneRegEx = "^01[0-1, 7][0-9]{7,8}$"
        let pred = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        
        return pred.evaluate(with: self.text)
    }
    
    func isValidPassword() -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}"
        let pred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        
        return pred.evaluate(with: self.text)
    }
}
