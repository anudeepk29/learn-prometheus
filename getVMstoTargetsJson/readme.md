flag to enable config reload 
--web.enable-lifecycle

HTTP call to reload config
POST Method
<ip_address_of_prometheus>:9090/-/reload 


execution flow:
1. shell_command_to_get_VMs.sh
2. convert_to_json.sh

for the frsit command you need to add access_key and secret_key using aws configure
