Vagrant.configure("2") do |config|
  config.vm.define "source", autostart: false do |source|
	source.vm.box = "bento/ubuntu-18.04"
	config.ssh.insert_key = false
  end
  config.vm.define "jenkinsUbuntu" do |ubuntu|
	ubuntu.vm.box = "packer_vagrant"
	ubuntu.vm.box_url = "file://package.box"
	config.ssh.insert_key = false
  end
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
