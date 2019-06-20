# 📲 Adding User Annotations To Maps
-
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![GitHub contributors](https://img.shields.io/github/contributors/Naereen/StrapDown.js.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/contributors/) [![Open Source Love png1](https://badges.frapsoft.com/os/v1/open-source.png?v=103)](https://github.com/ellerbrock/open-source-badges/) [![saythanks](https://img.shields.io/badge/say-thanks-ff69b4.svg)](https://saythanks.io/to/kennethreitz)

[![ForTheBadge built-with-love](http://ForTheBadge.com/images/badges/built-with-love.svg)](https://GitHub.com/Naereen/)

[![forthebadge](https://forthebadge.com/images/badges/made-with-swift.svg)](https://forthebadge.com)

![image title](images/new-place.png)

```swift
/     // To allow user add annotation to the map -> recognizing a long press in the apps
        // adding colon after longpress makes sure that info get sent to gestureRecognizer and we can recieve it -> changed to #selector(ViewController.longpress(gestureRecognizer:))
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
            
        uilpgr.minimumPressDuration = 2 // in seconds
            
        map.addGestureRecognizer(uilpgr)
        
    }
    
    @objc func longpress(gestureRecognizer: UIGestureRecognizer) {
        
        let touchPoint = gestureRecognizer.location(in: self.map)
        
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        
        annotation.title = "New place"
        
        annotation.subtitle = "Maybe I'll go here too..."
        
        map.addAnnotation(annotation)
        
    }
    
}        
```