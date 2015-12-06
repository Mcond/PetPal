//
//  HealthLog.m
//  PetPal
//
//  Created by Curtis Cox on 12/6/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "HealthLog.h"
#import "HealthRecord.h"

@implementation HealthLog
@synthesize myLog;

-(instancetype)initWithName:(NSString*) theName
{
    self = [super init];
    if (self) {
        NSString *path = [self itemArchivePathWithName:theName];
        myLog = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if (!myLog) {
            myLog = [[NSMutableArray alloc]init];
        }
    }
    return self;
}

-(void)addMyLogObject:(HealthRecord *) theRecord
{
    [myLog insertObject:theRecord atIndex:0];
}

//returns archive path
-(NSString *)itemArchivePathWithName:(NSString*) theName;
{
    NSArray *documentsDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentsDirectories firstObject];
    NSString *plistPath = [documentDirectory stringByAppendingPathComponent:@"Contacts.archive"];
    return plistPath;
}

-(void) encodeWithCoder:(NSCoder *) encoder
{
    [encoder encodeObject: myLog forKey: @"LogBook"];
}

-(id) initWithCoder:(NSCoder *) decoder
{
    myLog = [decoder decodeObjectForKey: @"LogBook"];
    
    return self;
}

@end
