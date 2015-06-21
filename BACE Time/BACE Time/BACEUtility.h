//
//  BACEUtility.h
//  ParseStarterProject
//
//  Created by Romy on 6/7/15.
//
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface BACEUtility : NSObject

+ (UIFont *)baceCellFont;
+ (UIColor *)baceCellFontColor;
+ (UIFont *)secondaryCellFont;
+ (NSDateFormatter *)baceDateFormatter;
+ (NSDictionary *)neighborhoodKeys;

+ (void)fetchObjectIDDictionaryForClassName:(NSString *)className
                                selectedKey:(NSString *)selectedKey
                                  withBlock:(void(^)(NSDictionary *objectIDDictionary, BOOL success, NSError *error))completionBlock;

@end
