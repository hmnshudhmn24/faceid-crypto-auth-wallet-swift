# 💰 Swift Crypto Wallet with FaceID

An iOS Swift app that simulates a secure crypto wallet interface where users can manage their token balances and authorize transactions using FaceID. 🧠🔐

This project demonstrates mobile finance app security best practices — combining biometric FaceID authentication, local secure storage, and sleek SwiftUI design. Designed as a foundation for real-world crypto apps.

## 🚀 How to Run

1. Open Xcode 15 or higher on macOS
2. Clone this repo and open `CryptoWalletApp.xcodeproj`
3. Ensure your project target is iOS 15.0+ and device supports FaceID
4. Run on a real device (FaceID doesn't work on simulator)
5. Tap on **Transfer** and authenticate to simulate a signed transaction

## ✨ Features

- Manage token balances (mock)
- Biometric-secured transaction signing using FaceID 😎
- Secure local data using `Keychain`
- Reusable FaceID utility module
- Minimal SwiftUI interface optimized for clarity
- Dark mode support 🌑

## 📦 Tech Stack

- Swift 5.9
- SwiftUI
- LocalAuthentication
- Combine
- KeychainAccess (optional)

## 💡 Project Highlights

- All transactions require biometric approval
- Illustrates wallet balance view and transfer modal
- Designed to be extended to real blockchain interactions using APIs or SDKs

## 📲 Future Enhancements

- QR-based wallet address scanning
- Real token price API (CoinGecko)
- Backup & restore using iCloud keychain