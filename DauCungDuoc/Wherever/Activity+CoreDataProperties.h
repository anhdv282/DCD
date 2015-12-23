//
//  Activity+CoreDataProperties.h
//  Wherever
//
//  Created by mac on 12/22/15.
//  Copyright © 2015 Viet Anh Dang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Activity.h"

NS_ASSUME_NONNULL_BEGIN

@interface Activity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *imageName;
@property (nullable, nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
