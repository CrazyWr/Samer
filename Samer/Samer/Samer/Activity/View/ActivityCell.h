//
//  ActivityCell.h
//  Samer
//
//  Created by wei on 16/6/4.
//
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"

@interface ActivityCell : UITableViewCell

- (void)loadDataFromModel:(ActivityModel *)model;

@end
