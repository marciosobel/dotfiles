{__findFile, ...}: {
  gems.optimisations.full = {
    includes = [
      <shards/optimisations/garbage-collection>
      <shards/optimisations/store>
      <shards/optimisations/performance>
    ];
  };
}
