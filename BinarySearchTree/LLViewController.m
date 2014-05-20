//
//  LLViewController.m
//  BinarySearchTree
//
//  Created by Lauren Lee on 5/19/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import "LLViewController.h"
#import "LLBinarySearchTree.h"

@interface LLViewController ()

@end

@implementation LLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    LLBinarySearchTree *binaryTree = [LLBinarySearchTree new];
    
    for (int i  = 0; i < 100; i++) {
        [binaryTree addValue:arc4random() % 100];
    }
    
    [binaryTree printTree];
    if ([binaryTree findNodeForValue:50]) {
        NSLog(@"50 deleted");
        [binaryTree deleteValue:50];
    }
    [binaryTree printTree];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
