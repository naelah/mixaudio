//
//  MusicTableViewCell.swift
//  Mixaudio
//
//  Created by Naelah on 24/04/2018.
//  Copyright © 2018 Arche Information. All rights reserved.
//

import UIKit

protocol MusicTableViewCellDelegate : class {
    func MusicTableViewCellDidPlay(_ sender: MusicTableViewCell, title: String)
    func MusicTableViewCellDidPause(_ sender: MusicTableViewCell, title: String)
    func MusicTableViewCellDidAdd(_ sender: MusicTableViewCell, song: Song)
}

class MusicTableViewCell: UITableViewCell {
    
    var songItem: Song!
    weak var delegate: MusicTableViewCellDelegate?
    
    @IBAction func playAction(_ sender: UIButton) {
        self.imageView?.contentMode = UIViewContentMode.scaleAspectFit;
        delegate?.MusicTableViewCellDidPlay(self, title: songItem.title)
        playButton.isHidden = true
        pauseButton.isHidden = false
        
    }
    @IBOutlet weak var playButton: UIButton!
    @IBAction func pauseAction(_ sender: UIButton) {
        self.imageView?.contentMode = UIViewContentMode.scaleAspectFit;
        delegate?.MusicTableViewCellDidPause(self, title: songItem.title)
        pauseButton.isHidden = true
        playButton.isHidden = false
    }
    
  //  weak var songPath: String!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var songProgress: UIProgressView!
    @IBAction func addSongButton(_ sender: UIButton) {
        self.imageView?.contentMode = UIViewContentMode.scaleAspectFit;
        delegate?.MusicTableViewCellDidAdd(self, song: songItem)
    }
    func setSong(song: Song) {
        songItem = song
        songItem.path = song.path
        musicTitle.text = song.title
        genreLabel.text = song.genre
    }
    
    @IBOutlet weak var musicTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
