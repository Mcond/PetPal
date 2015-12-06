//
//  TableViewCellStyleValue2.m
//  PetPal
//
//  Created by Curtis Cox on 12/5/15.
//  Copyright (c) 2015 Ekaterina Gumnova. All rights reserved.
//

#import "TableViewCellStyleValue2.h"

@implementation TableViewCellStyleValue2

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier {
    if (self = [super initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:reuseIdentifier]) {
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
