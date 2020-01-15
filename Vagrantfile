Vagrant.configure("2") do |config|
  config.vm.define "source", autostart: true do |source|
	source.vm.box = "bento/ubuntu-18.04"
	config.ssh.insert_key = false
  end

  config.vm.synced_folder ".", "/vagrant"
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
