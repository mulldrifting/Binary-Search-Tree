//
//  LLBinarySearchTree.m
//  BinarySearchTree
//
//  Created by Lauren Lee on 5/19/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import "LLBinarySearchTree.h"

@interface LLBinarySearchTree ()

@property (strong, nonatomic) LLNode *root;

@end

@implementation LLBinarySearchTree

- (void)addValue:(NSInteger)value
{
    LLNode *newNode = [LLNode nodeWithValue:value];
    LLNode *parentNode;
    
    if (self.root) {
        parentNode = [self findParentNodeForNewValue:value onNode:self.root];
        
        if (parentNode) {
            if (value < parentNode.value) {
                parentNode.leftChild = newNode;
            }
            else if (value > parentNode.value)
            {
                parentNode.rightChild = newNode;
            }
        }
    }
    else {
        self.root = newNode;
    }
}

- (LLNode *)findParentNodeForNewValue:(NSInteger)value onNode:(LLNode *)node
{
    if (value < node.value) {
        if (node.leftChild) {
            return [self findParentNodeForNewValue:value onNode:node.leftChild];
        }
        else {
            return node;
        }
    }
    else if (value > node.value) {
        if (node.rightChild) {
            return [self findParentNodeForNewValue:value onNode:node.rightChild];
        }
        else {
            return node;
        }
    }
    
    NSLog(@"Node already exists");
    return nil;
}

- (LLNode *)findParentNodeForValue:(NSInteger)value onNode:(LLNode *)node
{
    if (value < node.value) {
        if (node.leftChild) {
            if (node.leftChild.value == value) {
                return node;
            }
            return [self findParentNodeForValue:value onNode:node.leftChild];
        }
        else {
            NSLog(@"Node for value %d doesn't exist", value);
        }
    }
    else if (value > node.value) {
        if (node.rightChild) {
            if (node.rightChild.value == value) {
                return node;
            }
            return [self findParentNodeForValue:value onNode:node.rightChild];
        }
        else {
            NSLog(@"Node for value %d doesn't exist", value);
        }
    }
    
    NSLog(@"Parent node for value %d doesn't exist", value);
    return nil;
}

- (LLNode *)findNodeForValue:(NSInteger)value
{
    LLNode *searchNode = [self findNodeForValue:value onNode:self.root];
    return searchNode;
}

- (LLNode *)findNodeForValue:(NSInteger)value onNode:(LLNode *)node
{
    if (node) {
        if (value == node.value) {
            return node;
        }
        else if (value < node.value) {
            return [self findNodeForValue:value onNode:node.leftChild];
        }
        else if (value > node.value) {
            return [self findNodeForValue:value onNode:node.rightChild];
        }
    }
    return nil;
}

- (LLNode *)findParentOfMaxNodeWithNode:(LLNode *)node
{
    LLNode *childNode = node.rightChild;
    while (childNode.rightChild) {
        node = childNode;
        childNode = childNode.rightChild;
    }
    return node;
}

- (void)deleteValue:(NSInteger)value
{
    LLNode *targetParentNode = [self findParentNodeForValue:value onNode:self.root];
    LLNode *targetNode = [self findNodeForValue:value];
    
    LLNode *nextNode;
    LLNode *parentNode;
    
    // If target node exists
    if (targetNode) {
        
        // If target node has a left child
        if (targetNode.leftChild) {
            
            NSLog(@"target node left child: %d", targetNode.leftChild.value);
            
            // continue until finding rightmost child in the tree starting from target node's left child
            parentNode = [self findParentOfMaxNodeWithNode:targetNode.leftChild];
            
            if (targetNode.rightChild) {
                NSLog(@"parent node of max node %d  child %d", parentNode.value, parentNode.rightChild.value);
            }
            
            if (parentNode.rightChild) {
                nextNode = parentNode.rightChild;
                targetNode.value = nextNode.value;
                parentNode.rightChild = nextNode.leftChild;
            }
            else {
                targetParentNode.leftChild = targetNode.leftChild;
            }
        }
        else if (targetNode.rightChild) {
            if (value < targetParentNode.value) {
                targetParentNode.leftChild = targetNode.rightChild;
            }
            else if (value > targetParentNode.value) {
                targetParentNode.rightChild = targetParentNode.rightChild;
            }
        }
        else {
            if (targetNode.value < parentNode.value) {
                targetParentNode.leftChild = nil;
            }
            else {
                targetParentNode.rightChild = nil;
            }
            
        }
    }

    else {
        NSLog(@"can't delete, node doesn't exist");
    }
}



- (void)printTree {
    [self printTreeAtNode:self.root];
}

- (void)printTreeAtNode:(LLNode *)node
{
    if (node) {
        NSLog(@"%d", node.value);
        [self printTreeAtNode:node.leftChild];
        [self printTreeAtNode:node.rightChild];
    }
    return;
}



@end
