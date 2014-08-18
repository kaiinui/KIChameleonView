//
//  KIViewController.m
//  ChameleonView
//
//  Created by kaiinui on 2014/08/18.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIViewController.h"
#import "../Classes/KIChameleonView.h"

@interface KIViewController ()

@end

@implementation KIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    KIChameleonView *view = [[KIChameleonView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:view];
    [view setURL:[NSURL URLWithString:@"http://raphaelschaad.com/static/nyan.gif"]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
