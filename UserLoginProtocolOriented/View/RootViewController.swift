//
//  ViewController.swift
//  UserLoginProtocolOriented
//
//  Created by Atil Samancioglu on 16.09.2022.
//

import UIKit
// bu controllerda kullanıcı login olmuş mu olmamış mı onu kontrol edicez. login yoksa loginviewcontroller a gidicek varsa mainviewcontrollera gidicek. bunu bi api aracılığıyla yaparız. apiye istek atarız o bize bi token verir. o token varsa demekki kullanıcı daha önce giriş yapmış deyip başka bi ekrana yönlendirebiliyoruz. token yoksa giriş ekranına yönlendiriyoruz. bu tarz tokenları saklamanın en iyi yolu keychain kullanmaktır. hocanın github ında keychain projesi var. keychain hassas bilgileri şifrelenmiş bi şekilde sakladığımız bi sistem. token başkasıyla paylaşılmaması gereken bi bilgiyse keychainde saklamak daha mantıklı
class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .green
    }
    
    func processFlow() {
        
        if let accessToken = UserDefaults.standard.string(forKey: "ACCESS_TOKEN"), !accessToken.isEmpty { // accessToken boş değilse kullanıcı login olmuştur. UserDefaults a kayıtlı bi token varsa bu bize main i göstericek yoksa login i göstericek
            showMainApp()
        } else { // olmamıştır
            showLogin()
        }
        
    }
    
    func showMainApp() {
        let mainViewController = MainViewController()
        navigationController?.present(mainViewController, animated: true)

    }

    func showLogin() {
        let loginViewController = LoginViewController()
        navigationController?.present(loginViewController, animated: true)
    }

}

