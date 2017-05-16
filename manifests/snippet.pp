define concat_example::snippet (
  $content,
) {
  concat::fragment { $title:
    target  => $::concat_example::config_file,
    content => $content,
  }
}
