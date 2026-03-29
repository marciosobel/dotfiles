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
    cursor-shape = {
      insert = "bar";
      normal = "block";
      select = "underline";
    };
  };

  keys = {
    normal = {
      x = "select_line_below";
      X = "select_line_above";
      space.x = ":bc";
      space.X = ":bc!";
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
