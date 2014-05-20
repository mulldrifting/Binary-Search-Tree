//
//  LLBinarySearchTree.h
//  BinarySearchTree
//
//  Created by Lauren Lee on 5/19/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLNode.h"

@interface LLBinarySearchTree : NSObject

- (void)addValue:(NSInteger)value;
- (void)deleteValue:(NSInteger)value;
- (LLNode *)findNodeForValue:(NSInteger)value;
- (void)printTree;

@end
