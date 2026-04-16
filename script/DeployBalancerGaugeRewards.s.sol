// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";

import {BalancerGaugeRewards} from "../src/BalancerGaugeRewards.sol";

contract DeployBalancerGaugeScript is Script {
    // BalancerGaugeRewards Constants
    address private constant GOVERNANCE = address(0x807DEf5E7d057DF05C796F4bc75C3Fe82Bd6EeE1);
    address private constant GAUGE = address(0xa0d1ACAD5E5174d280716E9868ac6a4945120DDD); // Gauge for 0xc334299aef610fc79da129a920317b2bdbe2557e
    address private constant BOLD = address(0x6440f144b7e50D6a8439336510312d2F54beB01D);
    address private constant BRIBE = address(0xc334299aEf610Fc79da129A920317B2BDBe2557E); // Pool's BPT

    // Deployer
    address private deployer;
    uint256 private privateKey;

    function setUp() public {
        privateKey = vm.envUint("PRIVATE_KEY");
        deployer = vm.createWallet(privateKey).addr;
    }

    function run() public {
        vm.startBroadcast(privateKey);
        new BalancerGaugeRewards(
            GOVERNANCE,
            address(BOLD),
            address(BRIBE),
            address(GAUGE)
        );
        vm.stopBroadcast();
    }
}
