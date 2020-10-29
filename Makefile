converge-web:
    bundle exec knife zero converge "name:web" -a knife_zoro.host

why-run-web:
    bundle exec knife zero converge "name:web" -x ec2-user -W

berks-vendor:
    bundle exec berks vendor vendor/cookbooks
