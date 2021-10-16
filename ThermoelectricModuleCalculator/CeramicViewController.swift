//
//  CeramicViewController.swift
//  ThermoelectricModuleCalculator
//
//  Created by Александр Касьянов on 13.10.2021.
//

import UIKit

class CeramicViewController: UIViewController {
    
    //экземпляр LabelsNames
    let labelsNames = LabelsNames()
    //экземпляр Table
    let table = CeramicTable()
    //координаты
    lazy var x = table.x
    lazy var y = table.y
    lazy var step = table.step
    lazy var columns = table.columns
    lazy var rows = table.ceramicTableRows
    //переменные для отображения значений
    var teeCountForLabel = ""
    var teeCrossForLabel = ""
    var teeHeightForLabel = ""
    var ceramicWidthValueForLabel = ""
    var ceramicLengthValueForLabel = ""
    var ceramicThicknessValueForLabel = ""
    var ceramicThermalCondValueForLabel = ""
    var ceramicThermalResistForLabel = ""
    var temThermalResistForLabel = [Double]()
    
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
        //создание заголовка
        func createHeaderLabel(x: Int, y: Int, columns: Int, step: Int) {
            //название таблицы
            let teeTableName = "Результаты расчёта теплового сопротивления термоэлектрического модуля ТВ-\(teeCountForLabel)-\(teeCrossForLabel)-\(teeHeightForLabel)"
            let yCoord = y - Int(Double(step) * 1.5)
            let lableWidth = columns * step
            let header = table.getHeaderLabel(x: x, y: yCoord, width: lableWidth, height: step, text: teeTableName, size: 15, align: .center)
            view.addSubview(header)
        }
        //дополнительная информация о тепловом сопротивлении керамики
        func createAddInfoLabel(x: Int, y: Int, columns: Int, rows: Int, step: Int) {
            let ceramicSizesText = "Габаритные размеры керамики: \(ceramicWidthValueForLabel)x\(ceramicLengthValueForLabel)x\(ceramicThicknessValueForLabel) мм"
            let ceramicThermalCondText = "Теплопроводность керамики: \(ceramicThermalCondValueForLabel) Вт/м\u{00B7}К"
            let ceramicThermalResistText = "Тепловое сопротивление керамики: \(ceramicThermalResistForLabel) К/Вт"
            
            var yCoord = y + step * rows
            let lableWidth = columns * step
            
            let ceramicSizes = table.getHeaderLabel(x: x, y: yCoord, width: lableWidth, height: step, text: ceramicSizesText, size: 12, align: .left)
            view.addSubview(ceramicSizes)
            
            yCoord += step / 2
            let ceramicThermalCond = table.getHeaderLabel(x: x, y: yCoord, width: lableWidth, height: step, text: ceramicThermalCondText, size: 12, align: .left)
            view.addSubview(ceramicThermalCond)
            
            yCoord += step / 2
            let ceramicThermalResist = table.getHeaderLabel(x: x, y: yCoord, width: lableWidth, height: step, text: ceramicThermalResistText, size: 12, align: .left)
            view.addSubview(ceramicThermalResist)
        }
        table.createCeramicTable(on: view)
        getRowsLabels(labels: labelsNames.ceramicTableRowsLabels, x: x, y: y, step: step)
        getColumnsLabels(labels: labelsNames.columnsLabels, x: x, y: y, step: step)
        cellsFromArray(values: temThermalResistForLabel, x: x, y: y, step: step)
        createHeaderLabel(x: x, y: y, columns: columns, step: step)
        createAddInfoLabel(x: x, y: y, columns: columns, rows: rows, step: step)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //фоновая картинка
        let backgroundImage = UIImageView(image: UIImage(named: "RedScreen")!)
        backgroundImage.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        self.view.insertSubview(backgroundImage, at: 0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
