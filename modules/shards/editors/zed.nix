{
  shards.editors.zed = {
    homeManager = {
      programs.zed-editor = {
        enable = true;

        extensions = [
          "toml"
          "html"
          "dockerfile"
          "vue"
          "make"
          "proto"
          "nix"
          "zig"
        ];

        userSettings = {
          helix_mode = true;
          inline_code_actions = true;
          which_key.enabled = true;
          editpredictions.mode = "subtle";
          calls.mute_on_join = true;
          git = {
            branch_picker.show_author_name = true;
            inline_blame.show_commit_summary = true;
          };
          collaboration_panel.dock = "right";
          gutter.min_line_number_digits = 2;
          diagnostics.inline.enabled = true;
          relative_line_numbers = "enabled";
          terminal = {
            shell.program = "fish";
            toolbar.breadcrumbs = false;
          };
          agent = {
            sidebar_side = "right";
          };
          titlebar = {
            show_menus = false;
            show_user_picture = false;
          };
        };
      };
    };
  };
}
