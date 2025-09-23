# Mearsh

Welcome to **Mearsh**, a decentralized content-sharing platform that empowers creators to retain ownership of their intellectual property (IP) while sharing and monetizing their digital content. Built on **Stacks blockchain** with **Clarity smart contracts**, Mearsh provides a trustless environment where creators have full control over their content and are fairly compensated for their work. Whether you're a writer, artist, musician, or any other kind of digital creator, Mearsh ensures that you can share your content, retain ownership, and get paid for every interaction with your work.

This README outlines the features of Mearsh, the smart contracts powering the platform, and instructions for installing, deploying, and using the platform.

---

## Table of Contents

1. [Overview](#overview)
2. [Key Features](#key-features)
3. [Smart Contracts](#smart-contracts)

   * [Content Ownership Contract](#1-content-ownership-contract)
   * [Marketplace Listing Contract](#2-marketplace-listing-contract)
   * [Content License Contract](#3-content-license-contract)
   * [Royalty Management Contract](#4-royalty-management-contract)
   * [Content Monetization Contract](#5-content-monetization-contract)
   * [User Profile Contract](#6-user-profile-contract)
   * [Admin/Governance Contract](#7-admin-governance-contract)
   * [Fee Collection Contract](#8-fee-collection-contract)
4. [Installation](#installation)
5. [Deployment](#deployment)
6. [Usage](#usage)
7. [Contributing](#contributing)
8. [License](#license)

---

## Overview

**Mearsh** is a decentralized platform for content creators to upload, share, license, and monetize their digital content. The platform uses **NFTs** (Non-Fungible Tokens) to represent ownership of digital content and **Clarity smart contracts** on the **Stacks blockchain** to manage licensing, royalties, content ownership, and transactions. Mearsh enables creators to keep full control over their intellectual property while ensuring that they are compensated whenever their content is used or sold.

---

## Key Features

1. **Content Ownership**: Every piece of content uploaded to Mearsh is represented by an NFT, allowing creators to maintain full ownership of their work.
2. **Monetization**: Creators can monetize their content by setting licensing fees or charging for access (pay-per-view or subscription models).
3. **Royalty Distribution**: Creators earn royalties every time their content is used, licensed, or resold.
4. **Content Licensing**: Creators can define the terms under which their content can be used or licensed, including restrictions on commercial use or redistribution.
5. **Content Marketplace**: Users can buy, sell, or license digital content on the marketplace, with creators receiving fair compensation for every interaction.
6. **Transparent Transactions**: Every transaction is recorded on the blockchain, ensuring transparency and eliminating the need for intermediaries.
7. **User Profiles**: Users can create profiles to showcase their content and track earnings, transactions, and other activities.
8. **Governance**: Platform-wide decisions can be made through decentralized governance, allowing the community to vote on key changes (e.g., fee structures, policies).
9. **Secure Payments**: Payments for content licensing, purchases, and royalties are handled via smart contracts, ensuring secure and trustless transactions.

---

## Smart Contracts

The **Clarity smart contracts** used in Mearsh are designed to handle content ownership, licensing, royalties, user profiles, and governance. Below is a list of the key smart contracts and their functionalities:

### 1. **Content Ownership Contract**

**Purpose**: Manages the ownership of digital content, represented as NFTs.

**Key Functions**:

* `mint-content`: Mints an NFT representing a piece of content and assigns it to the creator.
* `transfer-content`: Transfers ownership of the content NFT from one user to another (e.g., in case of a sale).
* `get-content-owner`: Retrieves the owner of a specific content NFT.
* `get-content-metadata`: Retrieves metadata (e.g., title, description, content type, creator) for a content NFT.

---

### 2. **Marketplace Listing Contract**

**Purpose**: Allows creators to list their content for sale or licensing on the marketplace.

**Key Functions**:

* `list-content`: Lists a content NFT for sale or licensing at a specified price.
* `update-listing`: Updates the sale or licensing terms for a listed content item (e.g., price, terms).
* `delist-content`: Removes a content NFT from the marketplace.
* `get-listing`: Retrieves the details of a content NFT listing (e.g., price, status, owner).

---

### 3. **Content License Contract**

**Purpose**: Manages the licensing terms for content, allowing creators to set specific conditions under which their content can be used.

**Key Functions**:

* `set-license`: Defines the licensing terms for a content NFT (e.g., commercial use, redistribution, time-limited access).
* `get-license`: Retrieves the license associated with a content NFT.
* `transfer-license`: Allows users to transfer licenses to other users (if permitted).
* `check-license`: Verifies if a user has the right to use or modify the content based on the license terms.

---

### 4. **Royalty Management Contract**

**Purpose**: Ensures that creators receive royalties every time their content is sold, licensed, or resold.

**Key Functions**:

* `set-royalty`: Allows creators to set a royalty percentage on their content NFT, which will be paid on resales and licenses.
* `pay-royalty`: Automatically pays the royalty to the creator when their content is used or resold.
* `get-royalty`: Retrieves the royalty percentage for a specific content NFT.

---

### 5. **Content Monetization Contract**

**Purpose**: Handles the payment and monetization process when content is sold, licensed, or accessed.

**Key Functions**:

* `buy-content`: Facilitates the purchase of content from the marketplace.
* `pay-for-access`: Allows users to pay for access to premium content (e.g., pay-per-view).
* `set-access-price`: Allows creators to set an access price for their content (e.g., subscription or pay-per-view model).
* `get-access-price`: Retrieves the access price set by the creator for a piece of content.

---

### 6. **User Profile Contract**

**Purpose**: Manages user profiles and tracks content ownership, earnings, and transactions.

**Key Functions**:

* `create-profile`: Creates a user profile on the platform.
* `update-profile`: Updates a user's profile information (e.g., name, bio, social links).
* `get-profile`: Retrieves a user's profile and transaction history, including content ownership and earnings.

---

### 7. **Admin/Governance Contract**

**Purpose**: Enables platform-wide governance and administrative control over platform policies.

**Key Functions**:

* `set-fee`: Allows administrators to set platform transaction fees for content sales, licenses, and other activities.
* `update-policies`: Allows admins to modify platform rules or policies, such as content guidelines or fee structures.
* `admin-override`: Provides platform administrators with the ability to intervene in disputes or address technical issues.

---

### 8. **Fee Collection Contract**

**Purpose**: Manages the collection of platform fees from transactions on the marketplace.

**Key Functions**:

* `collect-fee`: Collects a fee from users when they buy, sell, or license content on the platform.
* `set-fee-percentage`: Defines the percentage of each transaction that is collected as a platform fee.
* `distribute-fee`: Distributes collected fees to the platform's treasury or designated account.

---

## Installation

To deploy and interact with **Mearsh**, you'll need the following tools:

### Prerequisites:

1. **Stacks CLI**: For deploying and managing Clarity smart contracts on the Stacks blockchain.
2. **Clarity Language**: For writing the smart contracts that power the platform.
3. **Node.js and NPM**: For managing backend scripts and dependencies.
4. **Stacks Testnet**: For testing the smart contracts before deployment to the mainnet.

### Steps:

1. **Install Stacks CLI**:

   ```bash
   curl -fsSL https://stacks.co/install.sh | bash
   ```

2. **Install Node.js and NPM**:

   ```bash
   sudo apt install nodejs
   sudo apt install npm
   ```

---

## Deployment

### Deploying Smart Contracts

1. Write the **Clarity smart contracts** for each feature (e.g., content ownership, royalties, marketplace).
2. Use the **Stacks CLI** to deploy the contracts to **Stacks Testnet** or **Mainnet**.

   ```bash
   stacks deploy contract <contract-file> --network testnet
   ```

### Deploying the Frontend

1. Build the frontend of **Mearsh** using a framework like **React** or **Vue.js**.
2. Deploy the frontend using **Netlify**, **Vercel**, or another deployment platform of your choice.

---

## Usage

Once deployed, users can interact with **Mearsh** via the frontend to:

* **Create a Profile**: Sign up and create a profile to track content ownership and earnings.
* **Upload Content**: Mint content NFTs and define licensing terms.
* **Sell or License Content**: List your content on the marketplace for sale or licensing, with transparent and secure payment mechanisms.
* **Track Earnings**: View transaction history and royalties in your user profile.
* **Participate in Content Monetization**: Purchase access to exclusive content or license content for personal or commercial use.
* \*\*Governance Participation


\*\*: If you hold governance tokens, vote on important platform decisions (optional).

---

## Contributing

We welcome contributions to **Mearsh**! To get started:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/your-feature`).
3. Make your changes.
4. Commit your changes (`git commit -am 'Add new feature'`).
5. Push to the branch (`git push origin feature/your-feature`).
6. Create a new Pull Request.

Please ensure your contributions follow the code style and conventions used in the project.

---

## License

**Mearsh** is released under the [MIT License](LICENSE).

---

Thank you for using **Mearsh** — the platform where **creators** truly own their work and get paid for it!
