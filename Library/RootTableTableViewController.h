//
//  RootTableTableViewController.h
//  Library
//
//  Created by eric on 14/04/2020.
//  Copyright © 2020 SLCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connector.h"

NS_ASSUME_NONNULL_BEGIN

@interface RootTableTableViewController : UITableViewController
@property (nonatomic,strong)Connector *connectorClass;
@end

NS_ASSUME_NONNULL_END
