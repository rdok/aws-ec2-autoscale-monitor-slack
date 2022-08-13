deploy: samconfig.toml
	sam deploy --stack-name monitor-ec2-memory-and-disk-usage --capabilities CAPABILITY_NAMED_IAM

samconfig.toml:
	cp samconfig.toml.example samconfig.toml
