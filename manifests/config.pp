# The config
class concat_example::config {
  concat { $::concat_example::config_file:
  }

  if $::concat_example::collector {
    Concat::Fragment <| target == $::concat_example::config_file |> -> Concat[$::concat_example::config_file]
  }
}
