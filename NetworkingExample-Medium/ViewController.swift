//
//  ViewController.swift
//  NetworkingExample-Medium
//
//  Created by Alexey Savchenko on 10/5/18.
//  Copyright © 2018 Alexey Savchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: - UI

  @IBOutlet private weak var comicTitleLabel: UILabel!
  @IBOutlet private weak var comicDescriptionLabel: UILabel!
  @IBOutlet private weak var comicImageView: UIImageView!
  @IBOutlet private weak var loadComicButton: UIButton!

  // MARK: - Properties
  
  let model = ComicViewControllerModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadRandomComic()
  }
  
  @IBAction private func loadComic(_ sender: UIButton) {
    loadRandomComic()
  }
  
  private func presentError(_ error: Error) {
    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
    alert.addAction(.init(title: "OK", style: UIAlertAction.Style.default))
    self.present(alert, animated: true)
  }
  
  private func loadRandomComic() {
    model.getRandomComic { [unowned self] (result) in
      switch result {
      case .failure(let error):
        self.presentError(error)
      case .success(let comic):
        self.render(comic)
      }
    }
  }
  
  private func render(_ comic: Comic) {
    DispatchQueue.global().async {
      let comicURL = URL(string: comic.img)!
      let data = try! Data(contentsOf: comicURL)
      DispatchQueue.main.async {
        let comicImage = UIImage(data: data)
        self.comicImageView.image = comicImage
      }
    }
    comicTitleLabel.text = comic.title
    comicDescriptionLabel.text = comic.alt
  }
}

