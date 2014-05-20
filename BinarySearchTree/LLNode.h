//
//  LLNode.h
//  BinarySearchTree
//
//  Created by Lauren Lee on 5/19/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLNode : NSObject

@property (nonatomic) NSInteger value;
@property (strong, nonatomic) LLNode *leftChild;
@property (strong, nonatomic) LLNode *rightChild;

+ (id)nodeWithValue:(NSInteger)value;
- (void)addNode:(LLNode *)node;

@end
