//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        //создаём таблицу на сцене
        createTable(on: view)
        //названия строк
        let dTLabel = getHeaderLabel(x: 13, y: 100, width: 50, height: 50, text: "dT, K")
        view.addSubview(dTLabel)
        let iMaxLabel = getHeaderLabel(x: 13, y: 150, width: 50, height: 50, text: "Imax, A")
        view.addSubview(iMaxLabel)
        let qMaxLabel = getHeaderLabel(x: 13, y: 200, width: 50, height: 50, text: "Qmax, W")
        view.addSubview(qMaxLabel)
        let uMaxLabel = getHeaderLabel(x: 13, y: 250, width: 50, height: 50, text: "Umax, V")
        view.addSubview(uMaxLabel)
        let rAcLabel = getHeaderLabel(x: 13, y: 300, width: 50, height: 50, text: "Rac, Ohm")
        view.addSubview(rAcLabel)
        //названия столбцов
        let dT69Label = getHeaderLabel(x: 63, y: 100, width: 50, height: 50, text: "69")
        view.addSubview(dT69Label)
        let dT70Label = getHeaderLabel(x: 113, y: 100, width: 50, height: 50, text: "70")
        view.addSubview(dT70Label)
        let dT71Label = getHeaderLabel(x: 163, y: 100, width: 50, height: 50, text: "71")
        view.addSubview(dT71Label)
        let dT72Label = getHeaderLabel(x: 213, y: 100, width: 50, height: 50, text: "72")
        view.addSubview(dT72Label)
        let dT73Label = getHeaderLabel(x: 263, y: 100, width: 50, height: 50, text: "73")
        view.addSubview(dT73Label)
        let dT74Label = getHeaderLabel(x: 313, y: 100, width: 50, height: 50, text: "74")
        view.addSubview(dT74Label)
        //ячейки Imax
        let iMax69 = getLabel(x: 63, y: 150, width: 50, height: 50, text: "Imax69")
        view.addSubview(iMax69)
        let iMax70 = getLabel(x: 113, y: 150, width: 50, height: 50, text: "Imax70")
        view.addSubview(iMax70)
        let iMax71 = getLabel(x: 163, y: 150, width: 50, height: 50, text: "Imax71")
        view.addSubview(iMax71)
        let iMax72 = getLabel(x: 213, y: 150, width: 50, height: 50, text: "Imax72")
        view.addSubview(iMax72)
        let iMax73 = getLabel(x: 263, y: 150, width: 50, height: 50, text: "Imax73")
        view.addSubview(iMax73)
        let iMax74 = getLabel(x: 313, y: 150, width: 50, height: 50, text: "Imax74")
        view.addSubview(iMax74)
        //ячейки Qmax
        let qMax69 = getLabel(x: 63, y: 200, width: 50, height: 50, text: "Qmax69")
        view.addSubview(qMax69)
        let qMax70 = getLabel(x: 113, y: 200, width: 50, height: 50, text: "Qmax70")
        view.addSubview(qMax70)
        let qMax71 = getLabel(x: 163, y: 200, width: 50, height: 50, text: "Qmax71")
        view.addSubview(qMax71)
        let qMax72 = getLabel(x: 213, y: 200, width: 50, height: 50, text: "Qmax72")
        view.addSubview(qMax72)
        let qMax73 = getLabel(x: 263, y: 200, width: 50, height: 50, text: "Qmax73")
        view.addSubview(qMax73)
        let qMax74 = getLabel(x: 313, y: 200, width: 50, height: 50, text: "Qmax74")
        view.addSubview(qMax74)
        //ячейки Umax
        let uMax69 = getLabel(x: 63, y: 250, width: 50, height: 50, text: "Umax69")
        view.addSubview(uMax69)
        let uMax70 = getLabel(x: 113, y: 250, width: 50, height: 50, text: "Umax70")
        view.addSubview(uMax70)
        let uMax71 = getLabel(x: 163, y: 250, width: 50, height: 50, text: "Umax71")
        view.addSubview(uMax71)
        let uMax72 = getLabel(x: 213, y: 250, width: 50, height: 50, text: "Umax72")
        view.addSubview(uMax72)
        let uMax73 = getLabel(x: 263, y: 250, width: 50, height: 50, text: "Umax73")
        view.addSubview(uMax73)
        let uMax74 = getLabel(x: 313, y: 250, width: 50, height: 50, text: "Umax74")
        view.addSubview(uMax74)
        //ячейки Rac
        let rAc69 = getLabel(x: 63, y: 300, width: 50, height: 50, text: "Rac69")
        view.addSubview(rAc69)
        let rAc70 = getLabel(x: 113, y: 300, width: 50, height: 50, text: "Rac70")
        view.addSubview(rAc70)
        let rAc71 = getLabel(x: 163, y: 300, width: 50, height: 50, text: "Rac71")
        view.addSubview(rAc71)
        let rAc72 = getLabel(x: 213, y: 300, width: 50, height: 50, text: "Rac72")
        view.addSubview(rAc72)
        let rAc73 = getLabel(x: 263, y: 300, width: 50, height: 50, text: "Rac73")
        view.addSubview(rAc73)
        let rAc74 = getLabel(x: 313, y: 300, width: 50, height: 50, text: "Rac74")
        view.addSubview(rAc74)
    }
    
    private func createTable(on view: UIView) {
        let shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.path = getMainPath().cgPath
        
        let headerLayer = CAShapeLayer()
        view.layer.addSublayer(headerLayer)
        headerLayer.strokeColor = UIColor.black.cgColor
        headerLayer.lineWidth = 3
        headerLayer.fillColor = CGColor(srgbRed: 0, green: 230, blue: 255, alpha: 0.5)
        headerLayer.path = getTableHeaderPath().cgPath
        
        let firstColumnLayer = CAShapeLayer()
        view.layer.addSublayer(firstColumnLayer)
        firstColumnLayer.strokeColor = UIColor.black.cgColor
        firstColumnLayer.lineWidth = 3
        firstColumnLayer.fillColor = UIColor.red.cgColor
        firstColumnLayer.opacity = 0.5
        firstColumnLayer.path = getFirstColumn().cgPath
        
        let linesLayer = CAShapeLayer()
        view.layer.addSublayer(linesLayer)
        linesLayer.strokeColor = UIColor.black.cgColor
        linesLayer.lineWidth = 3
        linesLayer.path = getLinesPath().cgPath
        
    }
    
    private func getMainPath() -> UIBezierPath {
        let mainRect = CGRect(x: 13, y: 100, width: 350, height: 250)
        let path = UIBezierPath(rect: mainRect)
        return path
    }
    
    private func getTableHeaderPath() -> UIBezierPath {
        let headerRect = CGRect(x: 63, y: 100, width: 300, height: 50)
        let path = UIBezierPath(rect: headerRect)
        return path
    }
    
    private func getFirstColumn() -> UIBezierPath {
        let headerRect = CGRect(x: 13, y: 100, width: 50, height: 250)
        let path = UIBezierPath(rect: headerRect)
        return path
    }
    
    private func getLinesPath() -> UIBezierPath {
        let path = UIBezierPath()
        //первая вертикальная линия
        path.move(to: CGPoint(x: 63, y: 100))
        path.addLine(to: CGPoint(x: 63, y: 350))
        //вторая вертикальная линия
        path.move(to: CGPoint(x: 113, y: 100))
        path.addLine(to: CGPoint(x: 113, y: 350))
        //третья вертикальня линия
        path.move(to: CGPoint(x: 163, y: 100))
        path.addLine(to: CGPoint(x: 163, y: 350))
        //четвёртая вертикальная линия
        path.move(to: CGPoint(x: 213, y: 100))
        path.addLine(to: CGPoint(x: 213, y: 350))
        //пятая вертикальная линия
        path.move(to: CGPoint(x: 263, y: 100))
        path.addLine(to: CGPoint(x: 263, y: 350))
        //шестая вертикальная линия
        path.move(to: CGPoint(x: 313, y: 100))
        path.addLine(to: CGPoint(x: 313, y: 350))
        //первая горизонтальная линия
        path.move(to: CGPoint(x: 13, y: 150))
        path.addLine(to: CGPoint(x: 363, y: 150))
        //вторая горизонтальная линия
        path.move(to: CGPoint(x: 13, y: 200))
        path.addLine(to: CGPoint(x: 363, y: 200))
        //третья горизонтальная линия
        path.move(to: CGPoint(x: 13, y: 250))
        path.addLine(to: CGPoint(x: 363, y: 250))
        //четвёртая горизонтальная линия
        path.move(to: CGPoint(x: 13, y: 300))
        path.addLine(to: CGPoint(x: 363, y: 300))
        return path
    }
    //создание label заголовка
    private func getHeaderLabel(x: Int, y: Int, width: Int, height: Int, text: String) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: x, y: y, width: width, height: height)
        label.text = text
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.numberOfLines = 2
        return label
    }
    //создание label ячейки
    private func getLabel(x: Int, y: Int, width: Int, height: Int, text: String) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: x, y: y, width: width, height: height)
        label.text = text
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10.0)
        return label
    }
}


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
