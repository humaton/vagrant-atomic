module VagrantPlugins
  module GuestAtomic
    module Cap
      class RSync
        def self.rsync_installed(machine)
          0
        end
      end
    end
  end
end