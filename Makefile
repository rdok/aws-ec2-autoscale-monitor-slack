deploy: samconfig.toml
	sam deploy --stack-name monitor-memory-disk-cpu-utilization --capabilities CAPABILITY_NAMED_IAM

samconfig.toml:
	cp samconfig.toml.example samconfig.toml
