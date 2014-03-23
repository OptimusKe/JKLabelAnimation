//
//  ViewController.m
//  JKLabelAnimation
//
//  Created by 科科 on 2014/3/23.
//  Copyright (c) 2014年 KerKerStudio. All rights reserved.
//

#import "ViewController.h"
#import "JKNeonlampView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    JKNeonlampView* lampView = [[JKNeonlampView alloc] initWithFrame:CGRectMake(0, 0, 200, 80)];
    lampView.center = self.view.center;
    [self.view addSubview:lampView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
