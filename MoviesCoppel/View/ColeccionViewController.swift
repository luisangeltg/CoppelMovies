//
//  ColeccionViewController.swift
//  MoviesCoppel
//
//  Created by Jesus Grimaldo on 16/11/22.
//

import UIKit

class ColeccionViewController: UITableView,UITableViewDelegate,UITableViewDataSource{
   
    

    @IBOutlet weak var coleccion: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coleccion.delegate = self
        coleccion.dataSource = self
        MoviesViewModel.shared.fetch { done in
            if done {
                self.coleccion.reloadData()
            }
        }
      
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MoviesViewModel.shared.dataMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = coleccion.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CeldasCollectionViewCell
        let user = MoviesViewModel.shared.dataMovies[indexPath.row]
       cell.titulo.text = user.original_title
        cell.descripcion.text = user.overview
     //   guard let imageURL = URL(string: user.poster_path ?? "") else { fatalError("sin imagen ") }
        /*DispatchQueue.global().async {
            guard let imageData = try? Date(contentsOf: imageURL) else { return }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                cell.image.image = image
                self.Collections.reloadData()
            }
        }*/
        
        return cell
    }

    

}
