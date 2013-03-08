//
//  ViewController.m
//  SimplerMerchant
//
//  Created by Basil Siddiqui on 3/8/13.
//  Copyright (c) 2013 Basil Siddiqui. All rights reserved.
//

#import "ZXingObjC.h"
#import "ViewController.h"

@implementation ViewController

@synthesize imageView;
@synthesize merchantTextView;
@synthesize transactionTextView;

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.imageView = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Default qr data
    self.merchantTextView.text = @"merchant_id; merchant_processor_id; merchant_interchange_category;";
    self.transactionTextView.text = @"espresso, $1.50, 3; breakfast burrito, $5.00, 1";
    [self updatePressed:nil];
}

- (void)dealloc {
    [imageView release];
    [transactionTextView release];
    [merchantTextView release];
    
    [super dealloc];
}

#pragma mark - Events

- (IBAction)updatePressed:(id)sender {
    NSString *data = [NSString stringWithFormat:@"%@%@",self.merchantTextView.text, self.transactionTextView.text];
    if (data && ![data isEqualToString:@""]) {
        [self.transactionTextView resignFirstResponder];
        [self.merchantTextView resignFirstResponder];
        
        ZXMultiFormatWriter* writer = [[ZXMultiFormatWriter alloc] init];
        ZXBitMatrix* result = [writer encode:data format:kBarcodeFormatQRCode width:self.imageView.frame.size.width height:self.imageView.frame.size.width error:nil];
        if (result) {
            self.imageView.image = [UIImage imageWithCGImage:[ZXImage imageWithMatrix:result].cgimage];
        } else {
            self.imageView.image = nil;
        }
    }
}

@end
