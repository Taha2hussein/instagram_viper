//
//  Navigations.swift
//  instagram_Viper
//
//  Created by A on 8/14/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit

class Navigations{
    
    var closure : ((Bool)->())?
    static let shared = Navigations()
    let post_image_Refrence = "gs://instagram-6866a.appspot.com/post_images"
    
    let subModules = (
    home : homeBuilder.Build(),
    search : searchBuilder.Build(),
    post : postBuilder.Build(),
    like: likesBuilder.Build(),
    profile: profileBuilder.Build()
    )
    
    
    func getHome() -> UIViewController{
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "homeTabBar")
        
        return storyBoard
    }
    func showAlert(_ message:String, view:UIViewController){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
              switch action.style{
              case .default:
                    print("default")
                    self.closure?(true)
              case .cancel:
                    print("cancel")

              case .destructive:
                    print("destructive")


        }}))
        view.present(alert, animated: true, completion: nil)
    }
    
    deinit{
        print("sucess to remove")
    }
}
public enum QueueType {
    case Main
    case Background
    case LowPriority
    case HighPriority

    var queue: DispatchQueue {
        switch self {
        case .Main:
            return DispatchQueue.main
        case .Background:
            return DispatchQueue(label: "com.app.queue",
                                 qos: .background,
                                 target: nil)
        case .LowPriority:
            return DispatchQueue.global(qos: .userInitiated)
        case .HighPriority:
            return DispatchQueue.global(qos: .userInitiated)
        }
    }
}

func performOn(_ queueType: QueueType, closure: @escaping () -> Void) {
    queueType.queue.async(execute: closure)
}
