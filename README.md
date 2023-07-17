# EZKL + Cairo + Nethermind Warp Test

Test setting up EZKL with Cairo and Starknet with Warp.


## Setup
1. [Install starknet](https://docs.starknet.io/documentation/getting_started/environment_setup/)

2. [Install nethermind warp](https://nethermindeth.github.io/warp/docs/getting_started/a-usage-and-installation/). Alternatively, run `yarn install`.

3. Install nethermind solc

4. Transpile the contract by running
```bash
./node_modules/@nethermindeth/warp/bin/warp transpile Verifier.sol

# OR
warp transpile Verifier.sol
```

5. It fails! As v0.8.17 solidity is unsupported. See logs1

5. Naively setting to v0.8.14 on the Verifier.sol also fails because ezkl is using fancy yul instructions. More errors in logs2