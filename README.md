# 📡 Zabbix + Grafana Monitoring Stack (Automatizado com Vagrant + Ansible)

Laboratório reproduzível com **Zabbix 7.0 LTS**, Agent 2, Grafana,
**PostgreSQL 16 + TimescaleDB**, Ubuntu 24.04 LTS e **libvirt/KVM**.

> Ideal para testes de integração, treinamentos internos, estudos de automação, simulação de ambientes produtivos e POCs corporativas.

---

## 🧭 Visão Geral da Arquitetura

Este ambiente simula um stack de monitoramento completo com os seguintes componentes:

- **Zabbix Server**
- **Zabbix Frontend**
- **Zabbix Proxy**
- **PostgreSQL + TimescaleDB**
- **Grafana**
- **Ansible**
- **Vagrant + libvirt/KVM**

---

## ⚙️ Tecnologias Utilizadas

| Tecnologia       | Descrição                                          |
|------------------|---------------------------------------------------|
| **Ansible**      | Automação da configuração                         |
| **Vagrant**      | Provisionamento e gerenciamento das VMs           |
| **libvirt/KVM** | Hypervisor local                                  |
| **Zabbix**       | Ferramenta de monitoramento open-source robusta   |
| **PostgreSQL**   | Banco de dados relacional                         |
| **Grafana**      | Visualização de métricas                          |

---

## 🔩 Estrutura do Projeto

```bash
.
├── Vagrantfile
├── inventory.ini
├── secret.example.yml
├── README.md
├── .gitignore
├── playbooks/
│ ├── grafana_install.yaml
│ ├── zabbix_agent_install.yaml
│ ├── zabbix_db_setup.yaml
│ ├── zabbix_frontend_install.yaml
│ ├── zabbix_proxy_install.yaml
│ └── zabbix_server_install.yaml
├── roles/
│ ├── grafana/
│ ├── postgresql/
│ ├── timescaledb/
│ ├── zabbix_agent/
│ ├── zabbix_db/
│ ├── zabbix_frontend/
│ ├── zabbix_proxy/
│ └── zabbix_server/
```

---

## 🚀 Como Utilizar

### 1. Pré-requisitos

- VirtualBox
- Vagrant
- Ansible
- Python 3.x + pip (para scripts auxiliares)

### 2. Provisionamento

```bash
cp secret.example.yml secret.yml
# Edite secret.yml e, preferencialmente, proteja-o com Ansible Vault.
vagrant up
```

---

## 🌐 Endpoints

| Componente         | URL/IP                    | Usuário / Senha         |
|--------------------|---------------------------|--------------------------|
| **Zabbix Frontend**| http://192.168.56.40/zabbix | definido em `secret.yml` |
| **Grafana**        | http://192.168.56.70:3000 | definido em `secret.yml` |
| **PostgreSQL**     | 192.168.56.30:5432 | definido em `secret.yml` |

Nunca faça commit de `secret.yml`. Para criptografá-lo:

```bash
ansible-vault encrypt secret.yml
```

---

## 📊 Dashboards

### Plugins habilitados:

- `alexanderzobnin-zabbix-app`

### Dashboards importados:

- [Estatísticas PostgreSQL (16981)](https://grafana.com/grafana/dashboards/16981/)
- [Zabbix Server (5363)](https://grafana.com/grafana/dashboards/5363/)

## Provisionamento seguro do banco

Antes de vagrant up, instale a coleção fixada com ansible-galaxy collection install -r requirements.yml. O host do banco precisa de psycopg2, instalado pela role PostgreSQL. Usuários e banco são gerenciados por módulos PostgreSQL; senhas são parâmetros protegidos por no_log.

O schema base só é importado se public.dbversion não existe e o banco não contém tabelas. Banco parcialmente inicializado bloqueia a instalação. A extensão TimescaleDB precede a conversão, que é protegida pela existência da hypertable history. Antes de upgrades, faça backup e siga o processo oficial de atualização do Zabbix; este playbook não reimporta o schema para atualizar versões.

Para testar, use banco descartável e senha sintética contendo apóstrofo. Execute o playbook duas vezes: a segunda deve preservar dados e pular importações. Verifique acesso dos hosts do inventário e bloqueio de uma origem não autorizada. Migre regras antigas de monitoramento 0.0.0.0/0 antes de usar fora de um ambiente isolado.

## Aprender a configuração

Consulte o [guia comentado](docs/APRENDIZADO.md) para entender componentes, escolhas, testes positivos/negativos e reversão.

## Fixar a versão da box

Selecione no catálogo oficial da box uma versão existente com provider libvirt e defina VAGRANT_BOX_VERSION antes de vagrant validate/up. O provisionamento bloqueia sem essa escolha, evitando resolver silenciosamente uma versão móvel. O nome da box e a versão devem existir no catálogo; ruby -c valida apenas a sintaxe e não comprova disponibilidade do download. Para atualizar, revise a versão e teste em uma VM descartável.
