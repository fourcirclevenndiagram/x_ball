import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        BouncingBallsView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct BouncingBallsView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        let animator = UIDynamicAnimator(referenceView: view)
        
        let blueBall = UIView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        blueBall.backgroundColor = .blue
        blueBall.layer.cornerRadius = 25
        view.addSubview(blueBall)
        
        let redBall = UIView(frame: CGRect(x: 200, y: 100, width: 50, height: 50))
        redBall.backgroundColor = .red
        redBall.layer.cornerRadius = 25
        view.addSubview(redBall)
        
        let gravity = UIGravityBehavior(items: [blueBall, redBall])
        animator.addBehavior(gravity)
        
        let collision = UICollisionBehavior(items: [blueBall, redBall])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        let dynamicBehavior = UIDynamicItemBehavior(items: [blueBall, redBall])
        dynamicBehavior.elasticity = 0.8
        animator.addBehavior(dynamicBehavior)
        
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            let randomXBlue = CGFloat.random(in: -100...100)
            let randomYBlue = CGFloat.random(in: -100...100)
            let randomXRed = CGFloat.random(in: -100...100)
            let randomYRed = CGFloat.random(in: -100...100)
            
            dynamicBehavior.addLinearVelocity(CGPoint(x: randomXBlue, y: randomYBlue), for: blueBall)
            dynamicBehavior.addLinearVelocity(CGPoint(x: randomXRed, y: randomYRed), for: redBall)
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
