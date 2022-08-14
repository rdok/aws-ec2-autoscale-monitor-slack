# Monitor memory, disk, and CPU usage
> Monitor EC2 memory, disk, and CPU usage using CloudWatch agent through CloudFormation. Create dashboard with the metrics, and alert through slack when any alarm goes in alert status.

![dashboard](./dashboard.png "Dashboard")

## Stress Test
```sh
sudo amazon-linux-extras install -y epel
sudo yum install -y stress htop

# CPU, and memory stress. t3.medium 2 CPU, 4GB memory
 sudo stress --cpu 2 --vm-bytes $(awk '/MemAvailable/{printf "%d\n", $2 * 0.9;}' < /proc/meminfo)k --vm-keep -m 5
 
 # Disk usage. 8GB disk
df -h
dd if=/dev/urandom of=2GB.bin bs=64M count=32 iflag=fullblock
dd if=/dev/urandom of=3GB.bin bs=64M count=48 iflag=fullblock
df -h
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

## TODO
Automate dashboard containing the alarms created for CPU, Memory, and Disk usage.
