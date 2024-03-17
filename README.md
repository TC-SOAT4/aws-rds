## Tech Challenge - FASE 3

### Criação banco de dados gerenciado AWS RDS utilizando Terraform

Projeto para criar um banco de dados gerenciado AWS RDS. O RDS utiliza engine mariadb versão 10.11.

------------

**Requisitos para executar**

- Conta AWS
- Conta Terraform Cloud
- AWS CLI
- Terraform CLI

- AWS:
    - Criar/Gerar credenciais de acesso AWS no IAM:
        - AWS_ACCESS_KEY_ID
        - AWS_SECRET_ACCESS_KEY
        
- Terraform Cloud:
    - Criar um **organization** e substituir no  arquivo **terraform.tf**
    - Criar **Variable sets** e adicionar as credenciais de acesso AWS :
        - Criar uma entrada para: AWS_ACCESS_KEY_ID
        - Criar uma entrada para: AWS_SECRET_ACCESS_KEY
