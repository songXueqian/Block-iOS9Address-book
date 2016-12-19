//
//  NoteManagedObject+CoreDataProperties.h
//  block
//
//  Created by 宋学谦 on 16/1/14.
//  Copyright © 2016年 Song Xueqian. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "NoteManagedObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface NoteManagedObject (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
