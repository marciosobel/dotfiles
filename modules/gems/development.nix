{__findFile, ...}: {
  gems.development = {
    includes = [
      <shards/terminals/kitty>
      <shards/shells/fish>

      <shards/development/direnv>
      <shards/development/git>
      <shards/development/lazygit>
      <shards/development/zellij>

      <shards/virtualisation/docker>

      <shards/editors/neovide>
      <shards/editors/nvim>
      <shards/editors/zed>
    ];
  };
}
