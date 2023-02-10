//
//  SurfModel.swift
//  TestTaskForSurf
//
//  Created by Кирилл Демьянцев on 09.02.2023.
//

import Foundation

struct SurfModel {
    
    let image: String
    let internLabel: String
    let firstText: String
    let secondText: String
    let thirdText: String
}

var surfScreen = SurfModel(image: "image1",
                           internLabel: "Стажировка в Surf",
                           firstText: "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты.",
                           secondText: "Получай стипендию, выстраивай удобный график, работай на современном железе.",
                           thirdText: "Хочешь к нам?")

let nameCategoryArray = ["IOS", "Android", "Design", "QA", "Flutter", "PM", "GameDev", "1C", "DevOps", "DataScientists ", "CRM"]
