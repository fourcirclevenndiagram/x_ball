import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Main Screen")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: BouncingBallsViewContainer()) {
                    Text("Go to Bouncing Balls")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct BouncingBallsViewContainer: View {
    var body: some View {
        BouncingBallsView()
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Bouncing Balls")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
