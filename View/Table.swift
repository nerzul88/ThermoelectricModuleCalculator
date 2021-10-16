//
//  Table.swift
//  ThermoelectricModuleCalculator
//
//  Created by Александр Касьянов on 23.09.2021.
//

import UIKit

class TEETable: UIViewController {
    
//    enum Table {
//        case numberOfRows(Int)
//        case numberOfColumns(Int)
//        case step(Int)
//    }
    //    //координаты начальной точки таблицы
    //    enum Coord: Int {
    //        case x = 30
    //        case y = 100
    //    }
    //параметры таблицы TEE
    let rows = 7
    let columns = 7
    let step = 50
    
    //ширина экрана
    let screen = UIScreen.main.bounds
    //координата х таблицы
    lazy var x = (Int(screen.size.width) - (columns * step)) / 2
    //координата y таблицы
    lazy var y = (Int(screen.size.height) / 5)

    
    
    //создание таблицы TEE
    func createTEETable(on view: UIView) {
        let shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.path = getMainRect(x: x, y: y, rows: rows, columns: columns, step: step).cgPath
        
        let headerLayer = CAShapeLayer()
        view.layer.addSublayer(headerLayer)
        headerLayer.strokeColor = UIColor.black.cgColor
        headerLayer.lineWidth = 3
        headerLayer.fillColor = CGColor(srgbRed: 0, green: 230, blue: 255, alpha: 0.5)
        headerLayer.path = getTableHeaderPath(x: x, y: y, columns: columns, step: step).cgPath
        
        let firstColumnLayer = CAShapeLayer()
        view.layer.addSublayer(firstColumnLayer)
        firstColumnLayer.strokeColor = UIColor.black.cgColor
        firstColumnLayer.lineWidth = 3
        firstColumnLayer.fillColor = UIColor.red.cgColor
        firstColumnLayer.opacity = 0.5
        firstColumnLayer.path = getFirstColumn(x: x, y: y, rows: rows, step: step).cgPath
        
        let linesLayer = CAShapeLayer()
        view.layer.addSublayer(linesLayer)
        linesLayer.strokeColor = UIColor.black.cgColor
        linesLayer.lineWidth = 3
        linesLayer.path = getLinesPath(x: x, y: y, rows: rows, columns: columns, step: step).cgPath
    }
    
    func getMainRect(x: Int, y: Int, rows: Int, columns: Int, step: Int) -> UIBezierPath {
        let mainRect = CGRect(x: x, y: y, width: columns * step, height: rows * step)
        let path = UIBezierPath(rect: mainRect)
        return path
    }
    func getTableHeaderPath(x: Int, y: Int, columns: Int, step: Int) -> UIBezierPath {
        let headerRect = CGRect(x: x + step, y: y, width: step * (columns - 1), height: step)
        let path = UIBezierPath(rect: headerRect)
        return path
    }
    func getFirstColumn(x: Int, y: Int, rows: Int, step: Int) -> UIBezierPath {
        let headerRect = CGRect(x: x, y: y, width: step, height: rows * step)
        let path = UIBezierPath(rect: headerRect)
        return path
    }
    func getLinesPath(x: Int, y: Int, rows: Int, columns: Int, step: Int) -> UIBezierPath {
        let path = UIBezierPath()
        let zeroX = x
        var x = x
        var y = y
        //вертикальные линии
        for _ in 1...(columns - 1) {
            path.move(to: CGPoint(x: x + step, y: y))
            path.addLine(to: CGPoint(x: x + step, y: y + (rows * step)))
            x += step
        }
        //горизонтиальные линии
        x = zeroX
        for _ in 1...(rows - 1) {
            path.move(to: CGPoint(x: x, y: y + step))
            path.addLine(to: CGPoint(x: x + columns * step, y: y + step))
            y += step
        }
        return path
    }
    //создание label заголовка
    func getHeaderLabel(x: Int, y: Int, width: Int, height: Int, text: String, size: Double, align: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: x, y: y, width: width, height: height)
        label.text = text
        label.textColor = .black
        label.textAlignment = align
        label.font = UIFont.boldSystemFont(ofSize: CGFloat(size))
        label.numberOfLines = 2
        return label
    }
    //создание label
    func getLabel(x: Int, y: Int, width: Int, height: Int, text: String, size: Double) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: x, y: y, width: width, height: height)
        label.text = text
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: CGFloat(size))
        return label
    }
//    //создание label названия таблицы
//    func getTableNameLable(x: Int, y: Int, width: Int, height: Int, text: String) -> UILabel {
//        let label = UILabel()
//        return label
//    }
//    //создание label дополнительной информации
//    func getAdditionalInfoLable(x: Int, y: Int, width: Int, height: Int, text: String) -> UILabel {
//        let label = UILabel()
//        return label
//    }
}
//класс таблицы параметров керамики
class CeramicTable: TEETable {
    let ceramicTableRows = 2
    
    func createCeramicTable(on view: UIView) {
        let shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.path = getMainRect(x: x, y: y, rows: ceramicTableRows, columns: columns, step: step).cgPath
        
        let headerLayer = CAShapeLayer()
        view.layer.addSublayer(headerLayer)
        headerLayer.strokeColor = UIColor.black.cgColor
        headerLayer.lineWidth = 3
        headerLayer.fillColor = CGColor(srgbRed: 0, green: 230, blue: 255, alpha: 0.5)
        headerLayer.path = getTableHeaderPath(x: x, y: y, columns: columns, step: step).cgPath
        
        let firstColumnLayer = CAShapeLayer()
        view.layer.addSublayer(firstColumnLayer)
        firstColumnLayer.strokeColor = UIColor.black.cgColor
        firstColumnLayer.lineWidth = 3
        firstColumnLayer.fillColor = UIColor.red.cgColor
        firstColumnLayer.opacity = 0.5
        firstColumnLayer.path = getFirstColumn(x: x, y: y, rows: ceramicTableRows, step: step).cgPath
        
        let linesLayer = CAShapeLayer()
        view.layer.addSublayer(linesLayer)
        linesLayer.strokeColor = UIColor.black.cgColor
        linesLayer.lineWidth = 3
        linesLayer.path = getLinesPath(x: x, y: y, rows: ceramicTableRows, columns: columns, step: step).cgPath
    }
}



