//
//  ViewTopRatedViewController.swift
//  MoviesCoppel
//
//  Created by Jesus Grimaldo on 17/11/22.
//

import UIKit

class ViewTopRatedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    @IBOutlet var coleccionTopRated: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       coleccionTopRated.delegate = self
        coleccionTopRated.dataSource = self
        
        MoviesViewModel.shared.fetchTop { done in
            if done {
                self.coleccionTopRated.reloadData()
            }
        }
     
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MoviesViewModel.shared.dataMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cel2 = coleccionTopRated.dequeueReusableCell(withReuseIdentifier: "ViewTopColeccionCollectionViewCell", for: indexPath) as! ViewTopColeccionCollectionViewCell
        let user = MoviesViewModel.shared.dataMovies[indexPath.row]
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w200/\(user.poster_path ?? "" )")!)) { (data,req,error) in
                do{
                    var data = try data
                    DispatchQueue.main.async {
                     cel2.imagenTop.image = UIImage(data: data!)
                       cel2.tituloTopR.text = user.original_title
                       
                        
                        
                      
                       
                    }
                        
            }catch{
                    
                }
            }.resume()
        
        return cel2
    }
    
    

}
extension ViewTopRatedViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    
}
