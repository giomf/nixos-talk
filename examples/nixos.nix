{ pkgs, ... }: # A pinned version of Nixpkgs passed to the configuration by Nix

{
  # Networking configuration
  networking.hostName = "best-os-ever";

  # Enable OpenSSH
  services.openssh.enable = true;

  # Root filesystem
  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };

  # Create a user
  users.users.justme = {
    isNormalUser = true;
    initialPassword = "ChangeMePlzImWeak";
  };

  # CLI tools, language runtimes, shells, and other desired packages
  environment.systemPackages = with pkgs; [
    cargo
    rustc
    curl
    jq
    wget
    git
    fish
  ];
}
