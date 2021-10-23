//
//  Model.swift
//  Budget2
//
//  Created by Suneru on 16.10.2021.
//

import Foundation

var ostatokNaPeriod = 7000.00
var vKopilku = ostatokNaPeriod / 2
var potrZaPeriod = 0.00 {
    didSet {
        ostatok = ostatokNaPeriod - potrZaPeriod
    }
}
var ostatok = ostatokNaPeriod {
    didSet {
        if ostatok >= 0 {
            vKopilku = ostatok / 2
        }
        else {
            vKopilku = 0.00
        }
    }
}

// функция сохранения данных в хранилище
func saveData() {
    UserDefaults.standard.set(ostatokNaPeriod, forKey: "ostatokNaPeriod")
    UserDefaults.standard.set(potrZaPeriod, forKey: "potrZaPeriod")
    UserDefaults.standard.synchronize()
}

func loadData() {
    ostatokNaPeriod = UserDefaults.standard.double(forKey: "ostatokNaPeriod")
    potrZaPeriod = UserDefaults.standard.double(forKey: "potrZaPeriod")
}

