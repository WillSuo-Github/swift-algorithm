//
//  ViewController.swift
//  swiftTest
//
//  Created by ws on 16/7/25.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class ListNode {
    var val: Int?
    var next: ListNode?
    
    init(val: Int){
        
        self.val = val
        self.next = nil
    }
}


class List {
    var head: ListNode?
    var tail: ListNode?
    
    //尾插
    func appendToTail(val: Int) {
        
        if tail == nil {
            
            tail = ListNode(val: val)
            head = tail
        }else{
            
            tail?.next = ListNode(val: val)
            tail = tail!.next
        }
    }
    
    
    //头插
    func appendToHead(val: Int) {
        if head == nil {
            head = ListNode(val: val)
            tail = head
        }else{
            let tmp = ListNode(val: val)
            tmp.next = head
            head = tmp
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let tmp = List()
        tmp.appendToTail(1)
        tmp.appendToTail(5)
        tmp.appendToTail(3)
        tmp.appendToTail(2)
        tmp.appendToTail(4)
        tmp.appendToTail(2)
    
        let ws = partition(tmp.head, minNum: 3)
        print(ws)
    }
    
    
    func partition(head: ListNode!, minNum: Int) -> ListNode? {
        
        let prevDummy = ListNode(val: 0)
        var prev = prevDummy
        let postDummy = ListNode(val: 0)
        var post = postDummy
        
        var node = head
        
        
        while node != nil {
            if node.val < minNum {
                prev.next = node
                prev = node!
            }else{
                post.next = node
                post = node!
            }
            node = node!.next
        }
        
        post.next = nil
        prev.next = postDummy.next
        
        return prevDummy.next
    }
    

}

