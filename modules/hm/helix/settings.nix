{
  editor = {
    line-number = "relative";
    end-of-line-diagnostics = "hint";
    bufferline = "multiple";
    cursorline = false;
    popup-border = "all";
    scrolloff = 8;
    file-picker.hidden = false;
    inline-diagnostics.cursor-line = "warning";
  };

  keys = {
    normal = {
      x = "select_line_below";
      X = "select_line_above";
      space.x = ":bc";
      space.X = ":bc!";
      space.e = let
        unique-file = "/tmp/unique-file";
      in [
        ":sh rm -f ${unique-file}"
        ":insert-output yazi \"%{buffer_name}\" --chooser-file=${unique-file}"
        ":sh printf \"\\x1b[?1049h\\x1b[?2004h\" > /dev/tty"
        ":open %sh{cat ${unique-file}}"
        ":redraw"
        ":set-option mouse false"
        ":set-option mouse true"
      ];
    };
    select = {
      x = "select_line_below";
      X = "select_line_above";
    };
    insert = {
      C-space = "completion";
    };
  };
}
