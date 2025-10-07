{
  disko.devices = {
    disk = {
      main = {
	type = "disk";
	device = "/dev/disk/by-id/nvme-WD_Green_SN350_250GB_2G0C_23110L801057";
	content = {
	  type = "gpt";
	  partitions = {
	    ESP = {
	      priority = 1;
	      size = "1G";
	      start = "1M";
	      type = "EF00";
	      content = {
		type = "filesystem";
		format = "vfat";
		mountpoint = "/boot";
		mountOptions = [ "umask=0077" ];
	      };
	    };
	    root = {
	      size = "100%";
	      content = {
		type = "btrfs";
		extraArgs = [ "-f" 
		  "--data raid0"
		  "--metadata raid1"
		  "/dev/disk/by-id/nvme-WDC_WDS240G2G0C-00AJM0_224401801569"
		]; 
		subvolumes = {
		  "@" = {
                    mountOptions = [ "compress=zstd" "space_cache=v2" "autodefrag" "discard=async" ];
		    mountpoint = "/";
		  };
		  "@home" = {
		    mountOptions = [ "compress=zstd" ];
		    mountpoint = "/home";
		  };
		  "@nix" = {
		    mountOptions = [
		      "compress=zstd"
			"noatime"
		    ];
		    mountpoint = "/nix";
		  };
		};
	      };
	    };
	  };
	};
      };
    };
  };
}
