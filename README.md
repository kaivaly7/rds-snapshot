## SVOD AWS creating RDS instances from snapshot


### Components Created by Stack

- RDS DB instance


### Prerequisites

Install brew on Mac to get terraform and make
- **Terraform (version >= 0.12)**: ```brew install hashicorp/tap/terraform```
- **Make**: ```brew install make```
- **7zip**:```brew install p7zip```
- **Verify sender email address with Amazon SES**:```Before you can send an email with Amazon SES, you must verify that you own the sender's email address.```

### Create Stack

Terraform uses configuration values in the AWS config file to choose which vars file to use and to construct the workspace name. **It is important these are set**: 

```bash
export AWS_PROFILE=saml
aws configure set region us-east-1
aws configure set account ns
aws configure set deploy-color blue
aws configure set env dev
```

These commands only need to be ran once as they add these configurations to your AWS config file.

`account` and `region` should stay constant for majority of use cases but `deploy-color` and  `env` should be changed according to the stack you want to deploy. To see the current configurations, use these commands:

```bash
aws configure get env --profile saml
aws configure get deploy-color --profile saml
```

The `.tfvars` file in the `vars/` directory should correspond to the configurations specified. Refer to the `vars.tf` for variable descriptions (they are required if there if no default value in this file).

### Create Stack
```makefile
make create ACCOUNT=svod ENV=nonprod COLOR=blue REGION=us-east-1

command for prod :
make create ACCOUNT=svod ENV=prod COLOR=blue REGION=us-east-1
```

### Applying Changes to Existing Stack

```makefile
make apply ACCOUNT=svod ENV=nonprod COLOR=blue REGION=us-east-1
```

### Deleting Stack

```makefile
make delete ACCOUNT=svod ENV=nonprod COLOR=blue REGION=us-east-1
```

#### *Important*: 
```
Error: DeleteConflict: Cannot delete entity, must detach all policies first.
        status code: 409, request id: 12c3fc70-9c0e-11e9-a119-f17d98cf0d01
```
Sometimes the `make delete` command fails with the above error, this just means the stack deleted all resources except the IAM role due to the extra policies Enterprice IT CTO attaches to roles.
``Please delete role manually by going to AWS Console``