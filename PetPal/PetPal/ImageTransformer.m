//
//  ImageTransformer.m
//  PetPal
//
//  Created by Ekaterina Gumnova on 12/7/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "ImageTransformer.h"
#import "UIKit/UIKit.h"

@implementation ImageTransformer

+(Class) transformedValueClass
{
    return [NSData class];
}

-(id) transformedValue:(id)value
{
    if (!value)
    {
        return nil;
    }
    
    if ([value isKindOfClass: [NSData class]])
    {
        return value;
    }
    
    return UIImageJPEGRepresentation(value, 1.0);
    
}

-(id) reverseTransformedValue:(id)value
{
    return [UIImage imageWithData: value];
}

@end
