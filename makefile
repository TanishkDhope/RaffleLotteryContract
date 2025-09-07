-include .env
deploy:
	forge script script/DeployRaffle.s.sol --rpc-url $(RPC_URL) --private-key $(PRIVATE_KEY) --braodcast

deploySepolia:
	forge script script/DeployRaffle.s.sol --rpc-url $(SEPOLIA_URL) --private-key $(SEPOLIA_PRIVATE_KEY) --braodcast

