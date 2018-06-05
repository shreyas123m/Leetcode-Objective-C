//
//  LeetCodeQuestions.h
//  experiment
//
//  Created by Shreyas Maheshwari on 4/26/18.
//  Copyright © 2018 com.shreyas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeetCodeQuestions : NSObject

//Binary/Binary Search Tree Structure
struct TreeNode {
    NSInteger val;
    struct TreeNode * left;
    struct TreeNode * right;
};

//Linked List Structure
struct LinkedList {
    int val;
    struct LinkedList *next;
};

-(NSString*) reverseString: (NSString*) str;

-(NSInteger) addDigits: (NSInteger) num;

-(char) findDifference: (NSString*) s bitString:(NSString*) t;

-(struct TreeNode *) invertBinaryTree: (struct TreeNode *) root;

-(void) moveZeroes: (NSArray*) nums sizeOfArray: (NSInteger) n;

-(NSInteger) sumOfLeftLeaves: (struct TreeNode*) root;

-(NSMutableArray*) shortestToChar: (NSString*) s targetCharacter:(char) ch;

-(NSString*) goatLatin: (NSString*) s;

-(BOOL) canConstruct: (NSString*) ransom stringForMagazine: (NSString*) magazine;

-(void) deleteNode: (struct LinkedList*) node;

-(NSArray*) arrayIntersection: (NSArray*) nums1 secondArray: (NSArray*) nums2;

-(BOOL) isSameTree:(struct TreeNode*) p secondTree: (struct TreeNode*) q;

-(NSInteger) excelSheetColumnNumber: (NSString*) s;

-(BOOL) validPalindrome: (NSString*) s;

-(BOOL) twoSumBST: (struct TreeNode*) root targetValue: (NSInteger) k;

-(struct LinkedList*) addListsReverse: (struct LinkedList*) l1 secondList: (struct LinkedList*) l2;

-(NSString*) addBinaryNumbers: (NSString*) s secondNumber: (NSString*) t;

-(NSInteger) lengthOfLongestSubstring: (NSString *) s;

-(NSInteger) romanToInteger: (NSString*) s;

-(NSArray*) avgOfLevelsInBst: (struct TreeNode*) root;

-(BOOL) isSubtree: (struct TreeNode*) s subtree: (struct TreeNode*) t;

-(NSArray*) binaryTreePaths: (struct TreeNode*) root;

-(void) insertNode: (struct LinkedList*) prev newNodeValue: (int) n;

-(void) mergeSortedArrays: (NSMutableArray*) n1 lengthOfn1: (NSInteger) m secondSmallerArray: (NSArray*) n2 lengthOfn2: (NSInteger) n;

@end
