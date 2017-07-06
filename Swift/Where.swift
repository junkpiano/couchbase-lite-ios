//
//  Where.swift
//  CouchbaseLite
//
//  Created by Pasin Suriyentrakorn on 3/20/17.
//  Copyright © 2017 Couchbase. All rights reserved.
//

import Foundation

public final class Where: Query, GroupByRouter, OrderByRouter {
    
    /** Create and chain an ORDER BY clause component to specify the order of the query result. */
    public func orderBy(_ orders: OrderBy...) -> OrderBy {
        return OrderBy(query: self, impl: OrderBy.toImpl(orders: orders))
    }
    
    /** Create and chain a GROUP BY component to group the query result. */
    public func groupBy(_ groupBy: GroupBy...) -> GroupBy {
        return GroupBy(query: self, impl: GroupBy.toImpl(groupBies: groupBy))
    }
    
    /** An internal constructor. */
    init(query: Query, impl: CBLQueryExpression) {
        super.init()
        
        self.copy(query)
        self.whereImpl = impl
    }
    
}
