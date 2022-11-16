//
//  ViewController.swift
//  GridViewDesign
//
//  Created by Ahmed Rajib on 10/11/22.
//

import UIKit

class ViewController: UIViewController {

     // MARK: - Outlet Collection list
    @IBOutlet weak var collectionview: UICollectionView!
    
    
     // MARK: - Variable Declarations
    let mainArray = [1,1,1,1,4,4,8]
    
    var subArray: [Int] = []
    var separetedArray:[Int] = []
    let spacing:CGFloat = 10
    
    var checkTempArrayIsNotEmpty = false
    var tempArray:[Int] = []
    var dynamicArray:[[Int]] = [[]]
    var isFirstTimeDeleted: Bool = false
    var storeDeletedIndex: [Int] = []
    var multiCellIsAlreadyShow = false
    var isFoundZero = false
    var indexOfZeros: [Int] = []
    var dynamicArraySize = 0
    var dynamicArrayIndexSize = [Int]()
    var multiCellItemValue: [[Int]] = [[]]
    
    let columnLayout = FlowLayout(
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        separetedArray = mainArray
        separetedArray.append(0)
        for (index,item) in separetedArray.enumerated() {
            if item == 1 {
                // MARK: - Get All 1 value from MainArray and Create an Array
                debugPrint("valu ", item)
                checkTempArrayIsNotEmpty = true
                tempArray.append(item)
                separetedArray[index] = 0
            }else {
                if checkTempArrayIsNotEmpty { // MARK: - Check tempArray is empty? IF empty then ignor or not empty Then assignInto dynamicArray as an Array
                    dynamicArray.append(tempArray)
                    tempArray.removeAll()
                    if dynamicArray[0] == [] {
                        dynamicArray.remove(at: 0)
                    }
                    checkTempArrayIsNotEmpty = false
                }
            }
        }
        
        separetedArray.removeLast()
        debugPrint("SUb array ", mainArray, "  se ", separetedArray,"dynamic Array ", dynamicArray )
        for (index,value) in separetedArray.enumerated() {
            if value == 0 {
                if !isFirstTimeDeleted {
                    isFirstTimeDeleted = true
                }else {
                    storeDeletedIndex.append(index)
                }
            }else { // MARK: - This is not 0
                isFirstTimeDeleted = false
            }
        }
//        dynamicArray = Array(count:separetedArray.count, repeatedValue:Int())
        for (_,removeItem) in separetedArray.enumerated() {
       
            if removeItem == 0 {
             if isFoundZero {
//                indexOfZeros.append(index) ignore cause last value we found 0
              }else {
                  indexOfZeros.append(removeItem)
                  
                  isFoundZero = true
             }
            }else {
                isFoundZero = false
                indexOfZeros.append(removeItem)
            }
        }
        

        separetedArray = indexOfZeros
        multiCellItemValue  = [[Int]] (repeating: [], count: indexOfZeros.count)
        debugPrint("Multi Cell Design Size ",multiCellItemValue.count, " ii ",indexOfZeros.count)
        
        for (index,valye) in separetedArray.enumerated() {
            if valye == 0 {
                let firstValue = dynamicArray.first ?? []
                multiCellItemValue.insert(firstValue, at: index)
                dynamicArray.remove(at: 0)
            }
        }
        debugPrint("Final array ",separetedArray, "Test ",multiCellItemValue)
        setupUI()
    }

    private func setupUI() {
        
        collectionview.register(MediumCell.nib, forCellWithReuseIdentifier: MediumCell.identifier)
        collectionview.register(fullWidthItem.nib, forCellWithReuseIdentifier: fullWidthItem.identifier)
        collectionview.register(MultipleCell.nib, forCellWithReuseIdentifier: MultipleCell.identifier)

        collectionview.delegate = self
        collectionview.dataSource = self
        
        self.collectionview.collectionViewLayout = columnLayout
        
        
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return separetedArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if separetedArray[indexPath.row] == 4 {
            multiCellIsAlreadyShow = false
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediumCell.identifier, for: indexPath) as? MediumCell
            return cell!
        }else if separetedArray[indexPath.row] == 8 {
            multiCellIsAlreadyShow = false
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fullWidthItem.identifier, for: indexPath) as? fullWidthItem
            
            return cell!
        }else {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultipleCell.identifier, for: indexPath) as? MultipleCell
            if !multiCellIsAlreadyShow {

                cell?.totalCell = multiCellItemValue[indexPath.row]
                
                
//                dynamicArray.remove(at: 0)
                debugPrint("Index of path ",dynamicArraySize)
//                cell?.totalCell.remove(at: 0)
                multiCellIsAlreadyShow = true
                return cell!
            }else {
                return cell!
            }
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsperRow = 2
        let spacingbetweencells = 10
        
        debugPrint("Sepated Item ", separetedArray[indexPath.row])
        
        if separetedArray[indexPath.row] == 8 {
            
//            let width = (Int(collection.bounds.width) - totalSpacing)/numberOfItemsperRow
            return CGSize(width: Int(collectionview.bounds.width - 20), height: 150)
            
        }else {
            let totalSpacing = (2 * Int(self.spacing)) + ((numberOfItemsperRow - 1) * spacingbetweencells)
            
            if let collection = self.collectionview{
                let width = (Int(collection.bounds.width) - totalSpacing )/numberOfItemsperRow
                return CGSize(width: width , height: width)
            }else{
                return CGSize(width: 0, height: 0)
            }
        }
        
    }
}

