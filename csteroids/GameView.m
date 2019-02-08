//
//  GameView.m
//  csteroids
//
//  Created by Patrick Madden on 2/8/19.
//  Copyright © 2019 SUNY Binghamton. All rights reserved.
//

#import "GameView.h"

@implementation GameView
@synthesize ship;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        ship = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 50, 20)];
        [ship setBackgroundColor:[UIColor redColor]];
        [self addSubview:ship];
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:.5 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self performSelectorOnMainThread:@selector(tick:) withObject:self.timer waitUntilDone:NO];
        }];
    }
    
    return self;
}

-(IBAction)rotate:(id)sender
{
    self.rotation += [sender tag];
    self.angle = 2*M_PI*(self.rotation/360.0);
    CGAffineTransform t = CGAffineTransformRotate(CGAffineTransformIdentity, self.angle);
    [ship setTransform:t];
}

-(IBAction)thrust:(id)sender
{
    self.dx += 5 * cos(self.angle);
    self.dy += 5 * sin(self.angle);
    NSLog(@"Thrust %f %f", self.dx, self.dy);
}

-(void)tick:(id)sender
{
    CGPoint p = [ship center];
    p.x += self.dx;
    p.y += self.dy;
    
    CGRect r = [self frame];
    if (p.x < 0) p.x += r.size.width;
    if (p.x > r.size.width) p.x -= r.size.width;
    if (p.y < 0) p.y += r.size.height;
    if (p.y > r.size.height) p.y -= r.size.height;
    
    [ship setCenter:p];
}
@end
