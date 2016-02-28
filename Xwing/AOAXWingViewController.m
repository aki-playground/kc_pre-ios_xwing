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
    
    [self.view addGestureRecognizer:tap];
}

-(void) userDidTap:(UITapGestureRecognizer *) tap{

    CGPoint newCenter = [tap locationInView:self.spaceView];
    
    UIViewAnimationOptions options = 0;
    [UIView animateWithDuration:2
                          delay:0
                        options:options
                     animations:^{
                        self.xwingView.center = newCenter;
                     }
                     completion:^(BOOL finished) {
                        //
                     }];
     
     

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
