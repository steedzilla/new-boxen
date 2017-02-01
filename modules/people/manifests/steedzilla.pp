class people::steedzilla {
  $home     = "/Users/${::boxen_user}"
#  $dotfiles = "${home}/.dotfiles"

#  repository { $dotfiles:
#    source  => 'mpherg/dotfiles'
#  }

  include atom
  atom::package { [
    'linter',
    'linter-clang',
    'you-complete-me',
    'vim-mode-plus'
    ]:
  }

  include arduino
  include cmake
#  include chrome
  include dropbox
  include handbrake

  include iterm2::stable
  include iterm2::colors::solarized_light
  include iterm2::colors::solarized_dark

  include java
#  include mactex::full
  include macvim
  include ohmyzsh
  include xquartz

  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_remote_control_ir_receiver
  include osx::global::tap_to_click
  include osx::finder::show_all_on_desktop
  include osx::finder::no_file_extension_warnings
  include osx::no_network_dsstores
  class { 'osx::global::key_repeat_delay':
    delay => 25
  }
  class { 'osx::global::key_repeat_rate':
    rate => 2
  }
  osx::recovery_message {
    'If this Mac is found, please call 801-923-8765':
  }

  include spectacle
  include tmux
  include vagrant
  include virtualbox
  include zsh

  # Various homebrew packages
  package { [
    'boost',
    'clang-format',
    'dos2unix',
    'eigen',
    'gpg',
    'maven',
    'python3',
    'tree',
    ]:
    ensure => 'present'
  }

package { [
    'eclipse-java',
    ]:
    ensure => present,
    provider => 'brewcask'
}

  # Make sure our python site-packages refers to boxen
  file { [
    "${home}/Library",
    "${home}/Library/Python",
    "${home}/Library/Python/2.7",
    "${home}/Library/Python/2.7/site-packages" ]:
      ensure => directory,
      owner  => "${::boxen_user}",
  }

  file { "${home}/Library/Python/2.7/site-packages/homebrew.pth":
    content => template('people/homebrew.pth.erb'),
    owner   => "${::boxen_user}",
    require => File["${home}/Library/Python/2.7/site-packages"],
  }
}
