# Automated MediaWiki Installation Using BlueGreen Deployment over AWS

## Problem Statement
* Installation of Mediawiki utilizing Blue-Green deployment strategy.
* Code should be compatible with CI/CD practices.

## File Details
* InstallMediawiki.sh -> This script is kept in EC2 during AMI bake phase and is utilized in launch configuration for AutoScaling group.
* mediawiki.yaml -> CloudFormation template to develop the infrastructure as per specified requirements.
* parameters.json -> parameters file for mediawiki.yaml
* Setup_Init.sh -> Shell script to build the cloudformation stack for mediawiki installation.

## How to execute the solution ?
After providing the input parameters as per AWS ecosystem configurations, run the below command from the repository directory.
```
sh Setup_Init.sh
```

## Future Scope & Improvements
* This template can be incorporated with automated CI/CD pipeline to evolve it into an enterprise-standard software.
* The script & configurations are written with loose standards due to time constraints. Scripts can be modularized and yaml can be written better.
* For enterprise, configuration management tools can be introduced for better management.