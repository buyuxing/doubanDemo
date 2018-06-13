//
//  MovieStyleEvenCell.m
//  douban
//
//  Created by 步宇星 on 2018/6/11.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "MovieStyleEvenCell.h"

@interface MovieStyleEvenCell()

@property (nonatomic, strong) UILabel * nameLabel;
@property (nonatomic, strong) UILabel * averageLabel;
@property (nonatomic, strong) UILabel * tapsLabel;
@property (nonatomic, strong) UIImageView * moviePosterImageView;

@end

@implementation MovieStyleEvenCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.nameLabel];
        [self addSubview:self.averageLabel];
        [self addSubview:self.tapsLabel];
        [self addSubview:self.moviePosterImageView];
    }
    return self;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        UILabel * nameLabel = [[UILabel alloc] init];
        nameLabel.textColor = [Util purpleColor];
        nameLabel.font = [Util pingFangSCSemiboldWithSize:20];
        _nameLabel = nameLabel;
    }
    return _nameLabel;
}

- (UILabel *)averageLabel{
    if (!_averageLabel) {
        UILabel * averageLabel = [[UILabel alloc] init];
        averageLabel.textColor = [Util purpleColor];
        averageLabel.font = [Util pingFangSCRegularWithSize:12];
        _averageLabel = averageLabel;
    }
    return _averageLabel;
}

- (UILabel *)tapsLabel{
    if (!_tapsLabel) {
        UILabel * tapsLabel = [[UILabel alloc] init];
        tapsLabel.textColor = [Util purpleColor];
        tapsLabel.font = [Util pingFangSCRegularWithSize:14];
        _tapsLabel = tapsLabel;
    }
    return _tapsLabel;
}

- (UIImageView *)moviePosterImageView
{
    if (!_moviePosterImageView) {
        _moviePosterImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeHolderImage"]];
    }
    return _moviePosterImageView;
}

- (void) configCellWithModel:(id<MovieStyleEvenCellModelProtocol>)model
{
    self.nameLabel.text = model.name;
    self.averageLabel.text = model.average;
    self.tapsLabel.text = model.taps;
    [self.moviePosterImageView setUrl:model.imageUrl placeholder:[UIImage imageNamed:@"placeHolderImage"]];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect frame = self.nameLabel.frame;
    frame.origin.x = 5;
    frame.origin.y = 10;
    self.nameLabel.frame = frame;
    [self.nameLabel sizeToFit];
    frame = self.averageLabel.frame;
    frame.origin.x = 5;
    frame.origin.y = 10 + self.nameLabel.frame.size.height;
    self.averageLabel.frame = frame;
    [self.averageLabel sizeToFit];
    frame = self.tapsLabel.frame;
    frame.origin.x = 5;
    frame.origin.y = 5 + self.averageLabel.frame.origin.y + self.averageLabel.frame.size.height;
    self.tapsLabel.frame = frame;
    [self.tapsLabel sizeToFit];
    
    self.moviePosterImageView.frame = CGRectMake(self.bounds.size.width - 80, 0, 50, 75);
}

@end
