//
//  MRFLinkedList.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 03.06.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#ifndef __MRFHuman__MRFLinkedList__
#define __MRFHuman__MRFLinkedList__

#include "MRFObject.h"
#include "MRFLinkedListNode.h"

typedef struct {
    MRFObject _super;
    
    MRFLinkedListNode *_head;
} MRFLinkedList;




#endif /* defined(__MRFHuman__MRFLinkedList__) */
