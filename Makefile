converge-web:
	bundle exec knife zero converge "name:web" -x ec2-user

why-run-web:
	bundle exec knife zero converge "name:web" -x ec2-user -W

berks-vendor:
	bundle exec berks vendor vendor/cookbooks
