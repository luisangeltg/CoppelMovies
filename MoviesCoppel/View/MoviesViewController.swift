//
//  MoviesViewController.swift
//  MoviesCoppel
//
//  Created by Jesus Grimaldo on 16/11/22.
//

import UIKit

class MoviesViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
   
    
   
    @IBAction func guardar(_ sender: UIButton) {
       
        
    }
    
    @IBOutlet var colections: UICollectionView!
    private let myCellWidth = UIScreen.main.bounds.width / 2
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
       colections.delegate = self
        colections.dataSource = self
       
       
        
        MoviesViewModel.shared.fetch { done in
            if done {
                self.colections.reloadData()
            
            }
         
            }
        }
       
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MoviesViewModel.shared.dataMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colections.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        let user = MoviesViewModel.shared.dataMovies[indexPath.row]
      
       
      
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w200/\(user.poster_path ?? "" )")!)) { (data,req,error) in
                do{
                    var data = try data
                    DispatchQueue.main.async {
                     cell.imagen.image = UIImage(data: data!)
                       cell.titulo1.text = user.original_title
                        cell.titulo1.textColor = .white
                        cell.relase12.text = user.release_date
                        cell.relase12.textColor = .blue
                        
                      
                       
                    }
                        
            }catch{
                    
                }
            }.resume()
    
        return cell
        
    }


}

extension MoviesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCellWidth, height: myCellWidth)
    }
    
}
