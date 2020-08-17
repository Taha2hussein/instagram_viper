//
//  postViewController.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
import IBAnimatable
import Firebase
import FirebaseStorage
protocol postView :class{
    func hideContet()
    func showContent()
    func uploadPost()
}

class postViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postCaption: AnimatableTextView!
    
    // Mark : Variables
     var presenter : postPresentation?
    var imagePicker = UIImagePickerController()
    // Mark : life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        imagePicker.delegate = self
        hideContet()
        choosePhoto()
       
    }
    
    func choosePhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            present(imagePicker, animated: true, completion: nil)
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            
        }
    }
    
    
    @IBAction func sharePostButtonTapped(_ sender: Any) {
        uploadPost()
    }
}

extension postViewController: UINavigationControllerDelegate , UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            showContent()
            postImage.contentMode = .scaleToFill
            postImage.image = pickedImage
            
        }
        
        
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        hideContet()
        dismiss(animated: true, completion:nil)
    }
    
}

extension postViewController :postView{
    func uploadPost() {
         
        if let image = postImage.image{
            guard  let StorageReferences = Storage.storage().reference().child("post_images/") as? StorageReference else{return}
            print("StorageReferences",StorageReferences)
            let caption = postCaption.text
        presenter?.uplaodPostToFireBase(StorageReferences , image,caption ?? "")
        }
        
    }
    
    func hideContet() {
        postImage.isHidden = true
        postCaption.isHidden = true
        shareBtn.isEnabled = false
        contentView.backgroundColor = UIColor.secondarySystemFill
    }
    
    func showContent() {
        postImage.isHidden = false
        postCaption.isHidden = false
        shareBtn.isEnabled = true
        contentView.backgroundColor = UIColor.white
    }
    
    
}
