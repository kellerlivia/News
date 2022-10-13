//
//  NewsListTableViewController.swift
//  News
//
//  Created by Livia Carvalho Keller on 12/10/22.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel!
    
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
        
        WebServices().getArticles(url: url) { articles in
            
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM.title
        cell.titleDescription.text = articleVM.description
        return cell
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
