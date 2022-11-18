//
//  TabViewController.swift
//  MoviesCoppel
//
//  Created by Jesus Grimaldo on 16/11/22.
//

import UIKit

class celda: UITableViewCell{
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var imagen: UITableView!
   
}

class TabViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
   
    @IBOutlet weak var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.delegate = self
        tabla.dataSource = self
        MoviesViewModel.shared.fetch{ done in
            if done {
                self.tabla.reloadData()
            }
        }

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MoviesViewModel.shared.dataMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! celda
        let user = MoviesViewModel.shared.dataMovies[indexPath.row]
        cell.titulo.text = user.original_title
       //cell.descripcion.text = user.overview
     /* guard let imageURL = URL(string: user.poster_path) else { fatalError("sin imagen") }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                cell.imagen.image = image
                self.tabla.reloadData()
            }
        }*/
        return cell
    }
    

}
