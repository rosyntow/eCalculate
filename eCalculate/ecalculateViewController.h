//
//  ecalculateViewController.h
//  eCalculate
//
//  Created by Rosina Otchere-Nyarko on 7/24/13.
//  Copyright (c) 2013 xperttech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ecalculateViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong,nonatomic) NSArray *operatorArray;
@property (strong,nonatomic) NSString *userOperatorSelected;

@end
