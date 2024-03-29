//
//  MemoPresenter.swift
//  MVPPractice
//
//  Created by heerucan on 2023/03/03.
//

import Foundation

/*
 Presenter는 View와 Model을 중재하는 역할, 각각의 인터페이스를 가지고 있고, 그로 인해 의존성이 생김
 완벽한 분리, 독립은 불가능
 */

final class MemoPresenter: MemoPresenterProtocol {
    
    // MemoView 관련 인터페이스에 초기화 시 의존하는 것을 볼 수 있음
    weak var memoView: MemoViewProtocol?
    private var memoModel: Memo
    
    init(view: MemoViewProtocol, model: Memo) {
        self.memoView = view
        self.memoModel = model
    }
    
    // MARK: - Protocol Method
    
    // 모델에서 메모를 추가/삭제할 때 Presenter를 거쳐 View에게 알리게 된다.
    // View에서는 Presenter를 거쳐 Model에 변경사항을 알리게 된다.
    func addButtonClicked(with memo: Memo) {
        memoModel.addMemo(memo)
        memoView?.addMemo(memo: memo)
    }
    
    func deleteSelectedMemo(for indexPath: IndexPath) {
        memoView?.deleteMemo(for: indexPath, memo: memoModel)
    }
    
    func updateSelectedMemo(for indexPath: IndexPath, with memo: String) {
        memoModel.contents[indexPath.item] = memo
        memoView?.updateMemo(for: indexPath, memo: memoModel)
    }
}
