//
//  DogsCollectionViewController.swift
//  MyDogs
//
//  Created by James Hunt on 7/7/21.
//

import UIKit

class DogsCollectionViewController: UICollectionViewController,AddDogDelegate {
    
    var dogs = [Dog]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogs.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DogCollectionViewCell else {
            // we failed to get a PersonCell – bail out!
            fatalError("Unable to dequeue PersonCell.")
        }
        
        let dog = dogs[indexPath.item]

            cell.name.text = dog.name

            let path = getDocumentsDirectory().appendingPathComponent(dog.image)
            cell.imageView.image = UIImage(contentsOfFile: path.path)

            cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
            cell.imageView.layer.borderWidth = 2
            cell.imageView.layer.cornerRadius = 3
            cell.layer.cornerRadius = 7

        return cell
    }
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "add", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as! UINavigationController
        let controller = nav.topViewController as! AddDogViewController
        controller.delegate = self
    }
    func addDogPressed(controller: UIViewController, dog: Dog) {
        
        self.dismiss(animated: true, completion: nil)
        
        dogs.append(dog)
        collectionView.reloadData()
        
        print("here's that dog",dog.color,dog.favoriteTreat)
    }
    

}
