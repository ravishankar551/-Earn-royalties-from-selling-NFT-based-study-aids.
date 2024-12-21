# Earn Royalties from Selling NFT-based Study Aids

## Project Description
The StudyAidNFT smart contract allows creators to mint and sell educational content as NFTs. It ensures creators earn royalties from secondary sales, fostering a sustainable revenue model for educational materials.

## Contract Address
0xA419E3b714c3162f968889aC5FDBe7737E42B12c

## Project Vision
To empower educators and content creators by providing a platform to monetize educational materials securely and transparently, leveraging the power of blockchain technology.

## Key Features

### 1. **NFT Minting**
   - Allows creators to mint NFTs representing study aids with unique metadata (e.g., token URI).

### 2. **Royalty System**
   - Automatically pays a predefined percentage of every secondary sale as royalties to the creator.

### 3. **Simple Ownership Transfer**
   - Enables secure transfer of NFT ownership between users, ensuring proper handling of royalties.

### 4. **Creator Protection**
   - Immutable records on the blockchain prevent unauthorized duplication or misuse of study aids.

### 5. **Efficient Design**
   - Built without external dependencies, providing a streamlined, gas-efficient contract structure.

## How It Works
1. Creators mint NFTs with unique identifiers (token URIs) using the `mintNFT` function.
2. Buyers purchase NFTs and can transfer ownership using the `transferNFT` function.
3. The smart contract calculates and distributes royalties automatically during transfers.

---

### Deployment Notes
- Deployable on Ethereum or Ethereum-compatible blockchains.
- Requires the royalty percentage and recipient address during initialization.

### Future Enhancements
- Integration with a front-end application for user-friendly NFT minting and trading.
- Support for additional blockchains with lower gas fees.
