# Idempotência e banco


Cada role declara dependências e handlers. Usuário e banco são gerenciados por módulos PostgreSQL; dados sensíveis ficam sob no_log. A primeira importação difere de migração de versão. Duas execuções em banco descartável devem preservar dados. Uma execução parcialmente concluída deve parar para revisão, não apagar tabelas.

## Relação com a implantação OpenShift

Este laboratório instala Zabbix em VMs com Ansible. zabbix-gitops mantém uma implantação OpenShift independente. Não copie nomes de Services, Secrets ou comandos oc para este inventário. Valide conectividade entre VMs e permissões PostgreSQL antes da aplicação das roles, preservando o volume de dados nas reexecuções.
