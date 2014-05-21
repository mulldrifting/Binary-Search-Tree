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
    
    if (self.root) {
        [self.root addNode:newNode];
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

- (LLNode *)findMaxNode:(LLNode *)node
{
    while (node.rightChild) {
        node = node.rightChild;
    }
    return node;
}

- (void)deleteValue:(NSInteger)value
{
    LLNode *targetNode = [self findNodeForValue:value];
    
    LLNode *replacementNode;
    
    // If target node exists
    if (targetNode) {
        
        // If target node has a left child
        if (targetNode.leftChild) {
            
            // continue until finding rightmost child in the tree starting from target node's left child
            replacementNode = [self findMaxNode:targetNode];
            // replace target node's value with the replacement
            targetNode.value = replacementNode.value;
            
            // if the replacement node is at least two nodes away
            if (targetNode.leftChild.rightChild) {
                replacementNode.parent.rightChild = replacementNode.leftChild;
                replacementNode.leftChild.parent = replacementNode.parent;
            }
            // if the replacement node is the left child
            else {
                targetNode.leftChild = replacementNode.leftChild;
                replacementNode.leftChild.parent = targetNode;
            }
        }
        
        // If the target node only has a right child
        else if (targetNode.rightChild) {
            
            // If the target node is to the left of its parent node
            // set the parent's left child to the target's right child
            if (value < targetNode.parent.value) {
                targetNode.parent.leftChild = targetNode.rightChild;
            }
            // If the target node is to the right of its parent node
            // set the parent's right child to the target's right child
            else if (value > targetNode.parent.value) {
                targetNode.parent.rightChild = targetNode.rightChild;
            }
            
            // set the right child node's parent to the target node's parent
            targetNode.rightChild.parent = targetNode.parent;
        }
        
        // If the target has no children
        else {
            if (targetNode.value < targetNode.parent.value) {
                targetNode.parent.leftChild = nil;
            }
            else {
                targetNode.parent.rightChild = nil;
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
