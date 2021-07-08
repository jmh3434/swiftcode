//
//  AddDogViewController.swift
//  MyDogs
//
//  Created by James Hunt on 7/7/21.
//

import UIKit
import CoreData

class AddDogViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var dogProperty: [UITextField]!
    @IBOutlet weak var addDogButton: UIButton!
    @IBOutlet weak var addPhotoButton: UIButton!
    
    var delegate:AddDogDelegate?
    var currentDog:DogItem?
    var indexPath:NSIndexPath?
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    override func viewDidLoad() {
        
        hideKeyboardWhenTappedAround()
        
        if let dog = currentDog {
            
            // get dog previously created
            
            self.title = "Edit Dog"
            
            dogProperty[0].text = dog.name
            dogProperty[1].text = dog.color
            dogProperty[2].text = dog.favoriteTreat
            
            addDogButton.setTitle("Delete", for: .normal)
            addPhotoButton.setTitle("Update Photo", for: .normal)
            addDogButton.setTitleColor(.red, for: .normal)
            
            if let image = dog.image {
                let path = getDocumentsDirectory().appendingPathComponent(image)
                addPhotoButton.setBackgroundImage(UIImage(contentsOfFile: path.path), for: .normal)
            }
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveDog))

        }else{
            
            // create a new dog
            
            currentDog = DogItem(context: managedObjectContext)
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        super.viewDidLoad()
    }
    @IBAction func addPhoto(_ sender: UIButton) {
        let picker = UIImagePickerController()
           picker.allowsEditing = true
           picker.delegate = self
           present(picker, animated: true)
    }
    @IBAction func addDog(_ sender: UIButton) {
        if addDogButton.titleLabel?.text == "Add Dog"{
            // add dog
            currentDog?.name = dogProperty[0].text!
            currentDog?.color = dogProperty[1].text!
            currentDog?.favoriteTreat = dogProperty[2].text!
            
            if let dog = currentDog {
                delegate?.addDogPressed(controller: self, dog: dog)
            }
        }else{
            // delete dog
            if let dog = currentDog {
                delegate?.deleteDogPressed(controller: self, dog: dog, at: indexPath)
            }
        }
    }
    @objc func saveDog() {
        // save dog
        currentDog?.name = dogProperty[0].text!
        currentDog?.color = dogProperty[1].text!
        currentDog?.favoriteTreat = dogProperty[2].text!
        
        if let dog = currentDog {
            delegate?.saveDogPressed(controller: self, dog: dog, at: indexPath)
        }
    }
    @objc func cancel() {
        // cencel
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)

        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        addPhotoButton.setBackgroundImage(UIImage(contentsOfFile: imagePath.path), for: .normal)
        
        currentDog?.image = imageName
        
        addPhotoButton.setTitle("", for: .normal)

        dismiss(animated: true)
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
