{__findFile, ...}: {
  gems.gaming = {
    full = {
      includes = [
        <shards/apps/gaming/gamemode>
        <shards/apps/gaming/heroic>
        <shards/apps/gaming/steam>
        <shards/apps/gaming/minecraft>
        <shards/apps/gaming/roblox>
      ];
    };

    min = {
      includes = [
        <shards/apps/gaming/gamemode>
        <shards/apps/gaming/steam>
      ];
    };
  };
}
