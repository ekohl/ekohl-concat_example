# A class that could be in another module
class concat_example::other {
  file { $::concat_example::dependency_file:
    ensure => directory,
  }
  -> concat_example::snippet { 'logging':
    content => "use ${::concat_example::dependency_file}",
  }
}
