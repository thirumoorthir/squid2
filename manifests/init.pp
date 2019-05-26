# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include squid
class squid2 {

class {'squid': 
  cache_mem                 => '512 MB',
  workers                   => 3,
  config_user               => 'squid',
  coredump_dir              => '/var/spool/squid',
  http_access               => { 'boaz s3' => { action => 'allow', }},
  http_ports                => { '10000' => { options => 'accel vhost', }},
  snmp_ports                => { '1000' => { process_number => 3, }},
  cache_dirs                => { '/data/' => { type => 'ufs', options => '15000 32 256 min-size=32769', process_number => 2 }},
}
 squid::acl {'boaz':
  type    => 'src',
  entries => ['100.96.0.0/11'],
}

 squid::acl { 's3':
  type    => 'dstdom_regex',
  entries => ['.*s3\.amazonaws\.com',
              '.*s3\.eu-central-1\.amazonaws\.com',
              '.*s3\.sa-east-1\.amazonaws\.com',
              '.*s3\.ap-northeast-1\.amazonaws\.com',
              '.*s3\.eu-west-1\.amazonaws\.com',
              '.*s3\.us-west-1\.amazonaws\.com',
              '.*s3\.us-west-2\.amazonaws\.com',
              '.*s3\.ap-southeast-2\.amazonaws\.com',
              '.*s3\.ap-southeast-1\.amazonaws\.com',
              '.*s3-eu-central-1\.amazonaws\.com',
              '.*s3-sa-east-1\.amazonaws\.com',
              '.*s3-ap-northeast-1\.amazonaws\.com',
              '.*s3-eu-west-1\.amazonaws\.com',
              '.*s3-us-west-1\.amazonaws\.com',
              '.*s3-us-west-2\.amazonaws\.com',
              '.*s3-ap-southeast-2\.amazonaws\.com',
              '.*s3-ap-southeast-1\.amazonaws\.com',
              ],
}

squid::http_port { '127.0.0.1:3128':
}


}

