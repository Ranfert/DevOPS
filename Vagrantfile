Vagrant.configure("2") do |config|

  config.vm.define "output" do |output|
	output.vm.box = "packer_vagrant"
	output.vm.box_url = "file://package.box"
	config.ssh.insert_key = false
  end
  config.vm.synced_folder ".", "/vagrant"
config.vm.network "forwarded_port", guest: 22, host:22022
config.vm.network "forwarded_port", guest: 80, host:22080
config.vm.network "forwarded_port", guest: 443, host:22443
config.vm.network "forwarded_port", guest: 3306, host:22306
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
