import SwiftUI
import LocalAuthentication

class WalletViewModel: ObservableObject {
    @Published var balance: Double = 2.5
    @Published var isUnlocked = false
    @Published var showAlert = false
    @Published var alertMsg = ""

    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate to approve this transaction"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                        self.balance -= 0.1
                        self.alertMsg = "Transaction Approved! ✅"
                    } else {
                        self.alertMsg = "Authentication Failed ❌"
                    }
                    self.showAlert = true
                }
            }
        } else {
            DispatchQueue.main.async {
                self.alertMsg = "FaceID not available"
                self.showAlert = true
            }
        }
    }
}

struct ContentView: View {
    @StateObject private var viewModel = WalletViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Crypto Wallet")
                    .font(.largeTitle)
                    .bold()

                Text("💵 Balance: \(String(format: "%.2f", viewModel.balance)) ETH")
                    .font(.title2)

                Button(action: {
                    viewModel.authenticate()
                }) {
                    Text("Send 0.1 ETH")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
            .navigationBarTitle("Wallet", displayMode: .inline)
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text(viewModel.alertMsg))
            }
        }
    }
}

@main
struct CryptoWalletApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}