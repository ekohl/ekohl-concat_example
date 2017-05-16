# A dummy service that checks if /tmp/dependency exists
class concat_example::service {
  exec { 'dummy service':
    command => "ls ${::concat_example::dependency_file}",
    path    => ['/bin/', '/usr/bin'],
  }
}
