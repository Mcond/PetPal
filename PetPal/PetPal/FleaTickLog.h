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

@end