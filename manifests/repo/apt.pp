# sets up the vmware hosted apt repo
# requires
#   puppetlabs-apt
#   puppetlabs-stdlib
class rabbitmq::repo::apt(
  $pin = undef
) {

  Class['rabbitmq::repo::apt'] -> Package<| title == 'rabbitmq-server' |>

  apt::source { 'rabbitmq':
    location    => 'http://www.rabbitmq.com/debian/',
    release     => 'testing',
    repos       => 'main',
    include_src => false,
    key         => '056E8E56',
    key_source  => 'http://www.rabbitmq.com/rabbitmq-signing-key-public.asc',
    pin         => $pin,
  }
}
