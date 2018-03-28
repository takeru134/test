//
//  ViewController.swift
//  test
//
//  Created by T.Murakawa on 2018/03/03.
//  Copyright © 2018年 takeru murakawa. All rights reserved.
//  yutaka branch henkou
//  Daichi mo henkou

import UIKit

class ViewController: UIViewController {


    @IBOutlet var percentageOfMonth: UILabel!
    @IBOutlet var percentageOfDay: UILabel!
    @IBOutlet var percentageOfHour: UILabel!
    
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var hourLabel: UILabel!
    
    private var month:Double = 0
    private var day:Double = 0
    private var hour:Double = 0
    
    private let pi = CGFloat(Double.pi)
    private let start0:CGFloat = 0
    private let end0 :CGFloat = 2 * CGFloat(Double.pi)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.getNowTime()
        
        self.percentageOfMonth.center = CGPoint(x:self.view.frame.width/4, y:self.view.frame.height/4)
        self.percentageOfDay.center = CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/4)
        self.percentageOfHour.center = CGPoint(x:self.view.frame.width/4*3, y:self.view.frame.height/4)
        
        self.view.bringSubview(toFront: percentageOfMonth)
        self.view.bringSubview(toFront: percentageOfDay)
        self.view.bringSubview(toFront: percentageOfHour)
        
        self.monthLabel.center = CGPoint(x:self.view.frame.width/4, y:self.view.frame.height/4 + 50)
        self.dayLabel.center = CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/4 + 50)
        self.hourLabel.center = CGPoint(x:self.view.frame.width/4*3, y:self.view.frame.height/4 + 50)

    }

    func getNowTime(){
        print("getNowTime()")
        
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")!
        calendar.locale = Locale(identifier: "ja")
        calendar = Calendar(identifier: .gregorian)
        
        let currentMonth = calendar.component(.month, from: Date())
        let currentDay = calendar.component(.day, from: Date())
        let currentHour = calendar.component(.hour, from: Date())

        self.month = round(Double(currentMonth) / 12 * 100)
        self.day = round(Double(currentDay) / self.CalcLastDay() * 100)
        self.hour = round(Double(currentHour) / 24 * 100)
        
        self.percentageOfMonth.text = Int(self.month).description + "%"
        self.percentageOfDay.text = Int(self.day).description + "%"
        self.percentageOfHour.text = Int(self.hour).description + "%"
        
        
        self.drawGraphPercentageOfMonth(num: self.month)
        self.drawGraphPercentageOfDay(num: self.day)
        self.drawGraphPercentageOfHour(num: self.hour)

    }
    
    func CalcLastDay()->Double{
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")!
        calendar.locale = Locale(identifier: "ja")
        calendar = Calendar(identifier: .gregorian)
        
        let comps = calendar.dateComponents([.year, .month], from: Date())
        let firstday = calendar.date(from: comps)
        let add = DateComponents(month: 1, day: -1)
        let lastday = calendar.date(byAdding: add, to: firstday!)
        let lastDay = calendar.component(.day, from: lastday!)
        
        return Double(lastDay)
    }
    
    func drawGraphPercentageOfMonth(num:Double){
        
        let path1: UIBezierPath = UIBezierPath();
        path1.move(to: CGPoint(x:self.view.frame.width/4, y:self.view.frame.height/4))
        path1.addArc(withCenter: CGPoint(x:self.view.frame.width/4, y:self.view.frame.height/4), radius: 30, startAngle: start0, endAngle: end0, clockwise: true) // 円弧
        
        let layer1 = CAShapeLayer()
        layer1.fillColor = UIColor.gray.cgColor
        layer1.path = path1.cgPath
        
        self.view.layer.addSublayer(layer1)
    
        let start:CGFloat = 1.5 * pi // 開始の角度
        let end :CGFloat = CGFloat(num)/100 * 2 * pi  - 0.5 * pi//- 1.5 * pi// 終了の角度
        
        let path2: UIBezierPath = UIBezierPath();
        path2.move(to: CGPoint(x:self.view.frame.width/4, y:self.view.frame.height/4))
        path2.addArc(withCenter: CGPoint(x:self.view.frame.width/4, y:self.view.frame.height/4), radius: 30, startAngle: start, endAngle: end, clockwise: true) // 円弧
        
        let layer2 = CAShapeLayer()
        layer2.fillColor = UIColor.green.cgColor
        layer2.path = path2.cgPath
        
        self.view.layer.addSublayer(layer2)
        
        let path3: UIBezierPath = UIBezierPath();
        path3.move(to: CGPoint(x:self.view.frame.width/4, y:self.view.frame.height/4))
        path3.addArc(withCenter: CGPoint(x:self.view.frame.width/4, y:self.view.frame.height/4), radius: 20, startAngle: start0, endAngle: end0, clockwise: true) // 円弧
        
        let layer3 = CAShapeLayer()
        layer3.fillColor = UIColor.white.cgColor
        layer3.path = path3.cgPath
        
        self.view.layer.addSublayer(layer3)

    }
    
    func drawGraphPercentageOfDay(num:Double){

        let path1: UIBezierPath = UIBezierPath();
        path1.move(to: CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/4))
        path1.addArc(withCenter: CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/4), radius: 30, startAngle: start0, endAngle: end0, clockwise: true) // 円弧
        
        let layer1 = CAShapeLayer()
        layer1.fillColor = UIColor.gray.cgColor
        layer1.path = path1.cgPath
        
        self.view.layer.addSublayer(layer1)
        
        let start:CGFloat = 1.5 * pi // 開始の角度
        let end :CGFloat = CGFloat(num)/100 * 2 * pi  - 0.5 * pi//- 1.5 * pi// 終了の角度
        
        let path2: UIBezierPath = UIBezierPath();
        path2.move(to: CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/4))
        path2.addArc(withCenter: CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/4), radius: 30, startAngle: start, endAngle: end, clockwise: true) // 円弧
        
        let layer2 = CAShapeLayer()
        layer2.fillColor = UIColor.green.cgColor
        layer2.path = path2.cgPath
        
        self.view.layer.addSublayer(layer2)
        
        let path3: UIBezierPath = UIBezierPath();
        path3.move(to: CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/4))
        path3.addArc(withCenter: CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/4), radius: 20, startAngle: start0, endAngle: end0, clockwise: true) // 円弧
        
        let layer3 = CAShapeLayer()
        layer3.fillColor = UIColor.white.cgColor
        layer3.path = path3.cgPath
        
        self.view.layer.addSublayer(layer3)
    }
    
    func drawGraphPercentageOfHour(num:Double){

        let path1: UIBezierPath = UIBezierPath();
        path1.move(to: CGPoint(x:self.view.frame.width/4*3, y:self.view.frame.height/4))
        path1.addArc(withCenter: CGPoint(x:self.view.frame.width/4*3, y:self.view.frame.height/4), radius: 30, startAngle: start0, endAngle: end0, clockwise: true) // 円弧
        
        let layer1 = CAShapeLayer()
        layer1.fillColor = UIColor.gray.cgColor
        layer1.path = path1.cgPath
        
        self.view.layer.addSublayer(layer1)
        
        let start:CGFloat = 1.5 * pi // 開始の角度
        let end :CGFloat = CGFloat(num)/100 * 2 * pi  - 0.5 * pi//- 1.5 * pi// 終了の角度
        
        let path2: UIBezierPath = UIBezierPath();
        path2.move(to: CGPoint(x:self.view.frame.width/4*3, y:self.view.frame.height/4))
        path2.addArc(withCenter: CGPoint(x:self.view.frame.width/4*3, y:self.view.frame.height/4), radius: 30, startAngle: start, endAngle: end, clockwise: true) // 円弧
        
        let layer2 = CAShapeLayer()
        layer2.fillColor = UIColor.green.cgColor
        layer2.path = path2.cgPath
        
        self.view.layer.addSublayer(layer2)
        
        let path3: UIBezierPath = UIBezierPath();
        path3.move(to: CGPoint(x:self.view.frame.width/4*3, y:self.view.frame.height/4))
        path3.addArc(withCenter: CGPoint(x:self.view.frame.width/4*3, y:self.view.frame.height/4), radius: 20, startAngle: start0, endAngle: end0, clockwise: true) // 円弧
        
        let layer3 = CAShapeLayer()
        layer3.fillColor = UIColor.white.cgColor
        layer3.path = path3.cgPath
        
        self.view.layer.addSublayer(layer3)
    }


    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    //メモリがやばいときに呼ばれるfunction
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

