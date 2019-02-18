//
//  Boulder.m
//  csteroids
//
//  Created by Patrick Madden on 2/17/19.
//  Copyright © 2019 SUNY Binghamton. All rights reserved.
//

#import "Boulder.h"

@implementation Boulder

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setImage:[UIImage imageNamed:@"boulder.png"]];
    }
    
    return self;
}
@end
