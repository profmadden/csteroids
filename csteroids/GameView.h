//
//  GameView.h
//  csteroids
//
//  Created by Patrick Madden on 2/8/19.
//  Copyright © 2019 SUNY Binghamton. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameView : UIView
@property (nonatomic, strong) UIImageView *ship;
@property float dx, dy, rotation, angle;
@property (nonatomic, strong) NSTimer *timer;

@end

NS_ASSUME_NONNULL_END
