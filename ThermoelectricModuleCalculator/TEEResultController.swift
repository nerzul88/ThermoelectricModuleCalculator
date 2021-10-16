//
//  TEEResultController.swift
//  ThermoelectricModuleCalculator
//
//  Created by Александр Касьянов on 21.09.2021.
//

import UIKit

class TEEResultController: UIViewController {
    
    //экземпляр LabelsNames
    let labelsNames = LabelsNames()
    //экземпляр Table
    let table = TEETable()
    //координаты
    lazy var x = table.x
    lazy var y = table.y
    lazy var step = table.step
    lazy var columns = table.columns
    //переменные для отображения значений
    var teeCountForLabel = ""
    var teeCrossForLabel = ""
    var teeHeightForLabel = ""
    var iMaxResultForLabel = [Double]()
    var qMaxResultForLabel = [Double]()
    var uMaxResultForLabel = 0.0
    var rAcResultForLabel = [Double]()
    var emResultForLabel = 0.0
    var kmResultForLabel = [Double]()
    
    //загрузка view
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white        
        self.view = view
        
        //названия строк
        func getRowsLabels(labels: [String], x: Int, y: Int, step: Int) {
            let x = x
            var y = y
            for text in labels {
                let label = table.getHeaderLabel(x: x, y: y, width: step, height: step, text: text, size: 15, align: .center)
                view.addSubview(label)
                y += step
            }
        }
        //названия столбцов
        func getColumnsLabels(labels: [String], x: Int, y: Int, step: Int) {
            var x = self.x + step
            let y = self.y
            for text in labels {
                let label = table.getHeaderLabel(x: x, y: y, width: step, height: step, text: text, size: 15, align: .center)
                view.addSubview(label)
                x += step
            }
        }
        //размещение данных ячеек на основе массива
        func cellsFromArray(values: [Double], x: Int, y: Int, step: Int, stepCount: Int = 1) {
            var x = x + step
            let y = y + step * stepCount
            for value in values {
                let cell = table.getLabel(x: x, y: y, width: step, height: step, text: String(value.cut), size: 10)
                view.addSubview(cell)
                x += step
            }
        }
        //размещение данных ячеек на основе числа
        func cellsFromConst(value: Double, x: Int, y: Int, step: Int, columns: Int, stepCount: Int = 1) {
            var x = x + step
            let y = y + step * stepCount
            for _ in 1...(columns - 1) {
                let uMax = table.getLabel(x: x, y: y, width: step, height: step, text: String(value.cut), size: 10)
                view.addSubview(uMax)
                x += step
            }
        }
        //создание заголовка
        func createHeaderLabel(x: Int, y: Int, columns: Int, step: Int) {
            //название таблицы
            let teeTableName = "Результаты расчёта физических параметров термоэлектрического модуля ТВ-\(teeCountForLabel)-\(teeCrossForLabel)-\(teeHeightForLabel)"
            let yCoord = y - Int(Double(step) * 1.5)
            let lableWidth = columns * step
            let header = table.getHeaderLabel(x: x, y: yCoord, width: lableWidth, height: step, text: teeTableName, size: 15, align: .center)
            view.addSubview(header)
        }
        
        
        //создаём таблицу на сцене
        table.createTEETable(on: view)
        getRowsLabels(labels: labelsNames.teeTableRowsLabels, x: x, y: y, step: step)
        getColumnsLabels(labels: labelsNames.columnsLabels, x: x, y: y, step: step)
        cellsFromArray(values: iMaxResultForLabel, x: x, y: y, step: step)
        cellsFromArray(values: qMaxResultForLabel, x: x, y: y, step: step, stepCount: 2)
        cellsFromConst(value: uMaxResultForLabel, x: x, y: y, step: step, columns: columns, stepCount: 3)
        cellsFromArray(values: rAcResultForLabel, x: x, y: y, step: step, stepCount: 4)
        cellsFromConst(value: emResultForLabel, x: x, y: y, step: step, columns: columns, stepCount: 5)
        cellsFromArray(values: kmResultForLabel, x: x, y: y, step: step, stepCount: 6)
        createHeaderLabel(x: x, y: y, columns: columns, step: step)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //фоновая картинка
        let backgroundImage = UIImageView(image: UIImage(named: "BlueScreen")!)
        backgroundImage.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
