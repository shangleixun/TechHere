//
//  HotLang_BaseClass.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotLang_BaseClass.h"
#import "HotLang_Random.h"
#import "HotLang_Article.h"
#import "HotLang_Category.h"
#import "HotLang_Banner.h"
#import "HotLang_Hotarticle.h"
#import "HotLang_Misarticle.h"
#import "HotLang_Headline.h"


NSString *const kHotLang_BaseClassStatus = @"status";
NSString *const kHotLang_BaseClassRandom = @"random";
NSString *const kHotLang_BaseClassArticle = @"article";
NSString *const kHotLang_BaseClassFolder = @"folder";
NSString *const kHotLang_BaseClassCategory = @"category";
NSString *const kHotLang_BaseClassBanner = @"banner";
NSString *const kHotLang_BaseClassHotarticle = @"hotarticle";
NSString *const kHotLang_BaseClassMsg = @"msg";
NSString *const kHotLang_BaseClassMisarticle = @"misarticle";
NSString *const kHotLang_BaseClassHeadline = @"headline";


@interface HotLang_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotLang_BaseClass

@synthesize status = _status;
@synthesize random = _random;
@synthesize article = _article;
@synthesize folder = _folder;
@synthesize category = _category;
@synthesize banner = _banner;
@synthesize hotarticle = _hotarticle;
@synthesize msg = _msg;
@synthesize misarticle = _misarticle;
@synthesize headline = _headline;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kHotLang_BaseClassStatus fromDictionary:dict];
    NSObject *receivedHotLang_Random = [dict objectForKey:kHotLang_BaseClassRandom];
    NSMutableArray *parsedHotLang_Random = [NSMutableArray array];
    if ([receivedHotLang_Random isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotLang_Random) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotLang_Random addObject:[HotLang_Random modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotLang_Random isKindOfClass:[NSDictionary class]]) {
       [parsedHotLang_Random addObject:[HotLang_Random modelObjectWithDictionary:(NSDictionary *)receivedHotLang_Random]];
    }

    self.random = [NSArray arrayWithArray:parsedHotLang_Random];
    NSObject *receivedHotLang_Article = [dict objectForKey:kHotLang_BaseClassArticle];
    NSMutableArray *parsedHotLang_Article = [NSMutableArray array];
    if ([receivedHotLang_Article isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotLang_Article) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotLang_Article addObject:[HotLang_Article modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotLang_Article isKindOfClass:[NSDictionary class]]) {
       [parsedHotLang_Article addObject:[HotLang_Article modelObjectWithDictionary:(NSDictionary *)receivedHotLang_Article]];
    }

    self.article = [NSArray arrayWithArray:parsedHotLang_Article];
            self.folder = [self objectOrNilForKey:kHotLang_BaseClassFolder fromDictionary:dict];
    NSObject *receivedHotLang_Category = [dict objectForKey:kHotLang_BaseClassCategory];
    NSMutableArray *parsedHotLang_Category = [NSMutableArray array];
    if ([receivedHotLang_Category isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotLang_Category) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotLang_Category addObject:[HotLang_Category modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotLang_Category isKindOfClass:[NSDictionary class]]) {
       [parsedHotLang_Category addObject:[HotLang_Category modelObjectWithDictionary:(NSDictionary *)receivedHotLang_Category]];
    }

    self.category = [NSArray arrayWithArray:parsedHotLang_Category];
    NSObject *receivedHotLang_Banner = [dict objectForKey:kHotLang_BaseClassBanner];
    NSMutableArray *parsedHotLang_Banner = [NSMutableArray array];
    if ([receivedHotLang_Banner isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotLang_Banner) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotLang_Banner addObject:[HotLang_Banner modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotLang_Banner isKindOfClass:[NSDictionary class]]) {
       [parsedHotLang_Banner addObject:[HotLang_Banner modelObjectWithDictionary:(NSDictionary *)receivedHotLang_Banner]];
    }

    self.banner = [NSArray arrayWithArray:parsedHotLang_Banner];
    NSObject *receivedHotLang_Hotarticle = [dict objectForKey:kHotLang_BaseClassHotarticle];
    NSMutableArray *parsedHotLang_Hotarticle = [NSMutableArray array];
    if ([receivedHotLang_Hotarticle isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotLang_Hotarticle) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotLang_Hotarticle addObject:[HotLang_Hotarticle modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotLang_Hotarticle isKindOfClass:[NSDictionary class]]) {
       [parsedHotLang_Hotarticle addObject:[HotLang_Hotarticle modelObjectWithDictionary:(NSDictionary *)receivedHotLang_Hotarticle]];
    }

    self.hotarticle = [NSArray arrayWithArray:parsedHotLang_Hotarticle];
            self.msg = [self objectOrNilForKey:kHotLang_BaseClassMsg fromDictionary:dict];
    NSObject *receivedHotLang_Misarticle = [dict objectForKey:kHotLang_BaseClassMisarticle];
    NSMutableArray *parsedHotLang_Misarticle = [NSMutableArray array];
    if ([receivedHotLang_Misarticle isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotLang_Misarticle) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotLang_Misarticle addObject:[HotLang_Misarticle modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotLang_Misarticle isKindOfClass:[NSDictionary class]]) {
       [parsedHotLang_Misarticle addObject:[HotLang_Misarticle modelObjectWithDictionary:(NSDictionary *)receivedHotLang_Misarticle]];
    }

    self.misarticle = [NSArray arrayWithArray:parsedHotLang_Misarticle];
    NSObject *receivedHotLang_Headline = [dict objectForKey:kHotLang_BaseClassHeadline];
    NSMutableArray *parsedHotLang_Headline = [NSMutableArray array];
    if ([receivedHotLang_Headline isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotLang_Headline) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotLang_Headline addObject:[HotLang_Headline modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotLang_Headline isKindOfClass:[NSDictionary class]]) {
       [parsedHotLang_Headline addObject:[HotLang_Headline modelObjectWithDictionary:(NSDictionary *)receivedHotLang_Headline]];
    }

    self.headline = [NSArray arrayWithArray:parsedHotLang_Headline];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kHotLang_BaseClassStatus];
    NSMutableArray *tempArrayForRandom = [NSMutableArray array];
    for (NSObject *subArrayObject in self.random) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRandom addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRandom addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRandom] forKey:kHotLang_BaseClassRandom];
    NSMutableArray *tempArrayForArticle = [NSMutableArray array];
    for (NSObject *subArrayObject in self.article) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForArticle addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForArticle addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForArticle] forKey:kHotLang_BaseClassArticle];
    NSMutableArray *tempArrayForFolder = [NSMutableArray array];
    for (NSObject *subArrayObject in self.folder) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForFolder addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForFolder addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForFolder] forKey:kHotLang_BaseClassFolder];
    NSMutableArray *tempArrayForCategory = [NSMutableArray array];
    for (NSObject *subArrayObject in self.category) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCategory addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCategory addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCategory] forKey:kHotLang_BaseClassCategory];
    NSMutableArray *tempArrayForBanner = [NSMutableArray array];
    for (NSObject *subArrayObject in self.banner) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBanner addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBanner addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBanner] forKey:kHotLang_BaseClassBanner];
    NSMutableArray *tempArrayForHotarticle = [NSMutableArray array];
    for (NSObject *subArrayObject in self.hotarticle) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHotarticle addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHotarticle addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHotarticle] forKey:kHotLang_BaseClassHotarticle];
    [mutableDict setValue:self.msg forKey:kHotLang_BaseClassMsg];
    NSMutableArray *tempArrayForMisarticle = [NSMutableArray array];
    for (NSObject *subArrayObject in self.misarticle) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMisarticle addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMisarticle addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMisarticle] forKey:kHotLang_BaseClassMisarticle];
    NSMutableArray *tempArrayForHeadline = [NSMutableArray array];
    for (NSObject *subArrayObject in self.headline) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHeadline addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHeadline addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHeadline] forKey:kHotLang_BaseClassHeadline];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.status = [aDecoder decodeObjectForKey:kHotLang_BaseClassStatus];
    self.random = [aDecoder decodeObjectForKey:kHotLang_BaseClassRandom];
    self.article = [aDecoder decodeObjectForKey:kHotLang_BaseClassArticle];
    self.folder = [aDecoder decodeObjectForKey:kHotLang_BaseClassFolder];
    self.category = [aDecoder decodeObjectForKey:kHotLang_BaseClassCategory];
    self.banner = [aDecoder decodeObjectForKey:kHotLang_BaseClassBanner];
    self.hotarticle = [aDecoder decodeObjectForKey:kHotLang_BaseClassHotarticle];
    self.msg = [aDecoder decodeObjectForKey:kHotLang_BaseClassMsg];
    self.misarticle = [aDecoder decodeObjectForKey:kHotLang_BaseClassMisarticle];
    self.headline = [aDecoder decodeObjectForKey:kHotLang_BaseClassHeadline];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kHotLang_BaseClassStatus];
    [aCoder encodeObject:_random forKey:kHotLang_BaseClassRandom];
    [aCoder encodeObject:_article forKey:kHotLang_BaseClassArticle];
    [aCoder encodeObject:_folder forKey:kHotLang_BaseClassFolder];
    [aCoder encodeObject:_category forKey:kHotLang_BaseClassCategory];
    [aCoder encodeObject:_banner forKey:kHotLang_BaseClassBanner];
    [aCoder encodeObject:_hotarticle forKey:kHotLang_BaseClassHotarticle];
    [aCoder encodeObject:_msg forKey:kHotLang_BaseClassMsg];
    [aCoder encodeObject:_misarticle forKey:kHotLang_BaseClassMisarticle];
    [aCoder encodeObject:_headline forKey:kHotLang_BaseClassHeadline];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotLang_BaseClass *copy = [[HotLang_BaseClass alloc] init];
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.random = [self.random copyWithZone:zone];
        copy.article = [self.article copyWithZone:zone];
        copy.folder = [self.folder copyWithZone:zone];
        copy.category = [self.category copyWithZone:zone];
        copy.banner = [self.banner copyWithZone:zone];
        copy.hotarticle = [self.hotarticle copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.misarticle = [self.misarticle copyWithZone:zone];
        copy.headline = [self.headline copyWithZone:zone];
    }
    
    return copy;
}


@end
