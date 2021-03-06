# Class: objectivefs
# ===========================
#
# This holds together the installation and configuration of the system
#
class objectivefs (
  String[9, 9]        $uid,
  String              $version          = '4.1.1',
  String              $package_provider = $::objectivefs::params::package_provider,
  String              $package_name     = $::objectivefs::params::package_name,
  Array[String]       $dependencies     = $::objectivefs::params::dependencies,
  Datatypes::Unixpath $download_path    = $::objectivefs::params::download_path,
  # These are "private" and you should only change them if you have your own mirror
  String              $_base_url        = $::objectivefs::params::base_url,
  String              $_package_prefix  = $::objectivefs::params::package_prefix,
  String              $_package_suffix  = $::objectivefs::params::package_suffix,
  String              $package_file     = "${_package_prefix}${version}${_package_suffix}",
  Datatypes::HTTPSUrl $download_url     = "${_base_url}/${uid}/${package_file}",

  # Config
  String[24,24]       $license,
  String              $access_key_id,
  String              $secret_access_key,
  Optional[String]    $default_region  = undef,

) inherits ::objectivefs::params {

  contain ::objectivefs::install
  contain ::objectivefs::config
}
