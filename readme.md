pending tasks:

1. Add Vault handling secrets
2. Add Github actions for the flow mentioned below



Github actions flow:

step1: 
    - Get VMs from AWS. 
      Image required: alpine + aws cli 
      Input: AWS Secrets(Access key, secret key)
      Output: IP addresses, Hostnames
step2: 
    - Convert that data from step 1 to prometheus consumable format. 
      Image required: alpine 
      Input: IPs, hostnames from Step1
      Output: targets.json
step3: 
    - Inject this file i.e., deliverable of step 2 into configMap. 
      Image required: kubectl
      Input:
      - Kubectl config of k8s cluster where prometheus is running
      - targets.json from step2
      Output:
      - configured configmap