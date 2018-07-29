# Add .NET Core SDK tools
export PATH="$PATH:/home/cayde/.dotnet/tools"

if [[ -f /etc/arch-release ]]; then
  export DOTNET_ROOT="/opt/dotnet"
fi

