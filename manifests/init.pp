# Main class
#
# @param collector whether to install a collector for the fragments
# @param config_file the location of the config file
# @param dependency_file the location of the dependency
class concat_example (
  $collector = false,
  $config_file = '/tmp/example',
  $dependency_file = '/tmp/dependency',
) {
  contain ::concat_example::config
  contain ::concat_example::service

  Class['concat_example::config'] -> Class['concat_example::service']

  include ::concat_example::other
}
