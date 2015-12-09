//  PROGRAMMER:     Curtis Cox
//  PANTHERID:      5001361
//  GROUP:          F
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Group Project
//  DUE:            Thursday 12/10/15
//
//  HealthTabViewController.h
//  PetPal
//
//  Created by Curtis Cox on 12/5/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthTabViewController : UIViewController<UITabBarControllerDelegate>
- (IBAction)pressedReminders:(id)sender;
- (IBAction)pressedVaccines:(id)sender;
- (IBAction)pressedFTHControl:(id)sender;
- (IBAction)pressedContactVet:(id)sender;

@end
