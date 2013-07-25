//
//  ecalculateViewController.m
//  eCalculate
//
//  Created by Rosina Otchere-Nyarko on 7/24/13.
//  Copyright (c) 2013 xperttech. All rights reserved.
//

#import "ecalculateViewController.h"

@interface ecalculateViewController ()
@property (strong, nonatomic) IBOutlet UITextField *numField1;
@property (strong, nonatomic) IBOutlet UITextField *numField2;

@property (strong, nonatomic) IBOutlet UITextField *numField3;
- (IBAction)calculateTwoValuesWithOperator:(id)sender;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerViewOperator;
@property (strong, nonatomic) IBOutlet UILabel *operatorLabel;


//@synthesize pickerViewOperator;

@end

@implementation ecalculateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.pickerViewOperator.dataSource = self;
    self.pickerViewOperator.delegate = self;
    self.operatorArray = [[NSArray alloc] initWithObjects:@"+",@"-",@"*",@"/",nil];
    self.userOperatorSelected = @"+";
    
}

#pragma mark - Picker Views

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.operatorArray count];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30.0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.operatorArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //Let's print in the console what the user had chosen;
    NSLog(@"Chosen item: %@", [self.operatorArray objectAtIndex:row]);
    self.userOperatorSelected = [self.operatorArray objectAtIndex:row];
    NSString *labelValue = [[NSString alloc] initWithFormat:@"( %@ )",self.userOperatorSelected];
    
    
    self.operatorLabel.text = labelValue;

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions

- (IBAction)calculateTwoValuesWithOperator:(id)sender {
    
    [self.numField1 resignFirstResponder];
    [self.numField2 resignFirstResponder];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
    
    
    if([self.userOperatorSelected isEqualToString:@"/"]){
                
        float userFloatValue1 = self.numField1.text.floatValue;
        float userFloatValue2 = self.numField2.text.floatValue;

        float floatResult = userFloatValue1 / userFloatValue2;
        
        
        self.numField3.text =  [[NSString alloc] initWithFormat:@"%f",floatResult];
        
    }else {
        
        int userIntValue1 = self.numField1.text.intValue;
        int userIntValue2 = self.numField2.text.intValue;
        int intResult = 0;
        if([self.userOperatorSelected isEqualToString:@"+"]){
        
             intResult = userIntValue1 + userIntValue2;

        }else if([self.userOperatorSelected isEqualToString:@"-"]){
        
             intResult = userIntValue1 - userIntValue2;

            
        }else if([self.userOperatorSelected isEqualToString:@"*"]){
        
             intResult = userIntValue1 * userIntValue2;
        
        }
        
        
        self.numField3.text =  [[NSString alloc] initWithFormat:@"%i",intResult];
      
    
    }
        });
    });
    
    
    NSLog(@"The result is %@",self.numField3.text);

}
@end
