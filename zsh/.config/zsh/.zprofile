eval $(/opt/homebrew/bin/brew shellenv)
# Add .NET Core SDK tools
export PATH="$PATH:/Users/cb/.dotnet/tools:/Users/cb/.cargo/bin:/Users/cb/go/bin"
export KUBECONFIG=$HOME/.kube/config
export KUBECONFIG=$KUBECONFIG:$HOME/code/skf/k8s-cluster-configuration/kubeconfigs/k3s-admins.yaml
export KUBECONFIG=$KUBECONFIG:$HOME/code/skf/k8s-cluster-configuration/kubeconfigs/my-user.yaml
# helix search
hxs() {
	RG_PREFIX="rg -i --files-with-matches"
	local files
	files="$(
		FZF_DEFAULT_COMMAND_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --multi 3 --print0 --sort --preview="[[ ! -z {} ]] && rg --pretty --ignore-case --context 5 {q} {}" \
				--phony -i -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap" \
				--bind 'ctrl-a:select-all'
	)"
	[[ "$files" ]] && hx --vsplit $(echo $files | tr \\0 " ")
}
