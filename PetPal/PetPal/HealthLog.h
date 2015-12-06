//
//  HealthLog.h
//  PetPal
//
//  Created by Curtis Cox on 12/6/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HealthRecord;

@interface HealthLog : NSObject<NSCoding>

@property (strong, nonatomic) NSMutableArray *myLog;

-(instancetype)initWithName:(NSString*) theName;
-(void)addMyLogObject:(HealthRecord *) theRecord;

@end
