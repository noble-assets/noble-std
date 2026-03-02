# Noble Standard Library

Noble Standard Library is a collection of helpful Noble specific contracts and libraries for use with [Foundry](https://github.com/foundry-rs/foundry).

## Installation

Using [Forge](https://getfoundry.sh/forge/overview):

```command
forge install noble-assets/noble-std
```

Using [Soldeer](https://soldeer.xyz):

```command
soldeer install noble-std
```

## Contracts

<pre>
src
├── <a href="./src/ConsensusInfo.sol">ConsensusInfo.sol</a>: A library for interacting with Noble's ConsensusInfo system contract.
├── <a href="./src/Constants.sol">Constants.sol</a>: Noble specific constants (system address, contract addresses).
└── interfaces
    ├── <a href="./src/interfaces/IRegistrar.sol">IRegistrar.sol</a>: Interface for the Registrar contract.
    └── <a href="./src/interfaces/IValidatorManager.sol">IValidatorManager.sol</a>: Interface for the Validator Manager contract.
</pre>

## Support

The current minimum supported Solidity version is `0.8.13`.

## License

Noble Standard Library is offered under either [MIT](./LICENSE-MIT) or [Apache 2.0](./LICENSE-APACHE) license.
