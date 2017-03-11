//
//  RollerCoasterLayer.swift
//  RollerCoasterAnimation
//
// **************************************************
// *                                  _____         *
// *         __  _  __     ___        \   /         *
// *         \ \/ \/ /    / __\       /  /          *
// *          \  _  /    | (__       /  /           *
// *           \/ \/      \___/     /  /__          *
// *                               /_____/          *
// *                                                *
// **************************************************
//  Github  :https://github.com/631106979
//  HomePage:http://imwcl.com
//  CSDN    :http://blog.csdn.net/wang631106979
//
//  Created by 王崇磊 on 16/9/14.
//  Copyright © 2016年 王崇磊. All rights reserved.
//
// @class RollerCoasterLayer
// @abstract RollerCoasterLayer
// @discussion RollerCoasterLayer
//

import UIKit

class RollerCoasterLayer: CALayer {
    
    var groundLayer:CALayer?
    var yellowPath:CAShapeLayer?
    var greenPath:CAShapeLayer?
    
    init(frame: CGRect) {
        super.init()
        self.frame = frame
        initLayers(size: frame.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initLayers(size: CGSize) {
        initGradientLayer(size)
        initMountainLayer(size)
        initGrasslandlayer(size)
        groundLayer = initGroundLayer(size)
        yellowPath = initYellowPathLayer(size)
        greenPath = initGreenPathLayer(size)
        for index in 0...4 {
            addYellowCarPathAnimation(beginTime: CACurrentMediaTime() + 0.07 * Double(index))
        }
        for index in 0...4 {
            addGreenCarPathAnimation(size, beginTime: CACurrentMediaTime() + 0.085 * Double(index))
        }
        addCloudAnimation(size)
        addTreeLayer(size)
    }
    
    
    func getPoint(_ pointOne:CGPoint, pointTwo:CGPoint, referenceX:CGFloat) ->CGFloat  {
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
    func initMountainLayer(_ size:CGSize) {
        //第一座山
        let mountainOne:CAShapeLayer = CAShapeLayer()
        let pathOne:UIBezierPath = UIBezierPath()
        pathOne.move(to: CGPoint(x: 0, y: size.height - 120))
        pathOne.addLine(to: CGPoint(x: 100, y: 100))
        pathOne.addLine(to: CGPoint(x: size.width/3, y: size.height - 100))
        pathOne.addLine(to: CGPoint(x: size.width/1.5, y: size.height - 50))
        pathOne.addLine(to: CGPoint(x: 0, y: size.height))
        mountainOne.path = pathOne.cgPath
        mountainOne.fillColor = UIColor.white.cgColor
        addSublayer(mountainOne)
        
        let mountainOneLayer:CAShapeLayer = CAShapeLayer()
        let pathLayerOne:UIBezierPath = UIBezierPath()
        pathLayerOne.move(to: CGPoint(x: 0, y: size.height - 120))
        var pathOneHeight = getPoint(CGPoint(x: 0, y: size.height - 120), pointTwo: CGPoint(x: 100, y: 100), referenceX: 55)
        var pathTwoHeight = getPoint(CGPoint(x: 100, y: 100), pointTwo: CGPoint(x: size.width/3, y: size.height - 100), referenceX: 160)
        
        pathLayerOne.addLine(to: CGPoint(x: 55, y: pathOneHeight))
        pathLayerOne.addLine(to: CGPoint(x: 70, y: pathOneHeight + 15))
        pathLayerOne.addLine(to: CGPoint(x: 90, y: pathOneHeight))
        pathLayerOne.addLine(to: CGPoint(x: 110, y: pathOneHeight + 25))
        pathLayerOne.addLine(to: CGPoint(x: 130, y: pathOneHeight - 5))
        pathLayerOne.addLine(to: CGPoint(x: 160, y: pathTwoHeight))
        
        pathLayerOne.addLine(to: CGPoint(x: size.width/3, y: size.height - 100))
        pathLayerOne.addLine(to: CGPoint(x: size.width/1.5, y: size.height - 50))
        pathLayerOne.addLine(to: CGPoint(x: 0, y: size.height))
        mountainOneLayer.path = pathLayerOne.cgPath
        mountainOneLayer.fillColor = UIColor.init(red: 104.0/255.0, green: 92.0/255.0, blue: 157.0/255.0, alpha: 1.0).cgColor
        addSublayer(mountainOneLayer)
        
        //第二座山
        let mountainTwo:CAShapeLayer = CAShapeLayer()
        let pathTwo:UIBezierPath = UIBezierPath()
        pathTwo.move(to: CGPoint(x: size.width/4, y: size.height - 90))
        pathTwo.addLine(to: CGPoint(x: size.width/2.7, y: 200))
        pathTwo.addLine(to: CGPoint(x: size.width/1.8, y: size.height - 85))
        pathTwo.addLine(to: CGPoint(x: size.width/1.6, y: size.height - 125))
        pathTwo.addLine(to: CGPoint(x: size.width/1.35, y: size.height - 70))
        
        pathTwo.addLine(to: CGPoint(x: 0, y: size.height))
        mountainTwo.path = pathTwo.cgPath
        mountainTwo.fillColor = UIColor.white.cgColor
        insertSublayer(mountainTwo, below: mountainOne)
        
        let mountainTwoLayer:CAShapeLayer = CAShapeLayer()
        let pathLayerTwo:UIBezierPath = UIBezierPath()
        pathLayerTwo.move(to: CGPoint(x: 0, y: size.height))
        pathLayerTwo.addLine(to: CGPoint(x: size.width/4, y: size.height - 90))
        pathOneHeight = getPoint(CGPoint(x: size.width/4, y: size.height - 90), pointTwo: CGPoint(x: size.width/2.7, y: 200), referenceX: size.width/4+50)
        pathTwoHeight = getPoint(CGPoint(x: size.width/1.8, y: size.height - 85), pointTwo: CGPoint(x: size.width/2.7, y: 200), referenceX: size.width/2.2)
        let pathThreeHeight = getPoint(CGPoint(x: size.width/1.8, y: size.height - 85), pointTwo: CGPoint(x: size.width/1.6, y: size.height - 125), referenceX: size.width/1.67)
        let pathFourHeight = getPoint(CGPoint(x: size.width/1.35, y: size.height - 70), pointTwo: CGPoint(x: size.width/1.6, y: size.height - 125), referenceX: size.width/1.50)
        
        pathLayerTwo.addLine(to: CGPoint(x: size.width/4+50, y: pathOneHeight))
        pathLayerTwo.addLine(to: CGPoint(x: size.width/4+70, y: pathOneHeight + 15))
        pathLayerTwo.addLine(to: CGPoint(x: size.width/4+90, y: pathOneHeight))
        pathLayerTwo.addLine(to: CGPoint(x: size.width/4+110, y: pathOneHeight + 15))
        pathLayerTwo.addLine(to: CGPoint(x: size.width/2.2, y: pathTwoHeight))
        pathLayerTwo.addLine(to: CGPoint(x: size.width/1.8, y: size.height - 85))
        pathLayerTwo.addLine(to: CGPoint(x: size.width/1.67, y: pathThreeHeight))
        pathLayerTwo.addLine(to: CGPoint(x: size.width/1.65, y: pathThreeHeight+5))
        pathLayerTwo.addLine(to: CGPoint(x: size.width/1.60, y: pathThreeHeight-2))
        pathLayerTwo.addLine(to: CGPoint(x: size.width/1.58, y: pathFourHeight+2))
        pathLayerTwo.addLine(to: CGPoint(x: size.width/1.55, y: pathFourHeight-5))
        pathLayerTwo.addLine(to: CGPoint(x: size.width/1.50, y: pathFourHeight))
        pathLayerTwo.addLine(to: CGPoint(x: size.width/1.35, y: size.height - 70))
        pathLayerTwo.addLine(to: CGPoint(x: 0, y: size.height))
        mountainTwoLayer.path = pathLayerTwo.cgPath
        mountainTwoLayer.fillColor = UIColor.init(colorLiteralRed: 75.0/255.0, green: 65.0/255.0, blue: 111.0/255.0, alpha: 1.0).cgColor
        insertSublayer(mountainTwoLayer, below: mountainOne)
    }
    
    //初始化草坪
    @discardableResult
    func initGrasslandlayer(_ size:CGSize) -> (CAShapeLayer, CAShapeLayer) {
        let grasslandOne = CAShapeLayer()
        //通过UIBezierPath来绘制路径
        let pathOne:UIBezierPath = UIBezierPath()
        pathOne.move(to: CGPoint(x: 0, y: size.height - 20))
        pathOne.addLine(to: CGPoint(x: 0, y: size.height - 100))
        pathOne.addQuadCurve(to: CGPoint(x: size.width/3.0, y: size.height - 20), controlPoint: CGPoint(x: size.width/6.0, y: size.height - 100))
        grasslandOne.path = pathOne.cgPath
        //设置草坪的颜色
        grasslandOne.fillColor = UIColor.init(colorLiteralRed: 82.0/255.0, green: 177.0/255.0, blue: 44.0/255.0, alpha: 1.0).cgColor
        addSublayer(grasslandOne)
        
        let grasslandTwo = CAShapeLayer()
        let pathTwo:UIBezierPath = UIBezierPath()
        pathTwo.move(to: CGPoint(x: 0, y: size.height - 20))
        pathTwo.addQuadCurve(to: CGPoint(x: size.width, y: size.height - 60), controlPoint: CGPoint(x: size.width/2.0, y: size.height - 100))
        pathTwo.addLine(to: CGPoint(x: size.width, y: size.height - 20))
        grasslandTwo.path = pathTwo.cgPath
        grasslandTwo.fillColor = UIColor.init(colorLiteralRed: 92.0/255.0, green: 195.0/255.0, blue: 52.0/255.0, alpha: 1.0).cgColor
        addSublayer(grasslandTwo)
        
        return (grasslandOne, grasslandTwo)
    }
    
    //初始化大地
    func initGroundLayer(_ size:CGSize) -> CALayer {
        let ground:CALayer = CALayer()
        ground.frame = CGRect(x: 0, y: size.height - 20, width: size.width, height: 20)
        ground.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "ground")!).cgColor
        addSublayer(ground)
        return ground
    }
    
    //初始化黄色轨道
    func initYellowPathLayer(_ size:CGSize) -> CAShapeLayer {
        let calayer:CAShapeLayer = CAShapeLayer()
        calayer.backgroundColor = UIColor.red.cgColor
        calayer.lineWidth = 5
        calayer.strokeColor = UIColor.init(colorLiteralRed: 210.0/255.0, green: 179.0/255.0, blue: 54.0/255.0, alpha: 1.0).cgColor
        let path:UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: size.height - 70))
        path.addCurve(to: CGPoint(x: size.width/1.5, y: 200), controlPoint1: CGPoint(x: size.width/6, y: size.height - 200), controlPoint2: CGPoint(x: size.width/2.5, y: size.height+50))
        path.addQuadCurve(to: CGPoint(x: size.width+10, y: size.height/3), controlPoint: CGPoint(x: size.width-100, y: 50))
        path.addLine(to: CGPoint(x: size.width + 10, y: size.height+10))
        path.addLine(to: CGPoint(x: 0, y: size.height+10))
        calayer.fillColor = UIColor.init(patternImage: UIImage.init(named: "yellow")!).cgColor
        calayer.path = path.cgPath
        insertSublayer(calayer, below: groundLayer)
        
        let lineLayer:CAShapeLayer = CAShapeLayer()
        lineLayer.lineCap = kCALineCapRound
        lineLayer.strokeColor = UIColor.white.cgColor
        lineLayer.lineDashPattern = [NSNumber.init(value: 1 as Int32),NSNumber.init(value: 5 as Int32)]
        lineLayer.lineWidth = 2
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.path = path.cgPath
        calayer.addSublayer(lineLayer)
        
        return calayer
    }
    
    //初始化绿色轨道
    func initGreenPathLayer(_ size:CGSize) -> CAShapeLayer {
        let calayer:CAShapeLayer = CAShapeLayer()
        calayer.backgroundColor = UIColor.red.cgColor
        calayer.lineWidth = 5
        calayer.fillRule = kCAFillRuleEvenOdd
        calayer.strokeColor = UIColor.init(colorLiteralRed: 0.0/255.0, green: 147.0/255.0, blue: 163.0/255.0, alpha: 1.0).cgColor
        let path:UIBezierPath = UIBezierPath()
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        path.move(to: CGPoint(x: size.width + 10, y: size.height))
        path.addLine(to: CGPoint(x: size.width + 10, y: size.height - 70))
        path.addQuadCurve(to: CGPoint(x: size.width/1.8, y: size.height - 70), controlPoint: CGPoint(x: size.width - 120, y: 200))
        path.addArc(withCenter: CGPoint(x: size.width/1.9, y: size.height - 140), radius: 70, startAngle: CGFloat(0.5*M_PI), endAngle: CGFloat(2.5*M_PI), clockwise: true)
        path.addCurve(to: CGPoint(x: 0, y: size.height - 100), controlPoint1: CGPoint(x: size.width/1.8 - 60, y: size.height - 60), controlPoint2: CGPoint(x: 150, y: size.height/2.3))
        path.addLine(to: CGPoint(x: -100, y: size.height + 10))
        calayer.fillColor = UIColor.clear.cgColor
        calayer.path = path.cgPath
        insertSublayer(calayer, below: groundLayer)
        
        let greenLayer:CAShapeLayer = CAShapeLayer()
        greenLayer.fillRule = kCAFillRuleEvenOdd
        greenLayer.strokeColor = UIColor.init(colorLiteralRed: 0.0/255.0, green: 147.0/255.0, blue: 163.0/255.0, alpha: 1.0).cgColor
        let grennPath:UIBezierPath = UIBezierPath()
        grennPath.move(to: CGPoint(x: size.width + 10, y: size.height))
        grennPath.addLine(to: CGPoint(x: size.width + 10, y: size.height - 70))
        grennPath.addQuadCurve(to: CGPoint(x: size.width/1.8, y: size.height - 70), controlPoint: CGPoint(x: size.width - 120, y: 200))
        grennPath.addCurve(to: CGPoint(x: 0, y: size.height - 100), controlPoint1: CGPoint(x: size.width/1.8 - 60, y: size.height - 60), controlPoint2: CGPoint(x: 150, y: size.height/2.3))
        grennPath.addLine(to: CGPoint(x: -100, y: size.height + 10))
        greenLayer.fillColor = UIColor.init(patternImage: UIImage.init(named: "green")!).cgColor
        greenLayer.path = grennPath.cgPath
        insertSublayer(greenLayer, below: calayer)
        
        let lineLayer:CAShapeLayer = CAShapeLayer()
        lineLayer.lineCap = kCALineCapRound
        lineLayer.strokeColor = UIColor.white.cgColor
        lineLayer.lineDashPattern = [NSNumber.init(value: 1 as Int32),NSNumber.init(value: 5 as Int32)]
        lineLayer.lineWidth = 2
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.path = path.cgPath
        calayer.addSublayer(lineLayer)
        
        return calayer
    }
    
    //添加黄色轨道的动画
    func addYellowCarPathAnimation(beginTime: CFTimeInterval) {
        let carLayer:CALayer = CALayer()
        carLayer.frame = CGRect(x: 0, y: 0, width: 17, height: 11)
        carLayer.setAffineTransform(carLayer.affineTransform().translatedBy(x: 0, y: -7))
        carLayer.contents = UIImage.init(named: "car")!.cgImage
        let animation:CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "position")
        animation.path = yellowPath?.path
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        animation.duration = 6
        animation.beginTime = beginTime
        animation.repeatCount = MAXFLOAT
        animation.autoreverses = false
        animation.calculationMode = kCAAnimationCubicPaced
        animation.rotationMode = kCAAnimationRotateAuto
        yellowPath?.addSublayer(carLayer)
        carLayer.add(animation, forKey: "carAnimation")
    }
    
    //添加绿色轨道的动画
    func addGreenCarPathAnimation(_ size:CGSize, beginTime: CFTimeInterval) {
        let carLayer:CALayer = CALayer()
        carLayer.frame = CGRect(x: 0, y: 0, width: 17, height: 11)
        carLayer.contents = UIImage.init(named: "otherCar")!.cgImage
        
        //绘制路径
        let path:UIBezierPath = UIBezierPath()
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        path.move(to: CGPoint(x: size.width + 10, y: size.height - 7))
        path.addLine(to: CGPoint(x: size.width + 10, y: size.height - 77))
        path.addQuadCurve(to: CGPoint(x: size.width/1.8, y: size.height - 77), controlPoint: CGPoint(x: size.width - 120, y: 193))
        path.addArc(withCenter: CGPoint(x: size.width/1.9, y: size.height - 140), radius: 63, startAngle: CGFloat(0.5*M_PI), endAngle: CGFloat(2.5*M_PI), clockwise: true)
        path.addCurve(to: CGPoint(x: 0, y: size.height - 107), controlPoint1: CGPoint(x: size.width/1.8 - 60, y: size.height - 67), controlPoint2: CGPoint(x: 150, y: size.height/2.3-7))
        path.addLine(to: CGPoint(x: -100, y: size.height + 7))
        
        //关键帧动画作用于position
        let animation:CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "position")
        animation.path = path.cgPath
        //动画节奏为线性动画
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        //动画时间
        animation.duration = 6
        //动画重复次数
        animation.repeatCount = MAXFLOAT
        //动画是否逆转
        animation.autoreverses = false
        animation.calculationMode = kCAAnimationCubicPaced
        animation.beginTime = beginTime
        //动画角度是否调整
        animation.rotationMode = kCAAnimationRotateAuto
        addSublayer(carLayer)
        carLayer.add(animation, forKey: "carAnimation")
    }
    
    //初始化云朵动画
    @discardableResult
    func addCloudAnimation(_ size:CGSize) -> CALayer {
        let cloudLayer:CALayer = CALayer()
        cloudLayer.contents = UIImage.init(named: "cloud")?.cgImage
        cloudLayer.frame = CGRect(x: 0, y: 0, width: 63, height: 20)
        addSublayer(cloudLayer)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: size.width + 63, y: 40))
        path.addLine(to: CGPoint(x: -63, y: 40))
        
        let animation = CAKeyframeAnimation.init(keyPath: "position")
        animation.path = path.cgPath
        animation.duration = 40
        animation.autoreverses = false
        animation.repeatCount = MAXFLOAT
        animation.calculationMode = kCAAnimationPaced
        cloudLayer.add(animation, forKey: "position")
        return cloudLayer
    }
    
    //添加树
    func addTreeLayer(_ size:CGSize) {
        for index in 0...6 {
            let treeOne = CALayer()
            treeOne.contents = UIImage.init(named: "tree")?.cgImage
            treeOne.frame = CGRect(x: [5,55,70,size.width/3+15,size.width/3+25,size.width-130,size.width-160][index], y: size.height - 43, width: 13, height: 23)
            addSublayer(treeOne)
        }
        for index in 0...3 {
            let treeOne = CALayer()
            treeOne.contents = UIImage.init(named: "tree")?.cgImage
            treeOne.frame = CGRect(x: [10,60,size.width/3,size.width-150][index], y: size.height - 52, width: 18, height: 32)
            addSublayer(treeOne)
        }
        for index in 0...1 {
            let treeOne = CALayer()
            treeOne.contents = UIImage.init(named: "tree")?.cgImage
            treeOne.frame = CGRect(x: [size.width-210,size.width-50][index], y: [size.height - 75,size.height - 80][index], width: 18, height: 32)
            insertSublayer(treeOne, below: yellowPath)
        }
        for index in 0...2 {
            let treeOne = CALayer()
            treeOne.contents = UIImage.init(named: "tree")?.cgImage
            treeOne.frame = CGRect(x: [size.width-235, size.width-220, size.width-40][index], y: [size.height - 67 ,size.height - 67 , size.height - 72][index], width: 13, height: 23)
            insertSublayer(treeOne, below: yellowPath)
        }
    }
    
    //初始化背景
    @discardableResult
    func initGradientLayer(_ size:CGSize) -> CAGradientLayer {
        let layer:CAGradientLayer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height - 20)
        //设置渐变的颜色
        layer.colors = [UIColor.init(colorLiteralRed: 178.0/255.0, green: 226.0/255.0, blue: 248.0/255.0, alpha: 1.0).cgColor, UIColor.init(colorLiteralRed: 232.0/255.0, green: 244.0/255.0, blue: 193.0/255.0, alpha: 1.0).cgColor]
        //设置渐变的方向为从左到右
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        addSublayer(layer)
        return layer
    }

}
