//
//  DogsCollectionViewController.swift
//  MyDogs
//
//  Created by James Hunt on 7/7/21.
//

import UIKit
import CoreData

class DogsCollectionViewController: UICollectionViewController,AddDogDelegate {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    
    var dogs = [DogItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
    }
    func fetchAllItems(){
        let request:NSFetchRequest<DogItem> = DogItem.fetchRequest()
        do {
            let result = try managedObjectContext.fetch(request)
            // Here we can store the fetched data in an array
            dogs = result
        } catch {
            print(error)
        }
        
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
        
        if let image = dog.image {
            let path = getDocumentsDirectory().appendingPathComponent(image)
            cell.imageView.image = UIImage(contentsOfFile: path.path)
        }
        
        
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
        performSegue(withIdentifier: "add", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as! UINavigationController
        let controller = nav.topViewController as! AddDogViewController
        controller.delegate = self
        
        if let _ = sender as? UIBarButtonItem {
            
        }
        
        if let indexPath = sender as? NSIndexPath {
            let dog = dogs[indexPath.item]
            controller.currentDog = dog
            controller.indexPath = indexPath
        }
        
        
    }
    func addDogPressed(controller: UIViewController, dog: DogItem) {
        self.dismiss(animated: true, completion: nil)
        dogs.append(dog)
        collectionView.reloadData()
    }
    func saveDogPressed(controller: UIViewController, dog: DogItem, at indexPath: NSIndexPath?) {
        dogs[indexPath!.item].name = dog.name
        dogs[indexPath!.item].color = dog.color
        dogs[indexPath!.item].favoriteTreat = dog.favoriteTreat
        dogs[indexPath!.item].image = dog.image
        
        self.dismiss(animated: true, completion: nil)
        collectionView.reloadData()
    }
    
    func deleteDogPressed(controller: UIViewController, dog: DogItem, at indexPath: NSIndexPath?) {
        let item = dogs[indexPath!.item]
        dogs.remove(at: indexPath!.item)
        managedObjectContext.delete(item)
        self.dismiss(animated: true, completion: nil)
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "add", sender: indexPath)
    }
    
    
}
