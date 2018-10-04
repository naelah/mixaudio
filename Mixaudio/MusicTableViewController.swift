//
//  MusicTableViewController.swift
//  Mixaudio
//
//  Created by Naelah on 24/04/2018.
//  Copyright © 2018 Arche Information. All rights reserved.
//

import UIKit
import AVFoundation

var songs:[Song] = []
var audioPlayer : AVAudioPlayer! = nil

class MusicTableViewController: UITableViewController, MusicTableViewCellDelegate{
    
    func MusicTableViewCellDidPause(_ sender: MusicTableViewCell, title: String) {
        
        let url = Bundle.main.url(forResource: title, withExtension: ".mp3")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer.pause()
            print("playing "+title)
            
        }catch{ print(error) }
    }
    
    func MusicTableViewCellDidPlay(_ sender: MusicTableViewCell, title: String) {
        
       
            let url = Bundle.main.url(forResource: title, withExtension: ".mp3")
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url!)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                print("playing "+title)
                
            }catch{ print(error) }
        }
    func MusicTableViewCellDidAdd(_ sender: MusicTableViewCell, song: Song) {
        performSegue(withIdentifier: "recordingSegue", sender: song)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RecordingViewController {
            destination.song = sender as? Song
        }
    }
    @IBOutlet var songTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSongList()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let song = songs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell") as! MusicTableViewCell
        cell.setSong(song: song)
        cell.pauseButton.isHidden = true
        cell.delegate = self
        return cell
    }
    
    
    // Create the method you want to call (see target before)
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func initSongList() {
        
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        
        do{
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for song in songPath{
                var mySong = song.absoluteString
                if mySong.contains(".mp3")
                {
                    let mySongPath = mySong
                    let findString = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count-1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
                    let newSong = Song(path: mySongPath, title: mySong, genre: "hip-hop")
                    songs.append(newSong)
                }
            }
            
            songTableView.reloadData()
            
        } catch {
            
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
