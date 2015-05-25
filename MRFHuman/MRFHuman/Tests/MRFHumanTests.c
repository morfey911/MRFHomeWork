//
//  MRFHumanTests.c
//  MRFHuman
//
//  Created by Yurii Mamurko on 17.05.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#include <stdio.h>
#include <assert.h>

#include "MRFHumanTests.h"
#include "MRFHuman.h"
#include "MRFObject.h"

void MRFHumanTests() {
    //создаем несколько разнополых людей, referenceCount равен по 1.
    MRFHuman *masha = MRFHumanCreateWithParameters("Masha", kMRFHumanFemale, 18);
    MRFHuman *vasya = MRFHumanCreateWithParameters("Vasya", kMRFHumanMale, 20);
    
    assert(MRFObjectGetReferenceCount(masha) == 1);
    assert(MRFObjectGetReferenceCount(vasya) == 1);
    
    //женим их
    MRFHumanGetMarried(masha, vasya);

    //после свадьбы кол-во referenceCount у жены должно быть 2, у мужа все еще 1.
    assert(MRFObjectGetReferenceCount(masha) == 2);
    assert(MRFObjectGetReferenceCount(vasya) == 1);
    
    //выведем чуток информации про наших героев
    MRFHumanPrintDescription(masha);
    MRFHumanPrintDescription(vasya);
    
    //попробуем убить жену
    MRFObjectRelease(masha);
    assert(MRFObjectGetReferenceCount(masha) == 1);
    MRFObjectRetain(masha);
    
    //рожаем ребенка
//    MRFHuman *bob = MRFHumanCreateChildren(masha, vasya);
//    assert(MRFObjectGetReferenceCount(bob) == 2);
    
    //теперь разведем их, после развода referenceCount у жены 1, у мужа как и был 1.
    MRFHumanDivorce(masha);
    
    assert(MRFObjectGetReferenceCount(masha) == 1);
    assert(MRFObjectGetReferenceCount(vasya) == 1);
    
    //опять выведем инфу
    MRFHumanPrintDescription(masha);
    MRFHumanPrintDescription(vasya);
    
    //удалим наших героев, referenceCount будет равен 0.
    MRFObjectRelease(masha);
    MRFObjectRelease(vasya);
    
}
