//
//  TpRaterViewController.swift
//  MoviesCoppel
//
//  Created by Jesus Grimaldo on 17/11/22.
//

import UIKit

class TpRaterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
   
    private let myCellWidth = UIScreen.main.bounds.width / 2
    

    @IBOutlet var TpRatedC: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        TpRatedC.delegate = self
        TpRatedC.dataSource = self
        
        MoviesViewModel.shared.fetchTop { done in
            if done{
                self.TpRatedC.reloadData()
            }
        }
        
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MoviesViewModel.shared.dataMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cel234 = TpRatedC.dequeueReusableCell(withReuseIdentifier: "TpRaterssCollectionViewCell", for: indexPath) as! TpRaterssCollectionViewCell
        let user = MoviesViewModel.shared.dataMovies[indexPath.row]
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w200/\(user.poster_path ?? "" )")!)) { (data,req,error) in
                do{
                    var data = try data
                    DispatchQueue.main.async {
                     cel234.imagenTpRated.image = UIImage(data: data!)
                       cel234.tituloTpRated.text = user.original_title
                        cel234.tituloTpRated.textColor = .white
                        cel234.ralaseTpRated.text = user.release_date
                        cel234.ralaseTpRated.textColor = .blue
                        
                      
                       
                    }
                        
            }catch{
                    
                }
            }.resume()
        
        return cel234
    }

}

extension TpRaterViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCellWidth, height: myCellWidth)
    }
    
}
