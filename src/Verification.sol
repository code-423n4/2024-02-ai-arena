// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";


library Verification {
    using ECDSA for bytes32;

    function verify(
        address signer, 
        bytes32 messageHash, 
        bytes memory signature
    ) 
        public 
        pure 
        returns (bool) 
    {
        // Since the message is already a hash, directly prepare it for signature verification
        bytes32 ethSignedMessageHash = messageHash.toEthSignedMessageHash();

        // Recover the signer's address from the signature
        address recoveredSigner = ethSignedMessageHash.recover(signature);

        // Check if the recovered address is the same as the expected signer
        return recoveredSigner == signer;
    }
}