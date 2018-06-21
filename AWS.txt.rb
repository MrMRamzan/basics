  Free: https://aws.amazon.com/free/
1)  "AWS COST CALCULATOR"
      https://calculator.s3.amazonaws.com/index.html

2)  "EB CLI (Elastic Beanstalk)"
      https://hackernoon.com/how-to-setup-and-deploy-a-rails-5-app-on-aws-beanstalk-with-postgresql-redis-and-more-88a38355f1ea
      https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/ruby-rails-tutorial.html
      https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/GettingStarted.html
      https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3.html
      * There is no additional charge for Elastic Beanstalk 
      * Includes
          EC2
          S3
          Elastic Load Balancer
          Auto Scaling
          Cloud Watch (Logs, Metrics)
          VPC (Virtual Private Cloud)
          Elastic IP
          Security Group
          Elastic Block Store (EBS)
          RDS needs to be integrated seprately
      * Install EB CLI
      * Configure EB CLI
      * Requirement:
          (aws-access-id): AKIAJOUAASEXAMPLE
          (aws-secret-key): 5ZRIrtTM4ciIAvd4EXAMPLEDtm+PiPSzpoK

*************************************************************************

3)  "EC2 (Elastic Compute Cloud)"
      'Free Tier': t2.micro, 750 hours per month
      "For Types & Pricing check:"
        https://www.ec2instances.info/
        "General Purpose": A1, T2, T3, T3a, M4, M5, M5a
        "Compute Optimized": C4, C5, C5a
        "Memory Optimized": R4, R5, R5a, X1, X1e, Z1d, HighMemory (u-[6|9|12]tb1.metal )
        "Accelerated Computing": P3, P2, G3, F1
        "Storage Optimized": H1, I3, D2
      Create EC2 instance
      sudo chmod 400 demo.pem

      Nginx: Nginx is a web server which listens for HTTP requests on port 80 and responds with HTML.
      Passenger: Passenger is a web application server for your Rails application. It integrates with Nginx and provides the app server layer needed to run your Rails application.
      Capistrano: Capistrano is a deployment tool that helps you get your app from Github to the EC2 instance, and to run the various commands needed to deploy the new code (compiles assets, runs migrations, etc). It maintains a release history and allows for easy rollbacks.

      "Server setup using Nginx + Passenger"
      https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/
      "Server setup using Nginx + Passenger + Capistrano"
      https://medium.com/@KerrySheldon/ec2-exercise-1-6-deploy-a-rails-app-to-an-ec2-instance-using-capistrano-3485238e4a4a
      "Server setup using Puma + Nginx + Capistrano-3"
      https://colindao.wordpress.com/2018/03/30/tu-dong-deploy-rails-app-voi-capistrano-unicorn-va-nginx/
      "Server setup using Docker + Rails + Puma + Nginx + Postgres"
      https://itnext.io/docker-rails-puma-nginx-postgres-999cd8866b18

      "Termination protection":
        On instance termination its volume also gets deleted.
        During Instance Launch: On the Add Storage page, deselect the 'Delete On Termination' check box for the root volume.
        Change Instance shutdown behavior: Select the instance ==> Actions ==> Instance Settings ==> Change Shutdown Behavior
        During Instance Launch: On the Configure Instance Details page, select the Enable termination protection check box.
        For running instance: Select the instance ==> Actions ==> Instance Settings ==> Change Termination Protection ==> Select Yes, Disable.
      "Upgrade/Downgrade instance (change instance type)": Stop instance ==> Actions ==> Instance Setting => Change Instance Type
      "Elastic IP": AWS ==> navigate to Elastic IP ==> create ==> assign to an instance.

*************************************************************************

4)  "Cloud Watch"
      Amazon CloudWatch monitors your Amazon Web Services (AWS) resources and the applications you run on AWS in real time
      'Services':
        Amazon Simple Notification Service (Amazon SNS)
        Amazon EC2 Auto Scaling
        AWS CloudTrail
        AWS Identity and Access Management (IAM)

*************************************************************************

5)  "Schedule Automated Amazon EBS Snapshots Using CloudWatch Events"
      'Create Rule':
        Open CloudWatch ==> Events
                             ╚ Create rule
                                ╠ Event Source ==> Schedule(Cron expression)
                                ╠ Targets ==>  Add target ==> select EC2 CreateSnapshot API call
                                ║              ╚ Enter the volume-ID
                                ╠ Create a new role for this specific resource. 
                                ╠ Configure details.
                                ╠ Rule definition: name & descriptions
                                ╚ Create rule

*************************************************************************

6)  "Install AWS CLI (with python 3, pip3)"
        pip3 --version
          # => pip 1.5.4 from /usr/lib/python3/dist-packages (python 3.4)
        export PATH=~/.local/bin:~/Library/Python/3.4/bin:$PATH 
        pip3 install awscli --upgrade
        aws --version
          # => aws-cli/1.16.22 Python/3.6.5 Darwin/18.2.0 botocore/1.12.12
      sudo aws configure (enter configurations)
          AWS Key: ... 
          Secret AWS Key: ...
          Region: ...
          Output Format: json

*************************************************************************

7)  "S3 (Simple Storage Service)"
      'Free Tier': 5GB of Amazon S3 storage in the S3 Standard storage class, 20,000 GET Requests, 2,000 PUT Requests, and 15GB of Data Transfer Out each month for one year
      "Requirement"
          AWS_ACCESS_KEY (each bucket has it own key)
          AWS_SECRET_ACCESS_KEY
      "Limit":
          Default max 100 buckets
          Volume of data & number of objects ==> unlimited
          single object size  ==> 0 bytes ... 5 terabytes
          Largest object that can be uploaded in a single PUT is 5 gigabytes
      "Create":
          gem 'aws-sdk-s3', '~> 1'
            "OR"
          require 'aws-sdk-s3'
          Aws.config[:credentials] = Aws::Credentials.new(AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
          Aws.config.update({ region: 'us-west-2', credentials: Aws::Credentials.new(AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY) })
          s3 = Aws::S3::Client.new(region: 'us-west-2', access_key_id: AWS_ACCESS_KEY_ID, secret_access_key: AWS_SECRET_ACCESS_KEY)
          s3 = Aws::S3::Resource.new(region: 'us-west-2', access_key_id: AWS_ACCESS_KEY_ID, secret_access_key: AWS_SECRET_ACCESS_KEY)
             ==> if already config then use s3 = Aws::S3::Client.new() "**OR**" Aws::S3::Resource.new()
          s3.create_bucket(bucket: 'bucket-name')
              "OR"
          "From Web":
            bucket-name
            region
            permissions: public
                Mark all false in 'Manage public access control lists (ACLs)' && 'Manage public bucket policies'
              "OR"
          "Using buck policy":
            {
              "Version": "2008-10-17",
              "Statement": [{
                "Sid": "AllowPublicRead",
                "Effect": "Allow",
                "Principal": { "AWS": "*" },
                "Action": ["s3:GetObject"],
                "Resource":"arn:aws:s3:::*" # => to all buckets
                    "OR"
                "Resource":"arn:aws:s3:::examplebucket/*" # => to specific bucket
                    "OR"
                "Resource":"arn:aws:s3:::examplebucket/Alice/*" # => to specific folder in bucket
              }]
            }
      "Upload content"
          s3.put_object(bucket: bucket, key: "file1", body: "My first s3 object")
          # copy content from one bucket to another
          s3.copy_object(bucket: bucket, copy_source: "#{my_bucket}/test_file", key: 'file2')
          # check the file exists
          resp = s3.list_objects_v2(bucket: bucket)
          resp.contents.map { |obj| puts obj.key }
          # delete files
          s3.delete_objects( bucket: bucket, delete: {
            objects: [ { key: 'file1' }, { key: 'file2' } ]
          })
          # delete folder and everthing in it.
          objects = s3.bucket(bucket).objects({prefix: "folder/sub_folder/"}).batch_delete!
      "Versioning OR Backup/Syncing":
          "To turn on versioning"
              Click on bucket name
              Choose Properties tab
              Choose Enable versioning or Suspend versioning, and then choose Save.
          "To see vesrions of file":
              Click on bucket name
              Click on "Versions: Hide|Show" shown above bucket content
          "To backup or sync bucket to another bucket"
            Check point (6) for AWS CLI
            aws s3 sync s3://bucket-name-1 s3://bucket-name-2
            Setting up Cron Job
                https://stackoverflow.com/questions/17832860/backup-strategies-for-aws-s3-bucket
                Create s3 folder & create file sync.sh
                  nano /home/ubuntu/s3/sync.sh
                  sudo chmod +x /home/ubuntu/s3/sync.sh
                  copy following script to sync.sh
                    echo 'Syncing remote S3 bucket...'
                    /usr/bin/aws s3 sync s3://bucket-name-1 s3://bucket-name-2
                    echo 'Syncing complete'
                Make script executeable
                  sudo chmod +x /home/ubuntu/s3/sync.sh
                crontab -e
                  0 * * * * /home/ubuntu/s3/sync.sh > /home/ubuntu/s3/sync.log
                If not working (unable to find credentials): https://stackoverflow.com/questions/31425838/bash-with-aws-cli-unable-to-locate-credentials
                  sudo bash -c 'AWS_CONFIG_FILE=/root/.aws/config aws s3 sync s3://bucket-name-1 s3://bucket-name-2'
      "Access":
          For secure and restricted access better to use IAM Role
            https://aws.amazon.com/blogs/security/how-to-restrict-amazon-s3-bucket-access-to-a-specific-iam-role/
          "Access Links:"
            "Virtual-Hosted–Style URL": (bucket name part of url)
            https://bucket.s3.aws-region.amazonaws.com/
            https://bucket.s3.amazonaws.com/
            "Path-Style URL":
            https://s3.aws-region.amazonaws.com/bucket/
            https://s3.amazonaws.com/bucket/
          "Public": using link if public read allowed
          "Private/Secure": Custom Generated S3 Urls
            signer = Aws::S3::Presigner.new(client: s3)
            params{  # optional params
              expiry_time = number_of_secs, default 900 secs (15 minutes), max 1 week (optional)
              secure: true/false (HTTP/HTTPS)
            }
            url = signer.presigned_url( request_method, bucket: bucket, key: "folder/sub-folder/file.txt", params = {} )
                                        request_method can be :get_object, :put_object, :delete_object ...
                "OR"
            s3.bucket(bucket).object("folder/sub-folder/file.txt")
            url = obj.presigned_url(request_method, params = {} )  ==>  request_method can be :get, :put, :delete ...
                "OR"
            https://pawelurbanek.com/rails-secure-s3-uploads
      "Multipart Upload": https://docs.aws.amazon.com/AmazonS3/latest/dev/uploadobjusingmpu-ruby-sdk.html
      "Direct Upload": Using presigned_url
      "Moun/UnMount": using s3fs-fuse
        apt-get update
        sudo apt-get install automake autotools-dev fuse g++ git libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev make pkg-config
        git clone https://github.com/s3fs-fuse/s3fs-fuse.git
        cd s3fs-fuse
        ./autogen.sh
        ./configure --prefix=/usr --with-openssl
        make
        sudo make install
        which s3fs
        touch /etc/passwd-s3fs
        nano /etc/passwd-s3fs
          Your_accesskey:Your_secretkey
        sudo chmod 640 /etc/passwd-s3fs
        mkdir /s3bucketFolder
        s3fs aws-bucket-name -o use_cache=/tmp -o allow_other -o uid=1001 -o mp_umask=002 -o multireq_max=5 -o default_acl=public-read /s3bucketFolder
*************************************************************************

8)  "S3 (buckets) vs Glacier (valuts)"
      "Nature Fact": The glacier is 'cold' – it is dry at its base, and therefore moves very slowly and is not effective at sediment erosion or transportation. 
      Amazon S3 Glacier is an extremely low-cost storage service that provides secure, durable, and flexible storage for data backup and archival.
      S3 is more durable.
      Storage in Glacier is extremely cheap, but it also means retrieving the data from Glacier into S3 can take a long time. (retrieval fees are high)
      Amazon Glacier is designed for the long-term storage of inactive data that will not need to be quickly retrieved (it commonly takes between three-and-five hours to make a retrieval from Glacier)
      Glacier only moves data to S3, does not copy.
      Glacier Limit (40TB)

*************************************************************************

9)  "RDS"
      "Free tier": db.t2.micro - 1 vCPU, 1 GiB RAM
      "DB instance identifier": app1-production
      "Master username": tqr
      "Master password": t@tqr123
      "Database name": my_production
      "Port": TCP/IP 5432
      Once your RDS instance is provisioned, you will need to relax the inbound TCP traffic rules. From the RDS dashboard, select your instance, click on the the Security Group rule for inbound traffic. Edit the inbound rules to allow traffic from your instance IP OR anywhere (0.0.0.0/0).
      Give EC2 instance a private IP addess/32 in RDS instance security group
      "Type": PostgreSQL
      "Protocol": TCP 
      "Port Range": 5432
      "Source": 172.xx.xx.xx/32
      "In database.yml"
        production:
          <<: *common
          pool: 5
          database: 'my_production'
          username: 'tqr'
          password: 't@tqr123'
          host: "app1-production.blablabla.region.rds.amazonaws.com"
          port: '5432'
      https://medium.com/@KerrySheldon/ec2-exercise-1-6-deploy-a-rails-app-to-an-ec2-instance-using-capistrano-3485238e4a4a

*************************************************************************

10)  "Elastic Load Balancer"
        It automatically distributes incoming application traffic across multiple targets, such as Amazon EC2 instances, containers, IP addresses, and Lambda functions.
        https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html
                              ╔ LoadBalancer ╗
              ╔ Listners(Rules) ╗         ╔ Listners(Rules) ╗
            Target Group  Target Group   Target Group  Target Group
        https://aws.amazon.com/elasticloadbalancing/features/#Details_for_Elastic_Load_Balancing_Products

*************************************************************************

11) "Auto Scaling"
        AWS Auto Scaling monitors your applications and automatically adjusts capacity to maintain steady, predictable performance at the lowest possible cost
        It helps you maintain application availability and allows you to automatically add or remove EC2 instances according to conditions you define

*************************************************************************

12) "CloudFront"
      Amazon CloudFront is a fast content delivery network (CDN) service that securely delivers data, videos, applications, and APIs to customers globally with low latency, high transfer speeds, all within a developer-friendly environment.
      AWS Free Tier includes 50GB data transfer out, 2,000,000 HTTP and HTTPS Requests with Amazon CloudFront.
      https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/GettingStarted.html
*************************************************************************

13) "VPC (Virtual Private Cloud):"
      Logically isolated section of the AWS
      * virtual networking environment
      * own IP address range
      * creation of subnets
      * IPv4 & IPv6 for secure & easy access to resources & applications.

*************************************************************************

14) "Elastic Block Store (Amazon EBS):"
      Provides persistent block storage volumes for use with Amazon EC2 instances in the AWS Cloud.
      Each Amazon EBS volume is automatically replicated within its Availability Zone to protect you from component failure, offering high availability and durability
      EBS is designed for application workloads that benefit from fine tuning for performance, cost and capacity.

*************************************************************************

15) "Security Group"
      It is Instance Level Security. It includes rules 
      Rules are set to filters traffic, it is made up of two tables: ‘Inbound’ and ‘Outbound’
      Each rule is comprised of four fields: 'Type', 'Protocol', 'Port Range', and 'Source'

*************************************************************************
╔═╦═╗
║ ║ ║
╠═╬═╣
║ ║ ║
╚═╩═╝
┌─┬─┐
├─┼─┤
└─┴─┘
