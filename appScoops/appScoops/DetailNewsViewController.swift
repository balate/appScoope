//
//  DetailNewsViewController.swift
//  appScoops
//
//  Created by Javier Contreras on 30/10/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

import UIKit

class DetailNewsViewController: UIViewController {

    var model: AutoRecord?
    var client: MSClient?
    
    @IBOutlet weak var authorLbl: UILabel!{
    
        didSet{
        
            guard let autor = model?["author"] as! String?
                else{
                    
                    return
                }
                authorLbl.text = autor

            
        }
        
    }
    
    
    @IBOutlet weak var titleLbl: UILabel!{
        didSet{
            
            titleLbl.text = model?["title"] as! String?
        }
        
    
    }
    
    @IBOutlet weak var detailNewsTxt: UITextField!{
        didSet{
            
            guard let details = model?["detailsNews"] as! String? else{
            
                return
            }
            detailNewsTxt.text = details
        }
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateDetailsNews(_ sender: AnyObject) {
        
        updateNews()
    }

    //MARK: - Funtion Update News
    //function Update News
    func updateNews() {
        //create reference table
        let tableAz = client?.table(withName: "News")
        
        //check data
        model!["author"] = authorLbl.text as AnyObject?
        model!["title"] = authorLbl.text as AnyObject?
        
        model!["detailsNews"] = detailNewsTxt.text as AnyObject?
        
        //update data
        tableAz?.update(model!, completion: {(result, error) in
        
            if let _ = error {
            
                print(error)
                return
            }
            print(result)
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
