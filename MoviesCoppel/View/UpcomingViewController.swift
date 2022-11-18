//
//  UpcomingViewController.swift
//  MoviesCoppel
//
//  Created by Jesus Grimaldo on 17/11/22.
//

import UIKit

class UpcomingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
    private let myCellWidth = UIScreen.main.bounds.width / 2

    
    @IBOutlet var UpcomingColection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        UpcomingColection.delegate = self
        UpcomingColection.dataSource = self
        
        MoviesViewModel.shared.fetchUpc { done in
            if done{
                self.UpcomingColection.reloadData()
            }
        }
        
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MoviesViewModel.shared.dataMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cel23 = UpcomingColection.dequeueReusableCell(withReuseIdentifier: "UpComingCollectionViewCell", for: indexPath) as! UpComingCollectionViewCell
        let user = MoviesViewModel.shared.dataMovies[indexPath.row]
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w200/\(user.poster_path ?? "" )")!)) { (data,req,error) in
                do{
                    var data = try data
                    DispatchQueue.main.async {
                     cel23.imagenUP.image = UIImage(data: data!)
                       cel23.tituloUp.text = user.original_title
                        cel23.tituloUp.textColor = .white
                        cel23.relase.text = user.release_date
                        cel23.relase.textColor = .blue
                        
                      
                       
                    }
                        
            }catch{
                    
                }
            }.resume()
        
        return cel23
    }

}

extension UpcomingViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCellWidth, height: myCellWidth)
    }
    
}
