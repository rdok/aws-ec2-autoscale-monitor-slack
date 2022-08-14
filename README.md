# Monitor memory and disk usage
Showcase monitoring memory and disk usage by install CloudWatch agent through CloudFormation on an EC2.

![metrics](./metrics.png "Stress Results")

## Stress Test
```sh
sudo amazon-linux-extras install -y epel
sudo yum install -y stress htop

# CPU, memory, and disk stress.
 sudo stress --cpu 1 --vm-bytes $(awk '/MemAvailable/{printf "%d\n", $2 * 0.9;}' < /proc/meminfo)k --vm-keep -m 5
```

### Notes
- `stress-ng` memory test, although worked fine locally, it was not picked by CloudWatch logs. Instead use `stress` one. 

## Development
- `make samconfig.toml` && customise as per you needs
- `make deploy`

## Sources

[Install CloudWatch Agent](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html)  
[Metrics collected by the CloudWatch agent on Linux instances](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/metrics-collected-by-CloudWatch-agent.html#linux-metrics-enabled-by-CloudWatch-agent)  
[Inline CloudFormation Template](https://github.com/awslabs/aws-cloudformation-templates/blob/master/aws/solutions/AmazonCloudWatchAgent/inline/amazon_linux.template)
