echo "#> Initiating build of required CF stack"
aws cloudformation create-stack --stack-name mediaWiki_stack --template-body mediawiki.yaml --parameters ecosystem_parameters.json