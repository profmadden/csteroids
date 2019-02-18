//
//  Boulder.h
//  csteroids
//
//  Created by Patrick Madden on 2/17/19.
//  Copyright © 2019 SUNY Binghamton. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Boulder : UIImageView

@property (nonatomic) float x, y;
@property (nonatomic) float dx, dy;
@property (nonatomic) float diameter;
@property (nonatomic) float rotation;
@end

NS_ASSUME_NONNULL_END
