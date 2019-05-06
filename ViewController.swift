//
//  ViewController.swift
//  GraphicalPass_Auth
//
//  Created by Nanditha Embar on 2/05/19.
//  Copyright © 2019 Nanditha Embar. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
   // let locs:[(CGFloat, CGFloat, CGFloat, CGFloat)] = [(0.0,0.0,0.0,0.0), (0.0,0.0,0.0,0.0), (0.0,0.0,0.0,0.0), (0.0,0.0,0.0,0.0)]; // data structure to hold key values
   // let pw:[Int] = [(0),(0),(0),(0)];
    
    // *try dynamically instead hard code values
   // @IBOutlet weak var upImage: UIImageView!
   // @IBOutlet weak var downImage: UIImageView!
    
    
    //@IBOutlet var categoryButtons: [UIButton]!
    var curImage: Int = 0
    var setPassword = 0
    var checkPassword = 0
    var password:[Int] = [(0), (0), (0), (0)]
    var userInput:[Int] = [(0), (0), (0), (0)]
    var curTapCount = 0
    
    
    @IBOutlet var categoryButtons: [UIButton]!
    
    var animalImage : [UIImage]!
    //images of animals
    var Dog: UIImage!
    var kitten: UIImage!
    var Fox:UIImage!
    
    //images of cars
    var car_3: UIImage!
    var car_5: UIImage!
    var car_9: UIImage!
    
    //images of planes
    var plane_4: UIImage!
    var plane_7: UIImage!
    var plane_8: UIImage!

   //var Kitten: UIImage!
   
    
    //@IBAction func pressedButton(_ sender: Any) {
        //Kitten.image = Dog;
    //}
    
    func initAnimalImages(){
        
    }
    
    @IBOutlet weak var Kitten: UIImageView!
   
    @IBOutlet weak var Next_Button: UIButton!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
   // @IBOutlet var TapGesture2: UITapGestureRecognizer!
    
    
    @IBOutlet weak var DoneButton: UIButton!
    
    @IBAction func handleDone(_ sender: UIButton) {
        if (setPassword == 1)
        {
            DoneButton.isHidden = true
        }
    }
    
    
    @IBOutlet weak var CheckButton: UIButton!
    
    @IBAction func handleCheck(_ sender: UIButton) {
        checkPassword = 1
        PasswordButton.isHidden = true
        
    }
    
    
    
    @IBOutlet weak var PasswordButton: UIButton!
    
    @IBAction func handlePassword(_ sender: UIButton) {
        setPassword = 1
        PasswordButton.isHidden = true
        curTapCount = 0
        
    }
    
    func copyPassword(){
        var i: Int = 0;
        for i in 0...3{
            password[i] = userInput[i];
        }
        setPassword = 0;
        print(password)
    }
    
    @IBOutlet weak var Prev_Button: UIButton!
    
   // @IBAction func handleSelection(_ sender: UIButton) {
      //  categoryButtons.forEach { (button) in
          //  button.isHidden = !button.isHidden
            
            
     //   }
        
  //  }
    
    @IBAction func handleSelection(_ sender: UIButton) {
        categoryButtons.forEach { (button) in
                button.isHidden = !button.isHidden
        }
    }
    enum Category: String {
        case cars = "Cars"
        case animals = "Animals"
        case planes = "Planes"
    }
    
    @IBAction func categoryTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let category = Category(rawValue: title) else{
            return
        }
       Kitten.isHidden = false
        switch category {
        case .cars:
            print("Cars")
            imageData = carData
            curImage = 0
            Kitten.image = imageData[curImage].img
        case .animals:
            print("Animals")
            imageData = animalData
            curImage = 0
            Kitten.image = imageData[curImage].img
        default:
            print("Planes")
            imageData = planeData
            curImage = 0
            Kitten.image = imageData[curImage].img
            
        }
        
    }
    
    
    
   // @IBOutlet var myUIImageViewTapped1: UITapGestureRecognizer!
    struct imageAndLocations{
        
        var img: UIImage!
        
        var locs: [(CGFloat, CGFloat, CGFloat, CGFloat,CGFloat, CGFloat, CGFloat, CGFloat)]!
        
    }
    var animalData : [imageAndLocations]!
    var carData : [imageAndLocations]!
    var planeData : [imageAndLocations]!
    var imageData : [imageAndLocations]!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
       
        Dog = UIImage(named: "Dog.png")
        
        kitten = UIImage(named: "Kitten.png")
        
        car_3 = UIImage(named: "car_3.jpg")
        car_5 = UIImage(named: "car_5.jpg")
        car_9 = UIImage(named: "car_9.jpg")
        plane_4 = UIImage(named: "plane_4.png")
        plane_7 = UIImage(named: "plane_7.png")
        plane_8 = UIImage(named: "plane_8.png")
        Fox = UIImage(named: "Fox.png")
        
        //Kitten = UIImage(named: "Kitten.png")
        // try out if we need to use an array of images this is how I will use it
      //  animalImage = [Dog, Kitten]
        
        
        // storing image and location of dog
        // use this data structure
        //var data1 = imageAndLocations(img: Dog, locs: [12.5, 15.5])
        let locs1:[(CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat)] = [(134.0,366.0,165.0,366.0,134.0,412.0,165.0,412.0), (264.0,366.0,290.0,366.0,264.0,412.0,264.0,412.0), (160.0,707.0,183.0,707.0,160.0,730.0,183.0,730.0),
            (236.0,696.0,260.0,696.0,236.0,715.0,260.0,715.0)];
        var data1 = imageAndLocations(img: Dog, locs: locs1)
        print(data1.locs[0].0)
    
        let locs2:[(CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat)] = [(130.0,381.0,160.0,381.0,130.0,415.0,160.0,415.0), (263.0,364.0,302.0,364.0,263.0,403.0,302.0,403.0), (222.0,690.0,274.0,690.0,222.0,716.0,274.0,716.0),
            (290.0,676.0,338.0,676.0,290.0,706.0,328.0,706.0)];
        var data2 = imageAndLocations(img: kitten, locs: locs2)
        
        let locs3:[(CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat)] = [(142.0,303.0,180.0,303.0,142.0,354.0,180.0,354.0), (242.0,295.0,278.0,295.0,242.0,350.0,278.0,350.0), (157.0,702.0,190.0,702.0,157.0,730.0,190.0,730.0),
            (237.0,695.0,260.0,695.0,237.0,718.0,260.0,718.0)];
        var data3 = imageAndLocations(img: Fox, locs: locs3)
        
        let plane1locs:[(CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat)] = [(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0), (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0), (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
            (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)];
        var plane1data = imageAndLocations(img: plane_4, locs: plane1locs)
        //print(data1.locs[0].0)
        
        let plane2locs:[(CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat)] = [(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0), (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0), (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
            (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)];
        var plane2data = imageAndLocations(img: plane_7, locs: plane2locs)
        
        let plane3locs:[(CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat)] = [(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0), (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0), (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
            (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)];
        var plane3data = imageAndLocations(img: plane_8, locs: plane3locs)
        
        let cars3locs:[(CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat)] = [(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0), (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0), (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
            (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)];
        var cars3data = imageAndLocations(img: car_3, locs: cars3locs)
        
        let cars5locs:[(CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat)] = [(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0), (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0), (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
            (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)];
        var cars5data = imageAndLocations(img: car_5, locs: cars5locs)
        
        let cars9locs:[(CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat)] = [(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0), (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0), (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
            (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)];
        var cars9data = imageAndLocations(img: car_9, locs: cars9locs)
        
        
        animalData = [data1, data2, data3]
        planeData = [plane1data, plane2data, plane3data]
        carData = [cars3data, cars5data, cars9data]
        
        print(animalData[0].locs[1].0) //object within the array
        
        
        
        animalImage = [Dog];
        let len = animalImage.count; // length of the array
        print("length of array is \(len)")
        let recognizer = UITapGestureRecognizer(target: self,
        action:#selector(myUIImageViewTapped(recognizer:)))
        
        Kitten.isHidden = true
        
        //4
        // data store all the images and locations
        // 2 buttons previous and next (go through the images)
        recognizer.delegate = self as? UIGestureRecognizerDelegate
        
        super.view.addGestureRecognizer(recognizer)
        
        //self.myUIImageViewTapped1.isUserInteractionEnabled = true
        
        
        
        
        
    }
    
    
    @IBAction func changeImage(_ sender: Any) {
        //Kitten.image = Dog;
        if(curImage < 2){
            curImage = curImage + 1
        }
        
        Kitten.image = imageData[curImage].img
    }
    
    @IBAction func prevImage(_ sender: Any) {
        if(curImage > 0){
            curImage = curImage - 1
        }
        Kitten.image = imageData[curImage].img;
    }
    
    @IBAction func myUIImageViewTapped(recognizer: UITapGestureRecognizer) {
        if(recognizer.state == UIGestureRecognizer.State.ended){
            let tp = recognizer.location(in: self.view);
            var locs: [(CGFloat, CGFloat, CGFloat, CGFloat,CGFloat, CGFloat, CGFloat, CGFloat)]!
            locs = imageData[curImage].locs;
                
            print("myUIImageView has been tapped by the user.")
            print(recognizer.location(in: self.view))
            print(imageData[curImage].locs[1].0)
            print(imageData[curImage].locs[1].1)
            print(imageData[curImage].locs[1].2)
            print(imageData[curImage].locs[1].3)
            print(imageData[curImage].locs[1].4)
            print(imageData[curImage].locs[1].5)
            print(imageData[curImage].locs[1].6)
            print(imageData[curImage].locs[1].7)
            if(setPassword == 1){
                if((tp.x >= locs[0].0 && tp.x <= locs[0].2) && (tp.y >= locs[0].1 && tp.y <= locs[0].5))
                {
                    let alertController = UIAlertController(title: nil, message: "You tapped Left Ear \(recognizer.location(in: self.view))", preferredStyle: .alert)
                    
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { _ in }))
                    
                     self.present(alertController, animated: true, completion: nil)
                    curTapCount = curTapCount + 1
                    userInput[curTapCount-1] = 0;
                }
                    
                else if((tp.x >= locs[1].0  && tp.x <= locs[1].2 ) && (tp.y >= locs[1].1 && tp.y <= locs[1].5))
                {
                    let alertController = UIAlertController(title: nil, message: "You tapped Right Ear \(recognizer.location(in: self.view))", preferredStyle: .alert)
                    
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { _ in }))
                    
                     self.present(alertController, animated: true, completion: nil)
                    curTapCount = curTapCount + 1
                    userInput[curTapCount-1] = 1;
                }
                else if((tp.x >= locs[2].0  && tp.x <= locs[2].2 ) && (tp.y >= locs[2].1 && tp.y <= locs[2].5))
                {
                    let alertController = UIAlertController(title: nil, message: "You tapped Left Paw \(recognizer.location(in: self.view))", preferredStyle: .alert)
                    
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { _ in }))
                    
                    self.present(alertController, animated: true, completion: nil)
                    curTapCount = curTapCount + 1
                    userInput[curTapCount-1] = 2;
                }
                else if((tp.x >= locs[3].0  && tp.x <= locs[3].2 ) && (tp.y >= locs[3].1 && tp.y <= locs[3].5))
                {
                    let alertController = UIAlertController(title: nil, message: "You tapped Right Paw \(recognizer.location(in: self.view))", preferredStyle: .alert)
                    
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { _ in }))
                    
                    self.present(alertController, animated: true, completion: nil)
                    curTapCount = curTapCount + 1
                    userInput[curTapCount-1] = 3;
                }
                else
                {
                    let alertController = UIAlertController(title: nil, message: "You tapped Invalid Point \(recognizer.location(in: self.view))", preferredStyle: .alert)
                    
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { _ in }))
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
                if(curTapCount == 4){
                    print(userInput)
                    curTapCount = 0;
                    copyPassword()
                }
            }else if(checkPassword == 1){
                
            }
            
    }
    
    
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    @IBAction func nextHandler(_ sender: Any) {
        Kitten.image = Dog;
    }
    
    @objc func handleTap12(recognizer: UITapGestureRecognizer) {
       
        Kitten.image = Dog; // once first tap is found moves onto next image
        print("Tap found")
        
        let tp = recognizer.location(in: self.view);
        print(recognizer.location(in: self.view))
        
        if((tp.x >= 108 && tp.x <= 174) && (tp.y >= 254 && tp.y <= 317))
        {
            let alertController = UIAlertController(title: nil, message: "You tapped Left Ear \(recognizer.location(in: self.view))", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { _ in }))
            
           // self.present(alertController, animated: true, completion: nil)
        }
        
       else if((tp.x >= 266  && tp.x <= 327 ) && (tp.y >= 255 && tp.y <= 298))
        {
            let alertController = UIAlertController(title: nil, message: "You tapped Right Ear \(recognizer.location(in: self.view))", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { _ in }))
            
           // self.present(alertController, animated: true, completion: nil)
        }
       else if((tp.x >= 217  && tp.x <= 294 ) && (tp.y >= 630 && tp.y <= 720))
        {
            let alertController = UIAlertController(title: nil, message: "You tapped Left Paw \(recognizer.location(in: self.view))", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { _ in }))
            
            self.present(alertController, animated: true, completion: nil)
        }
 
    }
    
}





