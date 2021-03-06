//
//  FacebookButtonCell.m
//  WizardWar
//
//  Created by Sean Hess on 7/19/13.
//  Copyright (c) 2013 The LAB. All rights reserved.
//

#import "SettingsFacebookButtonCell.h"
#import <BButton.h>
#import "UserFriendService.h"

@interface SettingsFacebookButtonCell ()
@property (nonatomic, strong) BButton * button;
@property (nonatomic, strong) UIActivityIndicatorView * activityIndicator;

@end

@implementation SettingsFacebookButtonCell

-(id)initWithReuseIdentifier:(NSString*)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        
        BButton * button = [[BButton alloc] initWithFrame:self.contentView.bounds type:BButtonTypeFacebook icon:FAIconEyeOpen fontSize:18.0];
        button.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [button addTarget:self action:@selector(didTapFacebook) forControlEvents:UIControlEventTouchUpInside];
        button.userInteractionEnabled = NO;
        
        [self.contentView addSubview:button];
        self.button = button;
        
        self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        self.activityIndicator.frame = CGRectMake(0, 0, 100, self.contentView.frame.size.height);
        self.activityIndicator.hidesWhenStopped = YES;
        [self.contentView addSubview:self.activityIndicator];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setTitle:(NSString *)title {
    _title = title;
    [self.button setTitle:title forState:UIControlStateNormal];
    [self.button addAwesomeIcon:FAIconFacebookSign beforeTitle:YES];
}

-(void)setWaiting:(BOOL)waiting {
    _waiting = waiting;
    self.button.enabled = waiting;
    if (waiting) {
        [self.activityIndicator startAnimating];
    } else {
        [self.activityIndicator stopAnimating];
    }
}

- (void)didTapFacebook {
    [self setSelected:YES animated:YES];
}



@end
