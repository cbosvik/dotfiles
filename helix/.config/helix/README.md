# Helix

## Installation

## Language Servers
See [Language Servers](https://github.com/helix-editor/helix/wiki/How-to-install-the-default-language-servers)

```bash
npm i -g bash-language-server vscode-langservers-extracted dockerfile-language-server-nodejs yaml-language-server@next typescript typescript-language-server
go install github.com/grafana/jsonnet-language-server@latest
brew install marksman lua-language-server
rustup component add rust-analyzer
cargo install taplo-cli --locked --features lsp
```


## Csharp
### Omnisharp
`omnisharp-roslyn` can be installed by downloading and extracting a release for your platform from [here](https://github.com/OmniSharp/omnisharp-roslyn/releases). 
Omnisharp can also be built from source by following the instructions [here](https://github.com/omnisharp/omnisharp-roslyn#downloading-omnisharp).

Because OmniSharp is not shipped as a binary file, instead as `OmniSharp.dll`, it needs to be run using dotnet. As such the `languages.toml` config should be changed to this:
```toml
[[language]]
name = "c-sharp"
language-server = { command = "dotnet", args = [ "path/to/OmniSharp.dll", "--languageserver" ] }
```
If the language server immediately exits or otherwise doesn't appear to work, try running `dotnet restore` and/or dotnet build in the current project directory.
