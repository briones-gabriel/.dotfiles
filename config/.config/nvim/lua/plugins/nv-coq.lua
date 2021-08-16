g.coq_settings = {
  keymap = {
    jump_to_mark = "<c-j>",
  },
  clients = {
    lsp = {
      short_name = "LSP",
    },
    snippets = {
      short_name = "SNIP",
    },
    tree_sitter = {
      short_name = "TS",
      enabled = false,
    },
    buffers = {
      short_name = "BUF",
    },
    tmux = {
      enabled = false,
    },
    tabnine = {
      enabled = false,
    },
  },
  match = {
    max_results = 24,
  },
  display = {
    pum = {
      x_truncate_len = 1,
      x_max_len = 64,
      kind_context = {" ", ""},
      source_context = {"[", "]"},
    },
    preview = {
      x_max_len = 82,
      positions = {
        north = 4,
        south = 3,
        west = 2,
        east = 1,
      },
    },
  },
}
