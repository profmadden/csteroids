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
@synthesize rotation, rotating_l, rotating_r;
@synthesize boulders;

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
        ship = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 150, 100)];
        [ship setImage:[UIImage imageNamed:@"ship.png"]];
        //[ship setBackgroundColor:[UIColor redColor]];
        [self addSubview:ship];
        rotating_r = rotating_l = 0;
        
        boulders = [[NSMutableArray alloc] init];
        CGRect r = [self bounds];
        for (int i = 0; i < 5; ++i)
        {
            float x = rand() % ((int) r.size.width);
            float y = rand() % ((int) r.size.height);
            

            Boulder *b = [[Boulder alloc] initWithFrame:CGRectMake(x, y, 200, 200)];
            [b setDiameter:100];
            [b setDx:rand() % 20];
            [b setDy:rand() % 20];
            [self addSubview:b];
            [boulders addObject:b];
        }
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self performSelectorOnMainThread:@selector(tick:) withObject:self.timer waitUntilDone:NO];
        }];
    }
    
    return self;
}

-(IBAction)rotate:(id)sender
{
    if ([sender tag] > 0)
        rotating_l = TRUE;
    else
        rotating_r = TRUE;

}

-(IBAction)rotateEnd:(id)sender
{
    if ([sender tag] > 0)
        rotating_l = FALSE;
    else
        rotating_r = FALSE;

}

-(IBAction)thrust:(id)sender
{
    self.dx += 5 * cos(self.angle);
    self.dy += 5 * sin(self.angle);
    // NSLog(@"Thrust %f %f", self.dx, self.dy);
}

-(void)tick:(id)sender
{
    if (rotating_l)
        rotation += 5;
    if (rotating_r)
        rotation -= 5;
    
    self.angle = 2*M_PI*(self.rotation/360.0);
    CGAffineTransform t = CGAffineTransformRotate(CGAffineTransformIdentity, self.angle);
    [ship setTransform:t];
    
    CGPoint p = [ship center];
    p.x += self.dx;
    p.y += self.dy;
    
    CGRect r = [self frame];
    if (p.x < 0) p.x += r.size.width;
    if (p.x > r.size.width) p.x -= r.size.width;
    if (p.y < 0) p.y += r.size.height;
    if (p.y > r.size.height) p.y -= r.size.height;
    
    [ship setCenter:p];
    
    // Now move the boulders
    for (Boulder *b in boulders)
    {
        CGPoint p = [b center];
        p.x += [b dx];
        p.y += [b dy];
        if (p.x < 0) p.x += r.size.width;
        if (p.x > r.size.width) p.x -= r.size.width;
        if (p.y < 0) p.y += r.size.height;
        if (p.y > r.size.height) p.y -= r.size.height;
        [b setRotation:[b rotation] + 5];
        float angle = 2*M_PI*([b rotation]/360.0);
        t = CGAffineTransformRotate(CGAffineTransformIdentity, angle);
        [b setTransform:t];
        [b setCenter:p];
    }
}
@end
