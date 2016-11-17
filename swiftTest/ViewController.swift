//
//  ViewController.swift
//  swiftTest
//
//  Created by ws on 16/7/25.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

struct student {
    let age : Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let str = "the sky is blue"
        
        //反转字符串
        print(reverseWords(str))
    }
    
    
    func twoSun(_ sums: [Int], target: Int) -> [Int] {
        
        var resultArr = [Int]()
        var dic = [Int: Int]()
        
        for i in 0..<sums.count{
            guard let lastIndex = dic[target - sums[i]] else{
                
                dic[sums[i]] = i
                continue
            }
            
            resultArr.append(lastIndex)
            resultArr.append(i)
            break
            
        }
        
        
        return resultArr
    }
    
    func transformStr(_ chars: inout [Character], p: Int, q: Int){
        
        let tmp = chars[p]
        chars[p] = chars[q]
        chars[q] = tmp;
    }
    
    
    func reverseWords(_ s: String) -> String {
        
        var strArr = [Character](s.characters)
        reverse(&strArr, start: 0, end: strArr.count - 1)
        
        var start = 0
        for i in 0..<strArr.count {
            if (i == strArr.count - 1) || (strArr[i + 1] == " ") {
                reverse(&strArr, start: start, end: i)
                start = i + 2
            }
        }
        
        return String(strArr)
    }
    
    func reverse(_ chars: inout [Character], start: Int, end: Int){
        
        var startValue = start
        var endValue = end
        
        while startValue < endValue {
            transformStr(&chars, p: startValue, q: endValue)
            startValue += 1
            endValue -= 1
        }
        
    }
    
    

}

