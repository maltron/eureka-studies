//
//  form.swift
//  Eureka-Studies
//
//  Created by Mauricio Leal on 1/7/18.
//  Copyright © 2018 Mauricio Leal. All rights reserved.
//

import Foundation

protocol NFormDelegate: class {
    func sectionsHaveBeenAdded(_ sections: [NSection], at: IndexSet)
    func sectionsHaveBeenRemoved(_ sections: [NSection], at: IndexSet)
    func sectionsHaveBeenReplaced(oldSections: [NSection], newSections: [NSection], at: IndexSet)
}

public final class NForm {
    
    // Form's Delegate
    weak var delegate: NFormDelegate?
    
    public init() {
    }
  
}

extension NForm {
    
    // Key-Value Observing Wrapper (perhaps ???)
    class KVOWrapper: NSObject {
        @objc dynamic private var _sections = NSMutableArray()
        var sections: NSMutableArray { return mutableArrayValue(forKey: "_sections")}
        var _allSections = [NSection]()
        private weak var form: NForm?
        
        init(form: NForm) {
            self.form = form
            super.init()
            addObserver(self, forKeyPath: "_sections", options: NSKeyValueObservingOptions.new.union(.old), context: nil)
        }
        
        deinit {
            removeObserver(self, forKeyPath: "_sections")
            _sections.removeAllObjects()
            _allSections.removeAll()
        }
        
        public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            let newSections = change?[NSKeyValueChangeKey.newKey] as? [NSection] ?? []
            let oldSections = change?[NSKeyValueChangeKey.oldKey] as? [NSection] ?? []
            
            guard let delegateValue = form?.delegate, let keyPathValue = keyPath, let changeType = change?[NSKeyValueChangeKey.kindKey] else { return }
            guard keyPathValue == "_sections" else { return }
            
            switch(changeType as! NSNumber).uintValue {
            case NSKeyValueChange.setting.rawValue:
                let indexSet = change![NSKeyValueChangeKey.indexesKey] as? IndexSet ?? IndexSet(integer: 0)
                delegateValue.sectionsHaveBeenAdded(newSections, at: indexSet)
            case NSKeyValueChange.insertion.rawValue:
                let indexSet = change![NSKeyValueChangeKey.indexesKey] as! IndexSet
                delegateValue.sectionsHaveBeenAdded(newSections, at: indexSet)
            case NSKeyValueChange.removal.rawValue:
                let indexSet = change![NSKeyValueChangeKey.indexesKey] as! IndexSet
                delegateValue.sectionsHaveBeenRemoved(oldSections, at: indexSet)
            case NSKeyValueChange.replacement.rawValue:
                let indexSet = change![NSKeyValueChangeKey.indexesKey] as! IndexSet
                delegateValue.sectionsHaveBeenReplaced(oldSections: oldSections, newSections: newSections, at: indexSet)
            default:
                assertionFailure()
            }
        }

    }
}

class NSection {
    
}

