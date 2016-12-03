//
//  AddNewWordVC.swift
//  EngVocabulary
//
//  Created by techmaster on 11/30/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit
import AVFoundation

class AddNewWordVC: BaseViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate, AVAudioRecorderDelegate {
    var dataPath: String = ""
    
    @IBOutlet weak var wordText: CustomTextField!
    
    @IBOutlet weak var typeText: CustomTextField!
    
    @IBOutlet weak var meanText: CustomTextField!
    
    @IBOutlet weak var pronunText: CustomTextField!
    
    @IBOutlet weak var senText: CustomTextField!
    
    @IBOutlet weak var SynoText: CustomTextField!
    
    @IBOutlet var imageView: UIImageView!
    
    var imgText: String = ""
    var soundText: String = ""
    let imagePicker = UIImagePickerController()
    
    var recordButton: UIButton!
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        
        self.navigationController?.isNavigationBarHidden = false
        dataPath = getPath("/newdata.plist")
        print("dataPath = \(dataPath)")
        let tempData:[String: NSDictionary] = [:]
        if (!FileManager.default.fileExists(atPath: dataPath)) {
            let temp = NSDictionary(dictionary: tempData)
            temp.write(toFile: dataPath, atomically: true)
        }
        // Do any additional setup after loading the view.
        
        recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession.setActive(true)
            self.loadRecordingUI()
        } catch {
            print(error)
        }
    }
    func loadRecordingUI() {
        recordButton = UIButton(frame: CGRect(x: 132, y: 458, width: 86, height: 35))
        recordButton.backgroundColor = UIColor.blue
        
        recordButton.setTitle("Start", for: .normal)
        recordButton.titleLabel?.font = UIFont.systemFont(ofSize: 8)
        recordButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title1)
        recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
        view.addSubview(recordButton)
    }
    
    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent(soundText + ".m4a")
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            
            recordButton.setTitle("Stop", for: .normal)
        } catch {
            finishRecording(success: false)
        }
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        
        if success {
            recordButton.setTitle("Re-record", for: .normal)
        } else {
            recordButton.setTitle("Record", for: .normal)
            // recording failed :(
        }
    }
    
    func recordTapped() {
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadImgBtn(_ sender: UIButton) {
        
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func addData(_ sender: CustomButton) {
        
        if wordText.text! == "" || typeText.text! == "" || meanText.text! == "" || pronunText.text! == "" || senText.text! == ""{
            alertBox("Error", "Không được để trống", "Try Again")
        } else {
            if typeText.text! == "verb" {
                soundText = wordText.text! + "_v"
            }
            imgText = wordText.text! + ".jpeg"
            var dataWordDetail :Dictionary<String,String> = [:]
            
            dataWordDetail["sentence"] = senText.text!
            dataWordDetail["meaning"] = meanText.text!
            dataWordDetail["vocalization"] = pronunText.text!
            dataWordDetail["type"] = typeText.text!
            dataWordDetail["synonym"] = SynoText.text!
            dataWordDetail["image"] = imgText
            dataWordDetail["sound"] = soundText
            
            // if file exist
            let dataWord = NSMutableDictionary(contentsOfFile: dataPath)
            dataWord?[wordText.text! as String] = dataWordDetail as NSDictionary
            dataWord?.write(toFile: dataPath, atomically: true)
            
            senText.text = ""
            meanText.text = ""
            pronunText.text = ""
            typeText.text = ""
            wordText.text = ""
            SynoText.text = ""
            
            let imgFilename = getDocumentsDirectory().appendingPathComponent(imgText)
            saveImg(img: imageView.image!, url: imgFilename)
        }
        
    }
    func saveImg(img: UIImage,url: URL) {
        let pngImg = UIImagePNGRepresentation(img)
        do {
            try pngImg?.write(to: url)
            print("Image Added Successfully")
        } catch {
            print(error)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
            
        }
        
        dismiss(animated: true, completion: nil)
    }
}
