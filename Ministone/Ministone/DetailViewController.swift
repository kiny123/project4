//
//  DetailViewController.swift
//  Ministone
//
//  Created by nikita on 15.12.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "This is flag of the - \(selectedImage!.replacingOccurrences(of: "@3x.png", with: "")) country"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
            imageView.layer.borderWidth = 1
            
        }
    }
        
        @objc func sharedTapped() {
            guard let image = (imageView.image?.jpegData(compressionQuality: 0.8))
            else {
                print("No image found")
                return
            }
        
        
        let vc = UIActivityViewController(activityItems: [image] + ["\(selectedImage!.replacingOccurrences(of: "@3x.png", with: ""))"], applicationActivities: [] )
            vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            present(vc, animated: true)
        }


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


