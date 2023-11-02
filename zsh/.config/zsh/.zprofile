eval $(/opt/homebrew/bin/brew shellenv)
# Add .NET Core SDK tools
export PATH="$PATH:/Users/cb/.dotnet/tools:/Users/cb/.cargo/bin:/Users/cb/go/bin:/opt/homebrew/opt/llvm/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
export KUBECONFIG=$HOME/.kube/config
export KUBECONFIG=$KUBECONFIG:$HOME/code/skf/k8s-cluster-configuration/kubeconfigs/k3s-admins.yaml
export KUBECONFIG=$KUBECONFIG:$HOME/code/skf/k8s-cluster-configuration/kubeconfigs/my-user.yaml

