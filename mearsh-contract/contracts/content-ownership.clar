;; Content Ownership Contract
;; Manages ownership of digital content represented as NFTs

;; Define the NFT trait inline
(define-trait nft-trait
  (
    (get-last-token-id () (response uint uint))
    (get-token-uri (uint) (response (optional (string-ascii 256)) uint))
    (get-owner (uint) (response (optional principal) uint))
    (transfer (uint principal principal) (response bool uint))
  )
)

;; Define the NFT
(define-non-fungible-token content-nft uint)

;; Storage for content metadata
(define-map content-metadata uint {
  title: (string-ascii 100),
  description: (string-ascii 500),
  content-type: (string-ascii 50),
  creator: principal,
  content-url: (string-ascii 256),
  created-at: uint,
  royalty-percentage: uint
})

;; Storage for content creators (for royalty tracking)
(define-map content-creators uint principal)

;; Contract variables
(define-data-var last-token-id uint u0)
(define-data-var contract-owner principal tx-sender)
(define-data-var minting-enabled bool true)
(define-data-var base-uri (string-ascii 256) "https://api.content-nft.com/metadata/")

;; Constants
(define-constant ERR-NOT-AUTHORIZED (err u401))
(define-constant ERR-NOT-FOUND (err u404))
(define-constant ERR-ALREADY-EXISTS (err u409))
(define-constant ERR-INVALID-INPUT (err u400))
(define-constant ERR-MINTING-DISABLED (err u403))
(define-constant ERR-INVALID-ROYALTY (err u402))

;; Content type constants
(define-constant CONTENT-TYPE-IMAGE "image")
(define-constant CONTENT-TYPE-VIDEO "video")
(define-constant CONTENT-TYPE-AUDIO "audio")
(define-constant CONTENT-TYPE-TEXT "text")
(define-constant CONTENT-TYPE-DOCUMENT "document")
(define-constant CONTENT-TYPE-OTHER "other")

;; Private helper functions
(define-private (is-valid-content-type (content-type (string-ascii 50)))
  (or 
    (is-eq content-type CONTENT-TYPE-IMAGE)
    (is-eq content-type CONTENT-TYPE-VIDEO)
    (is-eq content-type CONTENT-TYPE-AUDIO)
    (is-eq content-type CONTENT-TYPE-TEXT)
    (is-eq content-type CONTENT-TYPE-DOCUMENT)
    (is-eq content-type CONTENT-TYPE-OTHER)
  )
)

(define-private (is-contract-owner)
  (is-eq tx-sender (var-get contract-owner))
)

;; Core NFT functions (SIP-009 compliance)
(define-read-only (get-last-token-id)
  (ok (var-get last-token-id))
)

(define-read-only (get-token-uri (token-id uint))
  (if (is-some (nft-get-owner? content-nft token-id))
    (ok (some (concat (var-get base-uri) (uint-to-ascii token-id))))
    (ok none)
  )
)

(define-read-only (get-owner (token-id uint))
  (ok (nft-get-owner? content-nft token-id))
)

(define-public (transfer (token-id uint) (sender principal) (recipient principal))
  (begin
    (asserts! (is-eq tx-sender sender) ERR-NOT-AUTHORIZED)
    (asserts! (is-some (nft-get-owner? content-nft token-id)) ERR-NOT-FOUND)
    (nft-transfer? content-nft token-id sender recipient)
  )
)

;; Content-specific functions
(define-public (mint-content 
  (title (string-ascii 100))
  (description (string-ascii 500))
  (content-type (string-ascii 50))
  (content-url (string-ascii 256))
  (royalty-percentage uint)
  (recipient principal)
)
  (let 
    (
      (new-token-id (+ (var-get last-token-id) u1))
    )
    (asserts! (var-get minting-enabled) ERR-MINTING-DISABLED)
    (asserts! (> (len title) u0) ERR-INVALID-INPUT)
    (asserts! (> (len description) u0) ERR-INVALID-INPUT)
    (asserts! (> (len content-url) u0) ERR-INVALID-INPUT)
    (asserts! (is-valid-content-type content-type) ERR-INVALID-INPUT)
    (asserts! (<= royalty-percentage u5000) ERR-INVALID-ROYALTY) ;; Max 50% royalty
    
    ;; Mint the NFT
    (try! (nft-mint? content-nft new-token-id recipient))
    
    ;; Store metadata
    (map-set content-metadata new-token-id {
      title: title,
      description: description,
      content-type: content-type,
      creator: tx-sender,
      content-url: content-url,
      created-at: block-height,
      royalty-percentage: royalty-percentage
    })
    
    ;; Store creator mapping
    (map-set content-creators new-token-id tx-sender)
    
    ;; Update last token ID
    (var-set last-token-id new-token-id)
    
    (ok new-token-id)
  )
)

(define-public (transfer-content (token-id uint) (recipient principal))
  (let 
    (
      (current-owner (unwrap! (nft-get-owner? content-nft token-id) ERR-NOT-FOUND))
    )
    (asserts! (is-eq tx-sender current-owner) ERR-NOT-AUTHORIZED)
    (try! (nft-transfer? content-nft token-id current-owner recipient))
    (ok true)
  )
)

;; Read-only functions
(define-read-only (get-content-owner (token-id uint))
  (nft-get-owner? content-nft token-id)
)

(define-read-only (get-content-metadata (token-id uint))
  (map-get? content-metadata token-id)
)

(define-read-only (get-content-creator (token-id uint))
  (map-get? content-creators token-id)
)

;; Removed problematic filter functions and replaced with simpler count-based approach
(define-read-only (get-content-count-by-creator (creator principal))
  (let 
    (
      (max-id (var-get last-token-id))
    )
    (fold count-creator-content 
      (list u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19 u20
            u21 u22 u23 u24 u25 u26 u27 u28 u29 u30 u31 u32 u33 u34 u35 u36 u37 u38 u39 u40
            u41 u42 u43 u44 u45 u46 u47 u48 u49 u50 u51 u52 u53 u54 u55 u56 u57 u58 u59 u60
            u61 u62 u63 u64 u65 u66 u67 u68 u69 u70 u71 u72 u73 u74 u75 u76 u77 u78 u79 u80
            u81 u82 u83 u84 u85 u86 u87 u88 u89 u90 u91 u92 u93 u94 u95 u96 u97 u98 u99 u100)
      { creator: creator, count: u0 }
    )
  )
)

(define-private (count-creator-content (token-id uint) (data { creator: principal, count: uint }))
  (let 
    (
      (creator (get creator data))
      (current-count (get count data))
    )
    (match (map-get? content-creators token-id)
      token-creator 
        (if (is-eq token-creator creator)
          { creator: creator, count: (+ current-count u1) }
          data
        )
      data
    )
  )
)

;; Simplified content type checking function
(define-read-only (get-content-count-by-type (content-type (string-ascii 50)))
  (let 
    (
      (max-id (var-get last-token-id))
    )
    (fold count-content-type 
      (list u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19 u20
            u21 u22 u23 u24 u25 u26 u27 u28 u29 u30 u31 u32 u33 u34 u35 u36 u37 u38 u39 u40
            u41 u42 u43 u44 u45 u46 u47 u48 u49 u50 u51 u52 u53 u54 u55 u56 u57 u58 u59 u60
            u61 u62 u63 u64 u65 u66 u67 u68 u69 u70 u71 u72 u73 u74 u75 u76 u77 u78 u79 u80
            u81 u82 u83 u84 u85 u86 u87 u88 u89 u90 u91 u92 u93 u94 u95 u96 u97 u98 u99 u100)
      { target-type: content-type, count: u0 }
    )
  )
)

(define-private (count-content-type (token-id uint) (data { target-type: (string-ascii 50), count: uint }))
  (let 
    (
      (target-type (get target-type data))
      (current-count (get count data))
    )
    (match (map-get? content-metadata token-id)
      metadata 
        (if (is-eq (get content-type metadata) target-type)
          { target-type: target-type, count: (+ current-count u1) }
          data
        )
      data
    )
  )
)

;; Admin functions
(define-public (set-base-uri (new-base-uri (string-ascii 256)))
  (begin
    (asserts! (is-contract-owner) ERR-NOT-AUTHORIZED)
    (var-set base-uri new-base-uri)
    (ok true)
  )
)

(define-public (toggle-minting)
  (begin
    (asserts! (is-contract-owner) ERR-NOT-AUTHORIZED)
    (var-set minting-enabled (not (var-get minting-enabled)))
    (ok (var-get minting-enabled))
  )
)

(define-public (set-contract-owner (new-owner principal))
  (begin
    (asserts! (is-contract-owner) ERR-NOT-AUTHORIZED)
    (var-set contract-owner new-owner)
    (ok true)
  )
)

;; Burn function
(define-public (burn-content (token-id uint))
  (let 
    (
      (current-owner (unwrap! (nft-get-owner? content-nft token-id) ERR-NOT-FOUND))
    )
    (asserts! (is-eq tx-sender current-owner) ERR-NOT-AUTHORIZED)
    (try! (nft-burn? content-nft token-id current-owner))
    (map-delete content-metadata token-id)
    (map-delete content-creators token-id)
    (ok true)
  )
)

;; Helper function to convert uint to string (simplified version)
(define-private (uint-to-ascii (value uint))
  (if (<= value u9)
    (unwrap-panic (element-at "0123456789" value))
    "0" ;; Simplified - in production, you'd want full uint-to-string conversion
  )
)

;; Read-only function to get total supply
(define-read-only (get-total-supply)
  (var-get last-token-id)
)

;; Royalty functions
(define-read-only (get-royalty-info (token-id uint) (sale-price uint))
  (match (map-get? content-metadata token-id)
    metadata 
      (let 
        (
          (royalty-amount (/ (* sale-price (get royalty-percentage metadata)) u10000))
          (creator (get creator metadata))
        )
        (some { recipient: creator, amount: royalty-amount })
      )
    none
  )
)
