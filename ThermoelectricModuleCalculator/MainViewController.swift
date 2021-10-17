//
//  ViewController.swift
//  ThermoelectricModuleCalculator
//
//  Created by Александр Касьянов on 20.09.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    //экземпляр класса для расчёта
    var calcResult = Calculation()
    //экземпляр структуры TEEParams
    var tee = TEEParams()
    //экземпляр структуры CeramicParams
    var ceramic = CeramicParams()
    //кнопки для расчёта ТЭЭ
    @IBOutlet weak var teeCountValue: UITextField!
    @IBOutlet weak var teeCrossValue: UITextField!
    @IBOutlet weak var teeHeightValue: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBAction func temCalculateAction(_ sender: UIButton) {
        tee.teeCount = Double(teeCountValue.text!) ?? tee.teeCount
        tee.teeCross = Double(teeCrossValue.text!) ?? tee.teeCross
        tee.teeHeight = Double(teeHeightValue.text!) ?? tee.teeHeight
        tee.iMaxResult = calcResult.iMaxCalc(gamma: tee.gamma)
        tee.qMaxResult = calcResult.qMaxCalc(gamma: tee.gamma, teeCount: tee.teeCount)
        tee.uMaxResult = calcResult.uMaxCalc(teeCount: tee.teeCount)
        tee.rAcResult = calcResult.rAcCalc(gamma: tee.gamma, teeCount: tee.teeCount)
        tee.emResult = calcResult.emCalc(uMax: tee.uMaxResult)
        tee.kmResult = calcResult.kmCalc(gamma: tee.gamma, teeCount: tee.teeCount)
    }
    //кнопки для расчёта керамики
    @IBOutlet weak var heatCondLabel: UILabel!
    @IBOutlet weak var ceramicWidthValue: UITextField!
    @IBOutlet weak var ceramicLengthValue: UITextField!
    @IBOutlet weak var ceramicThicknessValue: UITextField!
    @IBOutlet weak var ceramicThermalCondValue: UITextField!
    @IBOutlet weak var ceramicCalculateButton: UIButton!
    @IBAction func ceramicCalculateAction(_ sender: UIButton) {
        ceramic.ceramicWidth = Double(ceramicWidthValue.text!) ?? ceramic.ceramicWidth
        ceramic.ceramicLength = Double(ceramicLengthValue.text!) ?? ceramic.ceramicLength
        ceramic.ceramicThickness = Double(ceramicThicknessValue.text!) ?? ceramic.ceramicThickness
        ceramic.ceramicThermalCond = Double(ceramicThermalCondValue.text!) ?? ceramic.ceramicThermalCond
        tee.kmResult = calcResult.kmCalc(gamma: tee.gamma, teeCount: tee.teeCount)
        ceramic.temThermalResist = calcResult.temThermalResist(km: tee.kmResult, ceramicThermalResist: ceramic.ceramicThermalResist)
        
    }    
    
    //круглая кнопка
//    func circleButton(button: UIButton, imagePath: String?, x: Int, y: Int) -> UIButton {
//        let circleButton = button
//        //circleButton.frame = CGRect(x: x, y: y, width: 100, height: 100)
//        circleButton.layer.cornerRadius = 0.5 * circleButton.bounds.size.width
//        circleButton.layer.borderWidth = 0.7
//        circleButton.layer.borderColor = (UIColor.black.withAlphaComponent(0.7)).cgColor
//        circleButton.clipsToBounds = true
//        circleButton.backgroundColor = .white
//        let image = UIImage(named: imagePath ?? "")
//        //circleButton.setImage(image, for: .normal)
//        circleButton.setBackgroundImage(image, for: .normal)
//        return button
//    }
    func circleButton(button: UIButton, imagePath: String?) -> UIButton {
        let circleButton = button
        //circleButton.frame = CGRect(x: x, y: y, width: 100, height: 100)
        circleButton.layer.cornerRadius = 0.5 * circleButton.bounds.size.width
        circleButton.layer.borderWidth = 0.7
        circleButton.layer.borderColor = (UIColor.black.withAlphaComponent(0.7)).cgColor
        circleButton.clipsToBounds = true
        circleButton.backgroundColor = .white
        let image = UIImage(named: imagePath ?? "")
        //circleButton.setImage(image, for: .normal)
        circleButton.setBackgroundImage(image, for: .normal)
        return button
    }
    
    //передача данных в контроллеры
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showTEECalcResults" {
            guard let teeDestination = segue.destination as? TEEResultController else { return }
            //destination.modalPresentationStyle = .fullScreen
            temCalculateAction(calculateButton)
            //передача данных в TEEResultController            
            teeDestination.teeCountForLabel = String(Int(tee.teeCount))
            teeDestination.teeCrossForLabel = String(tee.teeCross)
            teeDestination.teeHeightForLabel = String(tee.teeHeight)
            teeDestination.iMaxResultForLabel = tee.iMaxResult
            teeDestination.qMaxResultForLabel = tee.qMaxResult
            teeDestination.uMaxResultForLabel = tee.uMaxResult
            teeDestination.rAcResultForLabel = tee.rAcResult
            teeDestination.emResultForLabel = tee.emResult
            teeDestination.kmResultForLabel = tee.kmResult
        } else if segue.identifier == "showCeramicCalcResults" {
            guard let ceramicDestination = segue.destination as? CeramicViewController else { return }
            ceramicCalculateAction(ceramicCalculateButton)
            //передача данных в CeramicViewController
            ceramicDestination.teeCountForLabel = String(Int(tee.teeCount))
            ceramicDestination.teeCrossForLabel = String(tee.teeCross)
            ceramicDestination.teeHeightForLabel = String(tee.teeHeight)
            ceramicDestination.ceramicWidthValueForLabel = String(ceramic.ceramicWidth)
            ceramicDestination.ceramicLengthValueForLabel = String(ceramic.ceramicLength)
            ceramicDestination.ceramicThicknessValueForLabel = String(ceramic.ceramicThickness)
            ceramicDestination.ceramicThermalCondValueForLabel = String(ceramic.ceramicThermalCond)
            ceramicDestination.ceramicThermalResistForLabel = String(ceramic.ceramicThermalResist.cut)
            ceramicDestination.temThermalResistForLabel = ceramic.temThermalResist
        } else {
            return
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //фоновая картинка
        let backgroundImage = UIImageView(image: UIImage(named: "ThermoScreen")!)
        backgroundImage.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        self.view.insertSubview(backgroundImage, at: 0)
        
        heatCondLabel.text = "Теплопроводность Вт/м\u{00B7}К"
        //круглые кнопки
//        view.addSubview(circleButton(button: calculateButton, imagePath: "RedScreen", x: Int(view.frame.size.width / 8), y: Int(view.frame.size.height / 2.3)))
//        view.addSubview(circleButton(button: ceramicCalculateButton, imagePath: "BlueScreen", x: Int(view.frame.size.width) - (Int(view.frame.size.width / 2.9)), y: Int(view.frame.size.height / 2.3)))
        view.addSubview(circleButton(button: calculateButton, imagePath: "RedScreen"))
        view.addSubview(circleButton(button: ceramicCalculateButton, imagePath: "BlueScreen"))
        
        //скрываем клавиатуру
        self.hideKeyboardWhenTappedAround()
    }
    
}
//скрытие клавиатуры после нажатия на пустое место на экране
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
