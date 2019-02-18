//
//  GameView.h
//  csteroids
//
//  Created by Patrick Madden on 2/8/19.
//  Copyright © 2019 SUNY Binghamton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Boulder.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameView : UIView
@property (nonatomic, strong) UIImageView *ship;
@property float dx, dy, rotation, angle;
@property (nonatomic, strong) NSTimer *timer;
@property BOOL rotating_l, rotating_r;

@property (nonatomic, strong) NSMutableArray *boulders;
@end

NS_ASSUME_NONNULL_END
