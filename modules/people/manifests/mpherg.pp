class people::mpherg {
  include docker
  include dropbox

  include iterm2::stable
  include iterm2::colors::solarized_light
  include iterm2::colors::solarized_dark

  include macvim

  include ohmyzsh
  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_remote_control_ir_receiver
  include osx::global::tap_to_click
  include osx::finder::show_all_on_desktop
  include osx::finder::show_hidden_files
  include osx::finder::no_file_extension_warnings
  include osx::no_network_dsstores
  class { "osx::global::key_repeat_delay":
    delay => 30
  }
  osx::recovery_message {
    "If this Mac is found, please call 801-888-4162":
  }

  include quicksilver
  include spectacle
  include virtualbox
  include zsh
}
