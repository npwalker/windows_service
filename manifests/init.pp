define windows_service (
  $service_name 
  $user_name
  $password
) {

  exec { "Modify ${service_name}" :
    provider => 'powershell',
    command => "\$(Get-WmiObject Win32_service -filter \"name=\'${service_name}\'\").Change(\$null,\$null,\$null,\$null,\$null,\$false,\"${user_name}",\"${password}\")",
    unless  => "if ( \$(Get-WmiObject Win32_service -filter \"name=\'${service_name}\'\").StartName -eq \"${user_name}\" ) { exit 0 } Else { exit 1}",
    #logoutput => true,
  }

}
