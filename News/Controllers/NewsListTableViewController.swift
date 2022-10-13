//
//  NewsListTableViewController.swift
//  News
//
//  Created by Livia Carvalho Keller on 12/10/22.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // chamando a funcao
        setup()
        colorNavBar()
        
    }
    
    // funcao para deixar o titulo da barra de navegacao grande
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=br&apiKey=ea35d47e8c11484b9a4902fd2ee1f2c9")!
        
        WebServices().getArticles(url: url) { _ in
            
        }
    }
}

//MARK: - Color Nav Function

extension UITableViewController {
    
    func colorNavBar() {
        let nav = UINavigationBarAppearance()
        nav.configureWithOpaqueBackground()
        
        // colors
        nav.titleTextAttributes = [.foregroundColor: UIColor.white]
        nav.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        nav.backgroundColor = .systemPink
        
        navigationItem.standardAppearance = nav
        navigationItem.scrollEdgeAppearance = navigationItem.standardAppearance
        
        
    }
}
