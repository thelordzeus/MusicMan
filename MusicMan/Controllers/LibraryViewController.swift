//
//  LibraryViewController.swift
//  MusicMan
//
//  Created by Arnav Shukla on 16/07/21.
//

import UIKit

class LibraryViewController: UIViewController, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var songList = [SongLabel]()
    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // song data
        let song1: SongLabel = SongLabel(songImage: #imageLiteral(resourceName: "0"), songName: "Blinding by the lights")
        songList.append(song1)
        let song2: SongLabel = SongLabel(songImage: #imageLiteral(resourceName: "1"), songName: "Hollywoods Bleeding")
        songList.append(song2)
        let song3: SongLabel = SongLabel(songImage: #imageLiteral(resourceName: "2"), songName: "Life is a mess")
        songList.append(song3)
        let song4: SongLabel = SongLabel(songImage: #imageLiteral(resourceName: "3"), songName: "Bandit")
        songList.append(song4)
        let song5: SongLabel = SongLabel(songImage: #imageLiteral(resourceName: "4"), songName: "Counting Stars")
        songList.append(song5)
        let song6: SongLabel = SongLabel(songImage: #imageLiteral(resourceName: "5"), songName: "Heartless")
        songList.append(song6)
        let song7: SongLabel = SongLabel(songImage: #imageLiteral(resourceName: "6"), songName: "The Hills")
        songList.append(song7)
        
        // customizing the library
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "MusicMan"
        
        // setting required delegate
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        // register cell
        self.collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
        
        // SettingUP Grid View
        self.setupGridView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setupGridView()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func setupGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
        
    }
}

//MARK: - DataSource Delegate
extension LibraryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        
        //cell.setData(text: self.dataArray[indexPath.row], cover: self.imageArray[indexPath.row])
        cell.CoverLabel.image = songList[indexPath.row].songImage
        cell.SongLabel.text = songList[indexPath.row].songName
        cell.CoverLabel.layer.cornerRadius = 10
        cell.CoverLabel.layer.shadowOpacity = 0.5
        cell.CoverLabel.layer.shadowRadius = 10
        
        cell.playSong.tag = indexPath.row
        cell.playSong.addTarget(self, action: #selector(playSongButton), for: .touchUpInside)
        
        
        
        
        return cell
    }
    
    @objc func playSongButton(sender: UIButton) {
        
        let indexPath1 = IndexPath(row: sender.tag, section: 0)
        let home = self.storyboard?.instantiateViewController(identifier: "PlayViewController") as! PlayViewController
        home.selectedSong = songList[indexPath1.row]
        self.navigationController?.pushViewController(home, animated: true)
        
        
    }
    
    
}

//MARK: - Collection Layout Delegate
extension LibraryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
    }
    
    func calculateWith() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
        
        
    }
}
