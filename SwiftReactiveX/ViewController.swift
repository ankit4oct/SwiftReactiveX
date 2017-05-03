//
//  ViewController.swift
//  SwiftReactiveX
//
//  Created by ANKIT SHARMA on 29/04/17.
//  Copyright © 2017 ANKIT SHARMA. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

struct Human{
 
    let name : String
    let age : Int
    
}



class ViewController: UIViewController {
    
    let humanArray =
    [
        
        Human(name: "John", age: 10),
        Human(name: "Rex", age: 11),
        Human(name: "Tina", age: 12),
        Human(name: "Yen", age: 15),
        Human(name: "Tom", age: 13),
        Human(name: "Jim", age: 18),
        Human(name: "Anderson", age: 22),
    ]
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let objAray : Observable<[Human]> = Observable.just(humanArray)
        objAray.bind(to: myTable.rx.items(cellIdentifier: "reuseIdentifier")){
            
            _, human, cell in
            if let cellToUse = cell as? TableViewCell {
                cellToUse.label1.text = human.name
                cellToUse.label2.text = "\(human.age)"
            }
        }.addDisposableTo(disposeBag)
        
        
        myTable.rx.modelSelected(Human.self).subscribe(onNext:{
             human in
            print(human.name)
        
        } ).addDisposableTo(disposeBag)
        
        
        myTable.rx.itemSelected.subscribe(onNext :{
        [weak self] indexPath in
            if let cell = self?.myTable.cellForRow(at: indexPath) as? TableViewCell{
               
                cell.label1.text = "MyChoice"
                
            }
            
        
        }).addDisposableTo(disposeBag)
        
    }

   }

