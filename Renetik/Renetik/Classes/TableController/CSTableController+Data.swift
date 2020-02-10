//
//  CSTableListDataLoader.swift
//
//  Created by Rene Dohan on 3/8/19.
//

import UIKit
import RenetikObjc

public extension CSTableController {

    public func data(for path: IndexPath) -> Row { data[path.row] }

    @discardableResult
    public func reload(row: Row) -> Self {
        let tableIsAtBottom = isAtBottom()
        let index = data.index(of: row)!
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        if tableIsAtBottom { scrollToBottom() }
        return self
    }

    @discardableResult
    public func add(item: Row) -> Self {
        _data.add(item)
        filterDataAndReload()
        return self
    }

    @discardableResult
    public func insert(item: Row, index: Int) -> Self {
        _data.insert(item, at: index)
        filterDataAndReload()
        return self
    }

    @discardableResult
    public func remove(item: Row) -> Self {
        _data.remove(item)
        filterDataAndReload()
        return self
    }

    @discardableResult
    public func remove(item index: Int) -> Self {
        _data.remove(at: index)
        filterDataAndReload()
        return self
    }

    @discardableResult
    public func clear() -> Self {
        _data.removeAll()
        filterDataAndReload()
        return self
    }
}
