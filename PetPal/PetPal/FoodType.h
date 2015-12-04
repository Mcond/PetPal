//
//  FoodType.h
//  PetPalV1
//
//  Created by Curtis Cox on 11/12/15.
//  Copyright (c) 2015 Curtis Cox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodType : NSObject

@property (strong, nonatomic) NSString *brandName, *flavorName, *servingUnit;
@property NSInteger calPerServig, uPC, servingSize;


@end
