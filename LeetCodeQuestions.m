//
//  LeetCodeQuestions.m
//  experiment
//
//  Created by Shreyas Maheshwari on 4/26/18.
//  Copyright © 2018 com.shreyas. All rights reserved.
//

#import "LeetCodeQuestions.h"

@implementation LeetCodeQuestions

//Reverse the given string
-(NSString*) reverseString:(NSString *)str {
    NSMutableString *res = [[NSMutableString alloc] initWithCapacity:str.length];
    for (NSInteger i = str.length - 1;i >= 0;i--) {
        [res appendFormat:@"%C", [str characterAtIndex:i]];
    }
    NSString *final = [[NSString alloc] init];
    final = [NSString stringWithString:res];
    return final;
}

//Add the digits of give number until the sum of the digits is in single digit
-(NSInteger) addDigits:(NSInteger)num {
    if (num == 0)
        return 0;
    if (num % 9 == 0)
        return 9;
    else
        return num % 9;
}

//Find the difference in given 2 strings and return the character which is not matching
-(char) findDifference:(NSString *)s bitString:(NSString *)t {
    int charSum = [t characterAtIndex:s.length];
    for (int i = 0;i < s.length;i++) {
        charSum -= [s characterAtIndex:i];
        charSum += [t characterAtIndex:i];
    }
    return (char) charSum;
}

//Inverting a Binary Tree
-(struct TreeNode *) invertBinaryTree:(struct TreeNode *)root {
    if (root == nil)
        return nil;
    struct TreeNode *leftTree = [self invertBinaryTree:root->left];
    struct TreeNode *rightTree = [self invertBinaryTree:root->right];
    root->left = rightTree;
    root->right = leftTree;
    
    return root;
}

//Move all the zeroes in an array to end
-(void) moveZeroes:(NSArray*)nums sizeOfArray:(NSInteger) n {
    if (n < 2)
        return;
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSInteger count = 0;
    for (NSInteger i = 0;i < n;i++) {
        if ([nums[i] intValue] != 0) {
            [result insertObject:nums[i] atIndex:count];
            count++;
        }
    }
    for (NSInteger i = count;i < n;i++) {
        [result addObject:@0];
    }
    nums = nil;
    [nums arrayByAddingObjectsFromArray:result];
}

//Find the sum of all the Left leaves in a Binary Tree
-(NSInteger) sumOfLeftLeaves:(struct TreeNode *)root {
    NSInteger res = 0;
//    if (root == nil)
//        return res;
    if (root->left != nil) {
        if (root->left->left == nil && root->left->right == nil)
            res += root->left->val;
        else
            res += [self sumOfLeftLeaves:root->left];
    }
    res += [self sumOfLeftLeaves:root->right];
    return res;
}

//Find the shortest distance from a character in a given string and a given character
-(NSMutableArray*) shortestToChar:(NSString *)s targetCharacter:(char)ch {
    NSMutableArray *res = [[NSMutableArray alloc] init];
    NSInteger n = s.length;
    NSInteger pos = -n;
    for (NSInteger i = 0;i < n;i++) {
        if ([s characterAtIndex:i] == ch)
            pos = i;
        [res addObject:[NSNumber numberWithInteger:(i - pos)]];
    }
    for (NSInteger i = n;i >= 0;i--) {
        if ([s characterAtIndex:i] == ch)
            pos = i;
        NSInteger min = MIN([[res objectAtIndex:i] integerValue], i - pos);
        [res replaceObjectAtIndex:i withObject:[NSNumber numberWithInteger:min]];
    }
    return res;
}

//Add "ma" after a vowel in sentence and if consonant than add the first character to last of the word and add "a" incrementally to each words tail
-(NSString*) goatLatin:(NSString *)s {
    NSMutableString *temp = [[NSMutableString alloc] init];
    NSString *strVowel = @"a e i o u A E I O U";
    NSArray *vowels = [strVowel componentsSeparatedByString:@" "];
    NSMutableString *a = [[NSMutableString alloc] initWithString:@"a"];
    NSArray *inputString = [s componentsSeparatedByString:@" "];
    
    for (int i = 0;i < inputString.count;i++) {
        char ch = [[inputString objectAtIndex:i] characterAtIndex:0];
        if ([vowels containsObject:[NSString stringWithFormat:@"%c", ch]]) {
            [temp appendString:[inputString objectAtIndex:i]];
            [temp appendString:@"ma"];
        } else {
            NSString *str = [inputString objectAtIndex:i];
            NSRange range = NSMakeRange(1, str.length);
            [temp appendString:[str substringWithRange:range]];
            [temp appendString:[[inputString objectAtIndex:i] substringWithRange:NSMakeRange(0, 1)]];
            [temp appendString:@"ma"];
        }
        [temp appendString:a];
        [a appendString:@"a"];
    }
    return [NSString stringWithString:temp];
}

// Return YES if you can build a ransom note string from a magazine string using each letter only once.
-(BOOL) canConstruct:(NSString *)ransom stringForMagazine:(NSString *)magazine {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    NSRange range = {0, 1};
    for (int i = 0;i < magazine.length;i++) {
        range.location = i;
        NSString *ch = [magazine substringWithRange:range];
        int preCount = 0;
        if ([dict objectForKey:ch]) {
            preCount = [[dict objectForKey:ch] unsignedIntValue];
        }
        [dict setObject:@(preCount + 1) forKey:ch];
    }
    //Compare with characters of Ransom string
    for (int i = 0;i < ransom.length;i++) {
        range.location = i;
        NSString *ch = [ransom substringWithRange:range];
        if (![dict objectForKey:ch] || [[dict objectForKey:ch] unsignedIntValue] <= 0) {
            return NO;
        }
        else {
            [dict setObject:@([[dict objectForKey:ch] unsignedIntValue] - 1) forKey:ch];
        }
    }
    return YES;
}

//Given access only to that node, delete it from the Linked List
-(void) deleteNode:(struct LinkedList *)node {
    if (node == NULL)
        return;
    if (node->next != NULL) {
        node->val = node->next->val;
        node->next = node->next->next;
    }
}

-(NSArray*) arrayIntersection:(NSArray *)nums1 secondArray:(NSArray *)nums2 {
    NSSet *set1 = [NSSet setWithArray:nums1];
    NSMutableSet *set2 = [[NSMutableSet alloc] init];
    for (int i = 0;i < nums2.count;i++) {
        if ([set1 containsObject:[nums2 objectAtIndex:i]]) {
            [set2 addObject:[nums2 objectAtIndex:i]];
        }
    }
    return [NSArray arrayWithObjects:[set2 allObjects]];
}

//Given two binary trees return YES if they are equal
-(BOOL) isSameTree:(struct TreeNode *)p secondTree:(struct TreeNode *)q {
    if (p == NULL && q == NULL)
        return YES;
    if (p == NULL || q == NULL)
        return NO;
    if (p->val == q->val)
        return [self isSameTree:p->left secondTree:q->left] && [self isSameTree:p->right secondTree:q->right];
    return NO;
}

//Given a string of alphabets return the column number for Excel sheet
-(NSInteger) excelSheetColumnNumber:(NSString *)s {
    int count = 0;
    for (int i = 0;i < s.length;i++) {
        count *= 26 + ([s characterAtIndex:i] - 'A' + 1);
    }
    return count;
}

//Merge Sort
-(void) mergeSort: (NSMutableArray*) arr leftIndex: (NSInteger) l rightIndex: (NSInteger) r {
    if (l < r) {
        NSInteger m = l + (r - 1) / 2;
        [self mergeSort:arr leftIndex:l rightIndex:m];
        [self mergeSort:arr leftIndex:m + 1 rightIndex:r];
    }
}

-(void) mergeArrays: (NSMutableArray*) arr leftIndex: (NSInteger) l middleIndex: (NSInteger) m rightIndex: (NSInteger) r {
    NSInteger i, j, k;
    NSInteger n1 = m - l + 1, n2 = r - m;
    NSMutableArray *L = [[NSMutableArray alloc] initWithCapacity:n1];
    NSMutableArray *R = [[NSMutableArray alloc] initWithCapacity:n2];
    //Store temp data in left and right arrays
    for (i = 0;i < n1;i++) {
        [L addObject:arr[l + i]];
    }
    for (j = 0;j < n2;j++) {
        [R addObject:arr[m + 1 + j]];
    }
    i = 0;
    j = 0;
    k = l;
    //Compare values in L and R array and replace it in the input array
    while (i < n1 && j < n2) {
        if (L[i] <= R[j]) {
            [arr replaceObjectAtIndex:k withObject:[L objectAtIndex:i]];
            i++;
        } else {
            [arr replaceObjectAtIndex:k withObject:[R objectAtIndex:j]];
            j++;
        }
        k++;
    }
    
    //Add the remaining object from L
    while (i < n1) {
        [arr replaceObjectAtIndex:k withObject:[L objectAtIndex:i]];
        i++;
        k++;
    }
    
    //Add the remaining object from R
    while (j < n2) {
        [arr replaceObjectAtIndex:k withObject:[R objectAtIndex:j]];
        j++;
        k++;
    }
}

//Quick Sort
-(void) quickSort: (NSMutableArray*) arr lowIndex: (NSInteger) low highIndex: (NSInteger) high {
    if (low < high) {
        NSInteger part = [self partitionQuickSort:arr lowIndex:low highIndex:high];
        [self quickSort:arr lowIndex:low highIndex:part - 1];
        [self quickSort:arr lowIndex:part + 1 highIndex:high];
    }
}

-(NSInteger) partitionQuickSort: (NSMutableArray*) arr lowIndex: (NSInteger) low highIndex: (NSInteger) high {
    NSInteger pivot = [arr[high] integerValue];
    NSInteger i = low - 1;
    for (NSInteger j = low;j < high;j++) {
        if ([arr[j] integerValue] <= pivot) {
            i++;
            NSInteger temp = [arr[i] integerValue];
            arr[i] = arr[j];
            [arr replaceObjectAtIndex:j withObject:[NSNumber numberWithInteger:temp]];
        }
    }
    //replace arr[i + 1] with high or pivot whichever is the case
    NSInteger temp = [arr[i + 1] integerValue];
    arr[i + 1] = arr[high];
    [arr replaceObjectAtIndex:high withObject:[NSNumber numberWithInteger:temp]];
    return i + 1;
}

//Check if the given string is palindrome or not. If not check if it can become palindrome with just one character change
-(BOOL) validPalindrome:(NSString *)s {
    if (s.length == 0)
        return YES;
    NSInteger l = 0;
    NSInteger r = s.length - 1;
    while (l <= r && [s characterAtIndex:l] == [s characterAtIndex:r]) {
        l++;
        r--;
    }
    if (l >= r)
        return YES;
    return [self isPalindrome:s leftIndex:l + 1 rightIndex:r] || [self isPalindrome:s leftIndex:l rightIndex:r - 1];
}

-(BOOL) isPalindrome: (NSString*) s leftIndex: (NSInteger) l rightIndex: (NSInteger) r {
    while (l < r) {
        if ([s characterAtIndex:l] != [s characterAtIndex:r])
            return NO;
        l++;
        r--;
    }
    return YES;
}

//Given a BST return YES if  any two elements sum up to the target value
-(BOOL) twoSumBST:(struct TreeNode *)root targetValue:(NSInteger)k {
    NSMutableSet *set = [[NSMutableSet alloc] init];
    return [self traverseTree:root setOfValues:set targetValue:k];
}

-(BOOL) traverseTree: (struct TreeNode*) root setOfValues: (NSMutableSet*) set targetValue: (NSInteger) k {
    if (root == nil)
        return false;
    if ([set containsObject:[NSNumber numberWithInteger:k - root->val]])
        return true;
    [set addObject:[NSNumber numberWithInteger:root->val]];
    return [self traverseTree:root->left setOfValues:set targetValue:k] || [self traverseTree:root->right setOfValues:set targetValue:k];
}

//Given two numbers in the form of linked lists made of each digits in reverse form return their sum in reverse as a linked list
-(struct LinkedList*) addListsReverse:(struct LinkedList *)l1 secondList:(struct LinkedList *)l2 {
    struct LinkedList * c1 = l1;
    struct LinkedList * c2 = l2;
    struct LinkedList * head = (struct LinkedList *) malloc(sizeof(struct LinkedList));
    head->val = 0;
    struct LinkedList * temp = head;
    int sum = 0;
    while (c1 != nil || c2 != nil) {
        sum /= 10;
        if (c1 != nil) {
            sum += c1->val;
            c1 = c1->next;
        }
        if (c2 != nil) {
            sum += c2->val;
            c2 = c2->next;
        }
        temp->next = (struct LinkedList*) malloc(sizeof(struct LinkedList));
        temp->next->val = sum % 10;
        temp = temp->next;
    }
    if (sum / 10 == 1) {
        temp->next = (struct LinkedList*) malloc(sizeof(struct LinkedList));
        temp->next->val = 1;
    }
    return head->next;
}

-(NSString*) addBinaryNumbers:(NSString *)s secondNumber:(NSString *)t {
    if (s.length == 0)
        return t;
    if (t.length == 0)
        return s;
    NSInteger i = s.length - 1;
    NSInteger j = t.length - 1;
    NSInteger carry = 0;
    NSMutableString *result = [[NSMutableString alloc] init];
    NSString *finalAns = [[NSString alloc] init];
    while (i >= 0 || j >= 0) {
        NSInteger sum = carry;
        if (i >= 0)
            sum += [s characterAtIndex:i--] - '0';
        if (j >= 0)
            sum += [t characterAtIndex:j--] - '0';
        [result appendString:[NSString stringWithFormat:@"%ld", (sum % 2)]];
        carry = sum / 2;
    }
    if (carry != 0)
        [result appendString:[NSString stringWithFormat:@"%ld", carry]];
    return [finalAns stringByAppendingString:result];
}

//Given a string find the longest common substring  without repeating characters
-(NSInteger) lengthOfLongestSubstring:(NSString *)s {
    NSInteger count = 0;
    NSMutableSet *set = [[NSMutableSet alloc] init];
    NSInteger i = 0;
    NSInteger j = 0;
    while (i < s.length) {
        if (![set containsObject:[NSNumber numberWithChar:[s characterAtIndex:i]]]) {
            [set addObject:[NSNumber numberWithChar:[s characterAtIndex:i++]]];
            count = MAX(count, set.count);
        } else {
            [set removeObject:[NSNumber numberWithChar:[s characterAtIndex:j++]]];
        }
    }
    return count;
}

//Given a string representing a Roman number converting the equivalent number to integer value
-(NSInteger) value:(char) ch {
    switch (ch) {
        case 'I':
            return 1;
        case 'V':
            return 5;
        case 'X':
            return 10;
//        case 'L':
//            return 50;
        case 'C':
            return 100;
        case 'D':
            return 500;
        case 'M':
            return 1000;
        default:
            break;
    }
    return 0;
}

-(NSInteger) romanToInteger:(NSString *)s {
    if (s.length == 0)
        return 0;
    NSInteger sum = 0;
    for (NSInteger i = 0; i < s.length; i++) {
        NSInteger s1 = [self value:[s characterAtIndex:i]];
        if (i + 1 < s.length) {
            NSInteger s2 = [self value:[s characterAtIndex:i + 1]];
            if (s1 >= s2) {
                sum += s1;
            } else {
                sum += s2 - s1;
                i++;
            }
        } else {
            sum += s1;
        }
    }
    return sum;
}

//Given BST, return the average of different levels of nodes in an array.
-(NSArray*) avgOfLevelsInBst:(struct TreeNode *)root {
    if (root == nil)
        return nil;
    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
    NSMutableArray *queue = [[NSMutableArray alloc] init];
    [queue addObject:[NSValue valueWithPointer:root]];
    while (queue.count != 0) {
        double avg = 0;
        for (NSInteger i = 0; i < queue.count; i++) {
            struct TreeNode *temp = [[queue objectAtIndex:i] pointerValue];
            avg += temp->val;
//            [queue removeObjectAtIndex:0]; This line is needed but due to unexpected error its commented.
            if (temp->left != nil)
                [queue addObject:[NSValue valueWithPointer:temp->left]];
            if (temp->right != nil)
                [queue addObject:[NSValue valueWithPointer:temp->right]];
        }
        [tempArr addObject:[NSNumber numberWithInteger:avg / queue.count]];
    }
    return [NSArray arrayWithArray:tempArr];
}

//Given two binary trees s & t, check if t has exactly the same nodes and same values as one of the subtrees present in s.
-(BOOL) isSubtree:(struct TreeNode *)s subtree:(struct TreeNode *)t {
    if (s == nil)
        return NO;
    if ([self isSimilar:s secondTree:t])
        return YES;
    return [self isSubtree:s->left subtree:t] || [self isSubtree:s->right subtree:t];
}

-(BOOL) isSimilar: (struct TreeNode*) s secondTree: (struct TreeNode*) t {
    if (s == nil && t == nil)
        return YES;
    if (s == nil || t == nil)
        return NO;
    if (s->val != t->val)
        return NO;
    return [self isSimilar:s->left secondTree:t->left] && [self isSimilar:s->right secondTree:t->right];
}

//Given a binary tree, return all the paths from root to leaf
-(NSArray*) binaryTreePaths:(struct TreeNode *)root {
    NSMutableArray *res = [[NSMutableArray alloc] init];
    if (root == nil)
        return [NSArray arrayWithArray:res];
    if (root->left == nil && root->right == nil) {
        [res addObject:@(root->val)];
        return [NSArray arrayWithArray:res];
    }
    NSArray *leftArr = [self binaryTreePaths:root->left];
    for (NSInteger i = 0;i < leftArr.count;i++) {
        [res addObject:@(root->val)];
        [res addObject:[NSString stringWithFormat:@"->"]];
        [res addObject:leftArr[i]];
    }
    NSArray *rightArr = [self binaryTreePaths:root->right];
    for (NSInteger i = 0;i < rightArr.count;i++) {
        [res addObject:@(root->val)];
        [res addObject:[NSString stringWithFormat:@"->"]];
        [res addObject:rightArr[i]];
    }
    
    return [NSArray arrayWithArray:res];
}

//Inserting a node at a specific place in linked list
-(void) insertNode:(struct LinkedList *)prev newNodeValue:(int)n {
    if (prev == nil)
        return;
    struct LinkedList *newNode = (struct LinkedList*)malloc(sizeof(struct LinkedList));
    newNode->val = n;
    newNode->next = prev->next;
    prev->next = newNode;
}

//Given two sorted arrays merge them and return one sorted array without using extra space. Assume that the 1st array has enough space to store values of 2nd array.
-(void) mergeSortedArrays:(NSMutableArray *)n1 lengthOfn1:(NSInteger)m secondSmallerArray:(NSArray *)n2 lengthOfn2:(NSInteger)n {
    NSInteger i, j, k;
    i = m - 1;
    j = n - 1;
    k = m + n - 1;
    while (i >= 0 && j >= 0) {
        if (n1[i] > n2[j])
            n1[k--] = n1[i--];
        else
            n1[k--] = n2[j--];
    }
    
    while (j >= 0) {
        n1[k--] = n2[j--];
    }
}


@end
