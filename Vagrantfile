# Configure variables
VM_OS = "boxomatic/debian-12-mate"
VM_NAME = ""
SHARED_FOLDER_HOST = ""
RAM_MB = "4096"
CPU_COUNT = "4"

Vagrant.configure("2") do |config|
 config.vm.box = VM_OS
 config.vm.define VM_NAME
 config.vm.synced_folder SHARED_FOLDER_HOST, "/share", automount: true

 # Configure the virtualbox specific values
 config.vm.provider "virtualbox" do |vb|
   vb.name = VM_NAME
	 vb.gui = true

	 # Change the memory and amount of CPUs for the vm
	 vb.cpus = CPU_COUNT
	 vb.memory = RAM_MB

	 # Enable copy paste and drag and drop between host and vm
	 vb.customize ["modifyvm", :id, "--clipboard-mode", "bidirectional"]
   vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]

   # Configure audio
   vb.customize ["modifyvm", :id, "--audio", "pulse"]
   vb.customize ["modifyvm", :id, "--audioout", "on"]
   vb.customize ["modifyvm", :id, "--audiocontroller", "hda"]

   # Configure video
   vb.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
   vb.customize ["modifyvm", :id, "--spec-ctrl", "off"]
   vb.customize ['modifyvm', :id, '--accelerate3d', 'off']
   vb.customize ['modifyvm', :id, '--vram', '256']
 end

   # Copy files
   config.vm.provision "file", source: "obs-studio", destination: "/home/vagrant/.config/obs-studio"
   config.vm.provision "file", source: "firefox/policies.json", destination: "/home/vagrant/policies.json"
   config.vm.provision "file", source: "autologin/60-lightdm-gtk-greeter.conf", destination: "/home/vagrant/60-lightdm-gtk-greeter.conf"

   # Provision commands
   config.vm.provision "shell", path: "setup.sh", privileged: false
end
