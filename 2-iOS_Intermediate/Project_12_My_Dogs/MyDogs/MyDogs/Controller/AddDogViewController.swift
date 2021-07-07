//
//  AddDogViewController.swift
//  MyDogs
//
//  Created by James Hunt on 7/7/21.
//

import UIKit

class AddDogViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var dogProperty: [UITextField]!
    
    var delegate:AddDogDelegate?
    var newDog:Dog?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addPhoto(_ sender: UIButton) {
        let picker = UIImagePickerController()
           picker.allowsEditing = true
           picker.delegate = self
           present(picker, animated: true)
        
    }
    @IBAction func addDog(_ sender: UIButton) {
        if let dog = newDog {
            delegate?.addDogPressed(controller: self, dog: dog)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)

        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        newDog = Dog(name: "james", color: "color", favoriteTreat: "treat", image: imageName)

        dismiss(animated: true)
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

}
