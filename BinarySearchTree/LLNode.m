//
//  LLNode.m
//  BinarySearchTree
//
//  Created by Lauren Lee on 5/19/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import "LLNode.h"

@implementation LLNode

+ (id)nodeWithValue:(NSInteger)value
{
    LLNode *newNode = [LLNode new];
    newNode.value = value;
    return newNode;
}

- (void)addNode:(LLNode *)node
{
    if (node.value < self.value) {
        if (self.leftChild) {
            [self.leftChild addNode:node];
        }
        else {
            self.leftChild = node;
            node.parent = self;
        }
    }
    else if (node.value > self.value) {
        if (self.rightChild) {
            [self.rightChild addNode:node];
        }
        else {
            self.rightChild = node;
            node.parent = self;
        }
    }
    else {
        NSLog(@"failed to add node: %@",node);
    }
}

@end
