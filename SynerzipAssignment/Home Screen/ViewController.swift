//
//  ViewController.swift
//  SynerzipAssignment
//
//  Created by gaurav thorat on 29/08/20.
//  Copyright © 2020 gaurav thorat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var detailsCollectionView: UICollectionView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityWeatherLabel: UILabel!
    @IBOutlet weak var cityTempLabel: UILabel!
    
    var viewModel = ViewModel()
    var searchBar: UISearchBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupSearchBar()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        detailsCollectionView.register(UINib(nibName: "WeatherDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WeatherDetailCollectionViewCell")
        detailsCollectionView.delegate = self
        detailsCollectionView.dataSource = self
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            
            if self.viewModel.cityDBModel != nil {
                self.backgroundImage.image = UIImage(named: "\(self.viewModel.cityDBModel?.icon ?? "placer").png")
                self.detailsCollectionView.reloadData()
                self.cityNameLabel.text = self.viewModel.cityDBModel?.name
                self.cityWeatherLabel.text = self.viewModel.cityDBModel?.weatherDescription
                self.cityTempLabel.text = GlobalHelper().convertTemp(temp: Double(self.viewModel.cityDBModel?.temp ?? 0), from: .kelvin, to: .celsius)
            } else {
                self.backgroundImage.image = UIImage(named: "\(self.viewModel.cityData?.weather?.first?.icon ?? "placer").png")
                self.detailsCollectionView.reloadData()
                self.cityNameLabel.text = self.viewModel.cityData?.name
                self.cityWeatherLabel.text = self.viewModel.cityData?.weather?.first?.weatherDescription
                self.cityTempLabel.text = GlobalHelper().convertTemp(temp: self.viewModel.cityData?.main?.temp ?? 0, from: .kelvin, to: .celsius)
            }
        }
    }
    
    func setupSearchBar() {
        
        searchBar = UISearchBar()
        searchBar?.showsCancelButton = true
        self.navigationItem.titleView = searchBar
        searchBar?.delegate = self
    }
    
    func getCityWhether(cityName: String) {
        if !viewModel.isCityNotAvailable(searchText: cityName) {
            viewModel.cityDBModel = nil
            viewModel.getCityData(searchText: cityName)
        } else {
            updateUI()
        }
    }
}

extension ViewController: ViewModelDelegate {
    
    func viewModelDidUpdate(_ viewModel: ViewModel) {
        updateUI()
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchText = searchBar.text, searchText.count > 1 else {
            return
        }
        
        if searchText.count > 2 {
            self.getCityWhether(cityName: searchText)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = String()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if viewModel.cityDBModel != nil {
            return 9
        } else {
            return viewModel.cityData != nil ? 9 : 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = detailsCollectionView.dequeueReusableCell(withReuseIdentifier: "WeatherDetailCollectionViewCell", for: indexPath) as? WeatherDetailCollectionViewCell else {
            fatalError("Unable to find Collection View Cell")
        }
        
        cell.cellWidthConstraint.constant = detailsCollectionView.bounds.width / 2
        if viewModel.cityDBModel != nil {
            cell.configureUI(cityData: viewModel.cityDBModel, index: indexPath.row)
        } else {
            cell.configureUI(cityData: viewModel.cityData, index: indexPath.row)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (detailsCollectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
