g.coq_settings = {
  match = {
    unifying_chars = { "-", "_" },
    max_results = 24,
    proximate_lines = 8,
    exact_matches = 2,
    look_ahead = 2,
    fuzzy_cutoff = 0.8,
  },
  weights = {
    prefix_matches = 2.0,
    edit_distance = 1.5,
    recency = 1.0,
    proximity = 0.5,
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
        east = 1,
        west = nil,
        south = nil,
        north = nil,
      },
    },
  },
  limits = {
    completion_auto_timeout = 0.088,
  },
  keymap = {
    jump_to_mark = "<c-j>",
  },
  clients = {
    lsp = {
      short_name = "LSP",
    },
    snippets = {
      short_name = "SNIP",
      sources = {
        -- LSP
        "vue-vscode-snippets/snippets",
        "vscode-javascript/snippets",
        --"snipsnap/snippets",
        -- Neosnippets
        "neosnippet-snippets/neosnippets",
        -- Ultisnip
        "vim-snippets/snippets",
        --"vim-snippets/UltiSnips",
      },
    },
    buffers = {
      short_name = "BUF",
      enabled = true,
    },
    tree_sitter = {
      short_name = "TS",
      enabled = false,
    },
    tmux = {
      enabled = false,
    },
    tabnine = {
      enabled = false,
    },
  },
}
