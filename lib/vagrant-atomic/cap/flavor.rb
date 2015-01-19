module VagrantPlugins
  module GuestAtomic
    module Cap
      class Flavor
        def self.flavor(machine)
          # Read the version file
          machine.communicate.sudo("cat /etc/os-release | grep Atomic") do |type, data|
            name = data.split("=")[1] if type == :stdout
          end

          # Detect various flavors we care about
          case name
            when name.include?("Red Hat")
              return :redhat_atomic
            when name.include?("CentOS")
              return :centos_atomic
            when name.include?("Fedora")
              return :fedora_atomic
            else
              return :atomic
          end
        end
      end
    end
  end
end