ATSGProgress
===================

# Introduction
`ATSGProgress` is a loader with awesome loading animations.

This library use `ATSGProgress` to display custom activity indicators.

# Animation types

| Type | Type | Type | Type |
|---|---|---|---|
1. BallPulse | 2. BallGridPulse | 3. BallClipRotate | 4. SquareSpin
5. BallClipRotatePulse | 6. BallClipRotateMultiple | 7. BallPulseRise | 8. BallRotate
9. CubeTransition | 10. BallZigZag | 11. BallZigZagDeflect | 12. BallTrianglePath
13. BallScale | 14. LineScale | 15. LineScaleParty | 16. BallScaleMultiple
17. BallPulseSync | 18. BallBeat | 19. LineScalePulseOut | 20. LineScalePulseOutRapid
21. BallScaleRipple | 22. BallScaleRippleMultiple | 23. BallSpinFadeLoader | 24. LineSpinFadeLoader
25. TriangleSkewSpin | 26. Pacman | 27. BallGridBeat | 28. SemiCircleSpin
29. BallRotateChase | 30. Orbit | 31. AudioEqualizer

# Installation

## Cocoapods

Install Cocoapods if need be.

```bash
$ gem install cocoapods
```

Add `ATSGProgress` in your `Podfile`.

```ruby
use_frameworks!

pod 'ATSGProgress'
```

Then, run the following command.

```bash
$ pod install
```
# Usage

Firstly, import `ATSGProgress`.

```swift
import ATSGProgress
```
Display default loader
```swift
ATSGProgress.showLoadingViewWithMessage()
```
![alt text](/Screen Shots/Default loader.png "Default loader")

Display default loader with message
```swift
ATSGProgress.showLoadingViewWithMessage(msg: "Loading...")
```
![alt text](/Screen Shots/Default loader with message.png "Default loader")

Create custom loader with awesome indicators
```swift
// Set styles
ATSGProgress.textColor = UIColor.white
ATSGProgress.backColor = UIColor(colorLiteralRed: 61.0/255.0, green: 172.0/255.0, blue: 227.0/255.0, alpha: 1)
ATSGProgress.backSize  = 120
ATSGProgress.backRadius = 8
ATSGProgress.indicatorStyle = IndicatorStyle.blank

ATSGProgress.showLoadingViewWithMessage()
```
![alt text](/Screen Shots/Custom Loader.png "Custom loader")

Hide loader
```swift
ATSGProgress.dismiss()
```

# License

The MIT License (MIT)

Copyright (c) 2016 Antonio Serrano Gómez [@asgapps](http://asgapps.es)