Vagrant.configure("2") do |config|
  nodes = [
    { name: "zabbix_db",       ip: "192.168.56.30", ram: 1024, cpus: 1, playbook: "zabbix_db_setup.yaml" },
    { name: "zabbix_server",   ip: "192.168.56.10", ram: 1024, cpus: 1, playbook: "zabbix_install.yaml" },
    { name: "zabbix_agent",    ip: "192.168.56.20", ram: 512,  cpus: 1, playbook: "zabbix_agent_install.yaml" },
    { name: "zabbix_frontend", ip: "192.168.56.40", ram: 512,  cpus: 1, playbook: "zabbix_frontend_install.yaml" },
    { name: "zabbix_proxy",    ip: "192.168.56.50", ram: 512,  cpus: 1, playbook: "zabbix_proxy_install.yaml" },
    { name: "grafana",         ip: "192.168.56.70", ram: 1024, cpus: 1, playbook: "grafana_install.yaml" }
  ]

  hosts_entries = nodes.map { |n| "echo '#{n[:ip]} #{n[:name].gsub('_','-')}' >> /etc/hosts" }.join("\n")

  nodes.each do |node|
    config.vm.define node[:name] do |n|
      n.vm.box = "ubuntu/jammy64"
      n.vm.hostname = node[:name].gsub('_','-')
      n.vm.network "private_network", ip: node[:ip]

      n.vm.provider :libvirt do |vb|
        vb.memory = node[:ram]
        vb.cpus = node[:cpus]
        vb.machine_type = "pc"
      end

      n.vm.provision "shell", inline: hosts_entries

      if node[:playbook]
        n.vm.provision "ansible" do |ansible|
          ansible.playbook = "playbooks/#{node[:playbook]}"
          ansible.inventory_path = "inventory.ini"
          ansible.verbose = "v"
          ansible.extra_vars = { "secret_file" => "secret.yml" }
        end
      end
    end
  end
end
