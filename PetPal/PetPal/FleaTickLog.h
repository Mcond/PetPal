//  PROGRAMMER:     Curtis Cox
//  PANTHERID:      5001361
//  GROUP:          F
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Group Project
//  DUE:            Thursday 12/10/15
//
//  FleaTickLog.h
//  PetPal
//
//  Created by Curtis Cox on 12/6/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@class HealthRecord;

@interface FleaTickLog : NSObject


@property (strong, nonatomic) NSMutableArray *myLog;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSManagedObjectModel *model;

+(instancetype)defaultFleaTickLog;
-(void)addMyLogObject:(HealthRecord *) theRecord;
-(void) removeRecord: (HealthRecord *) deleteRecord;

@end