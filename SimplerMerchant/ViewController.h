//
//  ViewController.h
//  SimplerMerchant
//
//  Created by Basil Siddiqui on 3/8/13.
//  Copyright (c) 2013 Basil Siddiqui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextView *merchantTextView;
@property (retain, nonatomic) IBOutlet UITextView *transactionTextView;
@property (retain, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)updatePressed:(id)sender;

@end
