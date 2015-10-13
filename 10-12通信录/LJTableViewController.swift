//
//  LJTableViewController.swift
//  10-12通信录
//
//  Created by 李进 on 15/10/12.
//  Copyright © 2015年 李进. All rights reserved.
//

import UIKit

class LJTableViewController: UITableViewController {
    
    private var persons: [person]?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        loaddata { (array) -> () in
            print("\(array)")
            
            self.persons = array
            print(array[0].name ?? 0)
            self.tableView.reloadData()
        }
        
    }



    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.persons?.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! LJTableViewCell

        cell.personA = self.persons![indexPath.row]

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
       guard let vc = segue.destinationViewController as? ViewController else{
            return
        }
        //获取点击当前cell的indexpath
        guard let indexpath = tableView.indexPathForSelectedRow else{
            return
        }
        
        vc.personB = persons![indexpath.row]
        
        vc.didsavedata = self.tableView.reloadData
        
    }


}

extension LJTableViewController{
    //加载数据，声明一个方法，要养成习惯加上私有标志，在需要暴露的时候在将私有标志去除
    private func loaddata (conn: (array: [person]) -> ()){
        //模拟数据的下载
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            print("加载数据")
            
            //创建数组
            var datalist = [person]()
            //循环生成数据
            for i in 0..<50{
                
                let name = "张三\(i)"
                
                let age = random()%20 + 10
                
                let dic: [String: AnyObject] = ["name":name, "age":age]
                
                //字典转模型
                datalist.append(person(dist: dic))
            }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                print("回调数据")
                conn(array: datalist)
            })
        }
    }
}
