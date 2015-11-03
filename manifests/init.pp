define windows_service (
  $service_name = $title, 
  $username,
  $password
) {

  exec { "Modify ${service_name}" :
    provider => 'powershell',
    command => "\$(Get-WmiObject Win32_service -filter \"name=\'${service_name}\'\").Change(\$null,\$null,\$null,\$null,\$null,\$false,\"${username}\",\"${password}\")",
    unless  => "if ( \$(Get-WmiObject Win32_service -filter \"name=\'${service_name}\'\").StartName -eq \"${username}\" ) { exit 0 } Else { exit 1}",
    #logoutput => true,
  }

}
