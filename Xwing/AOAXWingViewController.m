//
//  AOAXWingViewController.m
//  Xwing
//
//  Created by Akixe on 28/2/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "AOAXWingViewController.h"

@interface AOAXWingViewController ()

@end

@implementation AOAXWingViewController


- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userDidTap:)];
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(userDidSwipe:)];
    
    [self.view addGestureRecognizer:tap];
    [self.view addGestureRecognizer:swipe];
}

-(void) userDidTap:(UITapGestureRecognizer *) tap{

    if(tap.state == UIGestureRecognizerStateRecognized){
        CGPoint newCenter = [tap locationInView:self.spaceView];
    
        UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState;
        [UIView animateWithDuration:1
                              delay:0
                            options:options
                         animations:^{
                             self.xwingView.center = newCenter;
                         }
                         completion:nil];

        [UIView animateWithDuration:0.5
                              delay:0
                            options:options
                         animations:^{
                             self.xwingView.transform = CGAffineTransformMakeRotation(M_2_PI);
                         }
                         completion:^(BOOL finished) {
                             [UIView animateWithDuration:0.5
                                                   delay:0
                                                 options:options
                                              animations:^{
                                                  self.xwingView.transform = CGAffineTransformIdentity;
                                              } completion:nil];
                         }];
    }
}

-(void) userDidSwipe :(UISwipeGestureRecognizer *) swipe {
    if(swipe.state == UIGestureRecognizerStateRecognized){
        static CGFloat angle = 0;
        
        [UIView animateWithDuration:1
                              delay:0
             usingSpringWithDamping:0.5
              initialSpringVelocity:0.8
                            options:0
                         animations:^{
                             angle = angle + M_2_PI;
                             self.xwingView.transform = CGAffineTransformMakeRotation(angle);
                         } completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
