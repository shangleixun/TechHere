//
//  ReMenu_ClassList.m
//
//  Created by 雷勋 尚 on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReMenu_ClassList.h"


NSString *const kReMenu_ClassListClassName = @"class_name";
NSString *const kReMenu_ClassListHostname = @"hostname";
NSString *const kReMenu_ClassListClassId = @"class_id";


@interface ReMenu_ClassList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReMenu_ClassList

@synthesize className = _className;
@synthesize hostname = _hostname;
@synthesize classId = _classId;


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
            self.className = [self objectOrNilForKey:kReMenu_ClassListClassName fromDictionary:dict];
            self.hostname = [self objectOrNilForKey:kReMenu_ClassListHostname fromDictionary:dict];
            self.classId = [self objectOrNilForKey:kReMenu_ClassListClassId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.className forKey:kReMenu_ClassListClassName];
    [mutableDict setValue:self.hostname forKey:kReMenu_ClassListHostname];
    [mutableDict setValue:self.classId forKey:kReMenu_ClassListClassId];

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

    self.className = [aDecoder decodeObjectForKey:kReMenu_ClassListClassName];
    self.hostname = [aDecoder decodeObjectForKey:kReMenu_ClassListHostname];
    self.classId = [aDecoder decodeObjectForKey:kReMenu_ClassListClassId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_className forKey:kReMenu_ClassListClassName];
    [aCoder encodeObject:_hostname forKey:kReMenu_ClassListHostname];
    [aCoder encodeObject:_classId forKey:kReMenu_ClassListClassId];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReMenu_ClassList *copy = [[ReMenu_ClassList alloc] init];
    
    if (copy) {

        copy.className = [self.className copyWithZone:zone];
        copy.hostname = [self.hostname copyWithZone:zone];
        copy.classId = [self.classId copyWithZone:zone];
    }
    
    return copy;
}


@end
