An example of managing an user / password for a windows service

~~~
windows_service { "pe-puppet" :
  username => '.\vagrant',
  password => 'vagrant',
}
~~~
