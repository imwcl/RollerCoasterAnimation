//
//  ViewController.swift
//  RollerCoasterAnimation
//
//  Created by 王崇磊 on 16/5/25.
//  Copyright © 2016年 王崇磊. All rights reserved.
//
// 思路详解可以去我的CSDN博客地址观看http://blog.csdn.net/wang631106979/article/details/51737456

import UIKit

@IBDesignable

class ViewController: UIViewController {
    
    var groundLayer:CALayer?
    var yellowPath:CAShapeLayer?
    var greenPath:CAShapeLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        let size = view.frame.size
        initGradientLayer(size)
        initMountainLayer(size)
        initGrasslandlayer(size)
        groundLayer = initGroundLayer(size)
        yellowPath = initYellowPathLayer(size)
        greenPath = initGreenPathLayer(size)
        for index in 0...4 {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(70 * index) * Int64(NSEC_PER_MSEC)), dispatch_get_main_queue(), {
                self.addYellowCarPathAnimation()
            })
        }
        for index in 0...4 {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(85 * index) * Int64(NSEC_PER_MSEC)), dispatch_get_main_queue(), {
                self.addGreenCarPathAnimation(size)
            })
        }
        for index in 0...1 {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(20 * index) * Int64(NSEC_PER_MSEC)), dispatch_get_main_queue(), {
                self.addCloudAnimation(size)
            })
        }
        addTreeLayer(size)
    }
    
    func getPoint(pointOne:CGPoint, pointTwo:CGPoint, referenceX:CGFloat) ->CGFloat  {
        let x1 = pointOne.x
        let y1 = pointOne.y
        let x2 = pointTwo.x
        let y2 = pointTwo.y
        let a:CGFloat,b:CGFloat
        a = (y2-y1)/(x2-x1)
        b = y1-a*x1
        let y = a*referenceX+b
        return y
    }
    
    //初始化mountain
    func initMountainLayer(size:CGSize) {
        //第一座山
        let mountainOne:CAShapeLayer = CAShapeLayer()
        let pathOne:UIBezierPath = UIBezierPath()
        pathOne.moveToPoint(CGPoint(x: 0, y: size.height - 120))
        pathOne.addLineToPoint(CGPoint(x: 100, y: 100))
        pathOne.addLineToPoint(CGPoint(x: size.width/3, y: size.height - 100))
        pathOne.addLineToPoint(CGPoint(x: size.width/1.5, y: size.height - 50))
        pathOne.addLineToPoint(CGPoint(x: 0, y: size.height))
        mountainOne.path = pathOne.CGPath
        mountainOne.fillColor = UIColor.whiteColor().CGColor
        view.layer.addSublayer(mountainOne)
        
        let mountainOneLayer:CAShapeLayer = CAShapeLayer()
        let pathLayerOne:UIBezierPath = UIBezierPath()
        pathLayerOne.moveToPoint(CGPoint(x: 0, y: size.height - 120))
        var pathOneHeight = getPoint(CGPoint(x: 0, y: size.height - 120), pointTwo: CGPoint(x: 100, y: 100), referenceX: 55)
        var pathTwoHeight = getPoint(CGPoint(x: 100, y: 100), pointTwo: CGPoint(x: size.width/3, y: size.height - 100), referenceX: 160)

        pathLayerOne.addLineToPoint(CGPoint(x: 55, y: pathOneHeight))
        pathLayerOne.addLineToPoint(CGPoint(x: 70, y: pathOneHeight + 15))
        pathLayerOne.addLineToPoint(CGPoint(x: 90, y: pathOneHeight))
        pathLayerOne.addLineToPoint(CGPoint(x: 110, y: pathOneHeight + 25))
        pathLayerOne.addLineToPoint(CGPoint(x: 130, y: pathOneHeight - 5))
        pathLayerOne.addLineToPoint(CGPoint(x: 160, y: pathTwoHeight))

        pathLayerOne.addLineToPoint(CGPoint(x: size.width/3, y: size.height - 100))
        pathLayerOne.addLineToPoint(CGPoint(x: size.width/1.5, y: size.height - 50))
        pathLayerOne.addLineToPoint(CGPoint(x: 0, y: size.height))
        mountainOneLayer.path = pathLayerOne.CGPath
        mountainOneLayer.fillColor = UIColor.init(red: 104.0/255.0, green: 92.0/255.0, blue: 157.0/255.0, alpha: 1.0).CGColor
        view.layer.addSublayer(mountainOneLayer)
        
        //第二座山
        let mountainTwo:CAShapeLayer = CAShapeLayer()
        let pathTwo:UIBezierPath = UIBezierPath()
        pathTwo.moveToPoint(CGPoint(x: size.width/4, y: size.height - 90))
        pathTwo.addLineToPoint(CGPoint(x: size.width/2.7, y: 200))
        pathTwo.addLineToPoint(CGPoint(x: size.width/1.8, y: size.height - 85))
        pathTwo.addLineToPoint(CGPoint(x: size.width/1.6, y: size.height - 125))
        pathTwo.addLineToPoint(CGPoint(x: size.width/1.35, y: size.height - 70))

        pathTwo.addLineToPoint(CGPoint(x: 0, y: size.height))
        mountainTwo.path = pathTwo.CGPath
        mountainTwo.fillColor = UIColor.whiteColor().CGColor
        view.layer.insertSublayer(mountainTwo, below: mountainOne)
        
        let mountainTwoLayer:CAShapeLayer = CAShapeLayer()
        let pathLayerTwo:UIBezierPath = UIBezierPath()
        pathLayerTwo.moveToPoint(CGPoint(x: 0, y: size.height))
        pathLayerTwo.addLineToPoint(CGPoint(x: size.width/4, y: size.height - 90))
        pathOneHeight = getPoint(CGPoint(x: size.width/4, y: size.height - 90), pointTwo: CGPoint(x: size.width/2.7, y: 200), referenceX: size.width/4+50)
        pathTwoHeight = getPoint(CGPoint(x: size.width/1.8, y: size.height - 85), pointTwo: CGPoint(x: size.width/2.7, y: 200), referenceX: size.width/2.2)
        let pathThreeHeight = getPoint(CGPoint(x: size.width/1.8, y: size.height - 85), pointTwo: CGPoint(x: size.width/1.6, y: size.height - 125), referenceX: size.width/1.67)
        let pathFourHeight = getPoint(CGPoint(x: size.width/1.35, y: size.height - 70), pointTwo: CGPoint(x: size.width/1.6, y: size.height - 125), referenceX: size.width/1.50)
        
        pathLayerTwo.addLineToPoint(CGPoint(x: size.width/4+50, y: pathOneHeight))
        pathLayerTwo.addLineToPoint(CGPoint(x: size.width/4+70, y: pathOneHeight + 15))
        pathLayerTwo.addLineToPoint(CGPoint(x: size.width/4+90, y: pathOneHeight))
        pathLayerTwo.addLineToPoint(CGPoint(x: size.width/4+110, y: pathOneHeight + 15))
        pathLayerTwo.addLineToPoint(CGPoint(x: size.width/2.2, y: pathTwoHeight))
        pathLayerTwo.addLineToPoint(CGPoint(x: size.width/1.8, y: size.height - 85))
        pathLayerTwo.addLineToPoint(CGPoint(x: size.width/1.67, y: pathThreeHeight))
        pathLayerTwo.addLineToPoint(CGPoint(x: size.width/1.65, y: pathThreeHeight+5))
        pathLayerTwo.addLineToPoint(CGPoint(x: size.width/1.60, y: pathThreeHeight-2))
        pathLayerTwo.addLineToPoint(CGPoint(x: size.width/1.58, y: pathFourHeight+2))
        pathLayerTwo.addLineToPoint(CGPoint(x: size.width/1.55, y: pathFourHeight-5))
        pathLayerTwo.addLineToPoint(CGPoint(x: size.width/1.50, y: pathFourHeight))
        pathLayerTwo.addLineToPoint(CGPoint(x: size.width/1.35, y: size.height - 70))
        pathLayerTwo.addLineToPoint(CGPoint(x: 0, y: size.height))
        mountainTwoLayer.path = pathLayerTwo.CGPath
        mountainTwoLayer.fillColor = UIColor.init(colorLiteralRed: 75.0/255.0, green: 65.0/255.0, blue: 111.0/255.0, alpha: 1.0).CGColor
        view.layer.insertSublayer(mountainTwoLayer, below: mountainOne)
    }
    
    //初始化草坪
    func initGrasslandlayer(size:CGSize) -> (CAShapeLayer, CAShapeLayer) {
        let grasslandOne = CAShapeLayer()
        //通过UIBezierPath来绘制路径
        let pathOne:UIBezierPath = UIBezierPath()
        pathOne.moveToPoint(CGPoint(x: 0, y: size.height - 20))
        pathOne.addLineToPoint(CGPoint(x: 0, y: size.height - 100))
        pathOne.addQuadCurveToPoint(CGPoint(x: size.width/3.0, y: size.height - 20), controlPoint: CGPoint(x: size.width/6.0, y: size.height - 100))
        grasslandOne.path = pathOne.CGPath
        //设置草坪的颜色
        grasslandOne.fillColor = UIColor.init(colorLiteralRed: 82.0/255.0, green: 177.0/255.0, blue: 44.0/255.0, alpha: 1.0).CGColor
        view.layer.addSublayer(grasslandOne)
        
        let grasslandTwo = CAShapeLayer()
        let pathTwo:UIBezierPath = UIBezierPath()
        pathTwo.moveToPoint(CGPoint(x: 0, y: size.height - 20))
        pathTwo.addQuadCurveToPoint(CGPoint(x: size.width, y: size.height - 60), controlPoint: CGPoint(x: size.width/2.0, y: size.height - 100))
        pathTwo.addLineToPoint(CGPoint(x: size.width, y: size.height - 20))
        grasslandTwo.path = pathTwo.CGPath
        grasslandTwo.fillColor = UIColor.init(colorLiteralRed: 92.0/255.0, green: 195.0/255.0, blue: 52.0/255.0, alpha: 1.0).CGColor
        view.layer.addSublayer(grasslandTwo)
        
        return (grasslandOne, grasslandTwo)
    }
    
    //初始化大地
    func initGroundLayer(size:CGSize) -> CALayer {
        let ground:CALayer = CALayer()
        ground.frame = CGRect(x: 0, y: size.height - 20, width: size.width, height: 20)
        ground.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "ground")!).CGColor
        view.layer.addSublayer(ground)
        return ground
    }
    
    //初始化黄色轨道
    func initYellowPathLayer(size:CGSize) -> CAShapeLayer {
        let calayer:CAShapeLayer = CAShapeLayer()
        calayer.backgroundColor = UIColor.redColor().CGColor
        calayer.lineWidth = 5
        calayer.strokeColor = UIColor.init(colorLiteralRed: 210.0/255.0, green: 179.0/255.0, blue: 54.0/255.0, alpha: 1.0).CGColor
        let path:UIBezierPath = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: size.height - 70))
        path.addCurveToPoint(CGPoint(x: size.width/1.5, y: 200), controlPoint1: CGPoint(x: size.width/6, y: size.height - 200), controlPoint2: CGPoint(x: size.width/2.5, y: size.height+50))
        path.addQuadCurveToPoint(CGPoint(x: size.width+10, y: size.height/3), controlPoint: CGPoint(x: size.width-100, y: 50))
        path.addLineToPoint(CGPoint(x: size.width + 10, y: size.height+10))
        path.addLineToPoint(CGPoint(x: 0, y: size.height+10))
        calayer.fillColor = UIColor.init(patternImage: UIImage.init(named: "yellow")!).CGColor
        calayer.path = path.CGPath
        view.layer.insertSublayer(calayer, below: groundLayer)
        
        let lineLayer:CAShapeLayer = CAShapeLayer()
        lineLayer.lineCap = kCALineCapRound
        lineLayer.strokeColor = UIColor.whiteColor().CGColor
        lineLayer.lineDashPattern = [NSNumber.init(int: 1),NSNumber.init(int: 5)]
        lineLayer.lineWidth = 2
        lineLayer.fillColor = UIColor.clearColor().CGColor
        lineLayer.path = path.CGPath
        calayer.addSublayer(lineLayer)
        
        return calayer
    }
    
    //初始化绿色轨道
    func initGreenPathLayer(size:CGSize) -> CAShapeLayer {
        let calayer:CAShapeLayer = CAShapeLayer()
        calayer.backgroundColor = UIColor.redColor().CGColor
        calayer.lineWidth = 5
        calayer.fillRule = kCAFillRuleEvenOdd
        calayer.strokeColor = UIColor.init(colorLiteralRed: 0.0/255.0, green: 147.0/255.0, blue: 163.0/255.0, alpha: 1.0).CGColor
        let path:UIBezierPath = UIBezierPath()
        path.lineCapStyle = .Round
        path.lineJoinStyle = .Round
        path.moveToPoint(CGPoint(x: size.width + 10, y: size.height))
        path.addLineToPoint(CGPoint(x: size.width + 10, y: size.height - 70))
        path.addQuadCurveToPoint(CGPoint(x: size.width/1.8, y: size.height - 70), controlPoint: CGPoint(x: size.width - 120, y: 200))
        path.addArcWithCenter(CGPoint(x: size.width/1.9, y: size.height - 140), radius: 70, startAngle: CGFloat(0.5*M_PI), endAngle: CGFloat(2.5*M_PI), clockwise: true)
        path.addCurveToPoint(CGPoint(x: 0, y: size.height - 100), controlPoint1: CGPoint(x: size.width/1.8 - 60, y: size.height - 60), controlPoint2: CGPoint(x: 150, y: size.height/2.3))
        path.addLineToPoint(CGPoint(x: -100, y: size.height + 10))
        calayer.fillColor = UIColor.clearColor().CGColor
        calayer.path = path.CGPath
        view.layer.insertSublayer(calayer, below: groundLayer)
        
        let greenLayer:CAShapeLayer = CAShapeLayer()
        greenLayer.fillRule = kCAFillRuleEvenOdd
        greenLayer.strokeColor = UIColor.init(colorLiteralRed: 0.0/255.0, green: 147.0/255.0, blue: 163.0/255.0, alpha: 1.0).CGColor
        let grennPath:UIBezierPath = UIBezierPath()
        grennPath.moveToPoint(CGPoint(x: size.width + 10, y: size.height))
        grennPath.addLineToPoint(CGPoint(x: size.width + 10, y: size.height - 70))
        grennPath.addQuadCurveToPoint(CGPoint(x: size.width/1.8, y: size.height - 70), controlPoint: CGPoint(x: size.width - 120, y: 200))
        grennPath.addCurveToPoint(CGPoint(x: 0, y: size.height - 100), controlPoint1: CGPoint(x: size.width/1.8 - 60, y: size.height - 60), controlPoint2: CGPoint(x: 150, y: size.height/2.3))
        grennPath.addLineToPoint(CGPoint(x: -100, y: size.height + 10))
        greenLayer.fillColor = UIColor.init(patternImage: UIImage.init(named: "green")!).CGColor
        greenLayer.path = grennPath.CGPath
        view.layer.insertSublayer(greenLayer, below: calayer)

        let lineLayer:CAShapeLayer = CAShapeLayer()
        lineLayer.lineCap = kCALineCapRound
        lineLayer.strokeColor = UIColor.whiteColor().CGColor
        lineLayer.lineDashPattern = [NSNumber.init(int: 1),NSNumber.init(int: 5)]
        lineLayer.lineWidth = 2
        lineLayer.fillColor = UIColor.clearColor().CGColor
        lineLayer.path = path.CGPath
        calayer.addSublayer(lineLayer)
        
        return calayer
    }
    
    //添加黄色轨道的动画
    func addYellowCarPathAnimation() {
        let carLayer:CALayer = CALayer()
        carLayer.frame = CGRect(x: 0, y: 0, width: 17, height: 11)
        carLayer.setAffineTransform(CGAffineTransformTranslate(carLayer.affineTransform(), 0, -7))
        carLayer.contents = UIImage.init(named: "car")!.CGImage
        let animation:CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "position")
        animation.path = yellowPath?.path
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        animation.duration = 6
        animation.repeatCount = MAXFLOAT
        animation.autoreverses = false
        animation.calculationMode = kCAAnimationCubicPaced
        animation.rotationMode = kCAAnimationRotateAuto
        yellowPath?.addSublayer(carLayer)
        carLayer.addAnimation(animation, forKey: "carAnimation")
    }
    
    //添加绿色轨道的动画
    func addGreenCarPathAnimation(size:CGSize) {
        let carLayer:CALayer = CALayer()
        carLayer.frame = CGRect(x: 0, y: 0, width: 17, height: 11)
        carLayer.contents = UIImage.init(named: "otherCar")!.CGImage
        
        //绘制路径
        let path:UIBezierPath = UIBezierPath()
        path.lineCapStyle = .Round
        path.lineJoinStyle = .Round
        path.moveToPoint(CGPoint(x: size.width + 10, y: size.height - 7))
        path.addLineToPoint(CGPoint(x: size.width + 10, y: size.height - 77))
        path.addQuadCurveToPoint(CGPoint(x: size.width/1.8, y: size.height - 77), controlPoint: CGPoint(x: size.width - 120, y: 193))
        path.addArcWithCenter(CGPoint(x: size.width/1.9, y: size.height - 140), radius: 63, startAngle: CGFloat(0.5*M_PI), endAngle: CGFloat(2.5*M_PI), clockwise: true)
        path.addCurveToPoint(CGPoint(x: 0, y: size.height - 107), controlPoint1: CGPoint(x: size.width/1.8 - 60, y: size.height - 67), controlPoint2: CGPoint(x: 150, y: size.height/2.3-7))
        path.addLineToPoint(CGPoint(x: -100, y: size.height + 7))
        
        //关键帧动画作用于position
        let animation:CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "position")
        animation.path = path.CGPath
        //动画节奏为线性动画
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        //动画时间
        animation.duration = 6
        //动画重复次数
        animation.repeatCount = MAXFLOAT
        //动画是否逆转
        animation.autoreverses = false
        animation.calculationMode = kCAAnimationCubicPaced
        //动画角度是否调整
        animation.rotationMode = kCAAnimationRotateAuto
        view.layer.addSublayer(carLayer)
        carLayer.addAnimation(animation, forKey: "carAnimation")
    }
    
    //初始化云朵动画
    func addCloudAnimation(size:CGSize) -> CALayer {
        let cloudLayer:CALayer = CALayer()
        cloudLayer.contents = UIImage.init(named: "cloud")?.CGImage
        cloudLayer.frame = CGRect(x: 0, y: 0, width: 63, height: 20)
        view.layer.addSublayer(cloudLayer)
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: size.width + 63, y: 40))
        path.addLineToPoint(CGPoint(x: -63, y: 40))
        
        let animation = CAKeyframeAnimation.init(keyPath: "position")
        animation.path = path.CGPath
        animation.duration = 40
        animation.autoreverses = false
        animation.repeatCount = MAXFLOAT
        animation.calculationMode = kCAAnimationPaced
        cloudLayer.addAnimation(animation, forKey: "position")        
        return cloudLayer
    }
    
    //添加树
    func addTreeLayer(size:CGSize) {
        for index in 0...6 {
            let treeOne = CALayer()
            treeOne.contents = UIImage.init(named: "tree")?.CGImage
            treeOne.frame = CGRect(x: [5,55,70,size.width/3+15,size.width/3+25,size.width-130,size.width-160][index], y: size.height - 43, width: 13, height: 23)
            view.layer.addSublayer(treeOne)
        }
        for index in 0...3 {
            let treeOne = CALayer()
            treeOne.contents = UIImage.init(named: "tree")?.CGImage
            treeOne.frame = CGRect(x: [10,60,size.width/3,size.width-150][index], y: size.height - 52, width: 18, height: 32)
            view.layer.addSublayer(treeOne)
        }
        for index in 0...1 {
            let treeOne = CALayer()
            treeOne.contents = UIImage.init(named: "tree")?.CGImage
            treeOne.frame = CGRect(x: [size.width-210,size.width-50][index], y: [size.height - 75,size.height - 80][index], width: 18, height: 32)
            view.layer.insertSublayer(treeOne, below: yellowPath)
        }
        for index in 0...2 {
            let treeOne = CALayer()
            treeOne.contents = UIImage.init(named: "tree")?.CGImage
            treeOne.frame = CGRect(x: [size.width-235, size.width-220, size.width-40][index], y: [size.height - 67 ,size.height - 67 , size.height - 72][index], width: 13, height: 23)
            view.layer.insertSublayer(treeOne, below: yellowPath)
        }
    }
    
    //初始化背景
    func initGradientLayer(size:CGSize) -> CAGradientLayer {
        let layer:CAGradientLayer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height - 20)
        //设置渐变的颜色
        layer.colors = [UIColor.init(colorLiteralRed: 178.0/255.0, green: 226.0/255.0, blue: 248.0/255.0, alpha: 1.0).CGColor, UIColor.init(colorLiteralRed: 232.0/255.0, green: 244.0/255.0, blue: 193.0/255.0, alpha: 1.0).CGColor]
        //设置渐变的方向为从左到右
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.addSublayer(layer)
        return layer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

