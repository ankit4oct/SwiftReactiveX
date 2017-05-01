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

struct Person{
 
    let name : String
    let age : Int
    
}



class ViewController: UIViewController {
    
    let personArray =
    [
        
        Person(name: "name1", age: 10),
        Person(name: "name2", age: 11),
        Person(name: "name3", age: 12),
        Person(name: "name4", age: 15),
        Person(name: "name5", age: 13),
        Person(name: "name6", age: 18),
        Person(name: "name7", age: 22),
        Person(name: "name8", age: 24),
        Person(name: "name9", age: 29),
        Person(name: "name10", age: 32)
    ]
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let objAray : Observable<[Person]> = Observable.just(personArray)
        objAray.bind(to: myTable.rx.items(cellIdentifier: "reuseIdentifier")){
            
            _, person, cell in
            if let cellToUse = cell as? TableViewCell {
                cellToUse.label1.text = person.name
                cellToUse.label2.text = "\(person.age)"
            }
        }.addDisposableTo(disposeBag)
        
        
        myTable.rx.modelSelected(Person.self).subscribe(onNext:{
             person in
            print(person.name)
        
        } ).addDisposableTo(disposeBag)
        
        
        myTable.rx.itemSelected.subscribe(onNext :{
        [weak self] indexPath in
            if let cell = self?.myTable.cellForRow(at: indexPath) as? TableViewCell{
               
                cell.label1.text = "newValue"
                
            }
            
        
        }).addDisposableTo(disposeBag)
        
    }

   }

