# 📡 Zabbix + Grafana Monitoring Stack (Automatizado com Vagrant + Ansible)

Este repositório entrega um laboratório 100% automatizado para provisionamento de uma stack de monitoramento baseada em **Zabbix** e **Grafana**, utilizando **PostgreSQL com TimescaleDB** como backend e infraestrutura criada com **Vagrant + VirtualBox**.

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
- **Vagrant + VirtualBox**

---

## ⚙️ Tecnologias Utilizadas

| Tecnologia       | Descrição                                          |
|------------------|---------------------------------------------------|
| **Ansible**      | Automação da configuração                         |
| **Vagrant**      | Provisionamento e gerenciamento das VMs           |
| **VirtualBox**   | Hypervisor local                                  |
| **Zabbix**       | Ferramenta de monitoramento open-source robusta   |
| **PostgreSQL**   | Banco de dados relacional                         |
| **Grafana**      | Visualização de métricas                          |

---

## 🔩 Estrutura do Projeto

```bash
.
├── Vagrantfile
├── inventory.ini
├── secret.yml
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
vagrant up
```

---

## 🌐 Endpoints

| Componente         | URL/IP                    | Usuário / Senha         |
|--------------------|---------------------------|--------------------------|
| **Zabbix Frontend**| http://192.168.56.40/zabbix| `Admin` / `zabbix`      |
| **Grafana**        | http://192.168.56.70:3000 | `admin` / `admin`       |
| **PostgreSQL**     | 192.168.56.30:5432        | `zabbix` / `zabbix123`  |

---

## 📊 Dashboards

### Plugins habilitados:

- `alexanderzobnin-zabbix-app`

### Dashboards importados:

- [Estatísticas PostgreSQL (16981)](https://grafana.com/grafana/dashboards/16981/)
- [Zabbix Server (5363)](https://grafana.com/grafana/dashboards/5363/)
