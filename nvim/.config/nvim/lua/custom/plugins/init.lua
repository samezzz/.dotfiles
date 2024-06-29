-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'ggandor/leap.nvim',
  'kana/vim-textobj-user',
  'vim-scripts/ReplaceWithRegister',
  'wellle/targets.vim',
  'junegunn/vim-easy-align',
  'tpope/vim-repeat',
  'adelarsq/vim-matchit',
  'farmergreg/vim-lastplace',
  'bkad/CamelCaseMotion',
  'xiyaowong/transparent.nvim',
  'kaicataldo/material.vim',
  'github/copilot.vim',
  'ThePrimeagen/vim-be-good',
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    config = function()
      require('dressing').setup()
    end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },
  {
    'zbirenbaum/copilot.lua',
    enabled = false,
    event = { 'BufEnter' },
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = false,
        },
        panel = { enabled = false },
      }
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    enabled = false,
    event = { 'BufEnter' },
    dependencies = { 'zbirenbaum/copilot.lua' },
    config = function()
      require('copilot_cmp').setup()
    end,
  },
  {
    'echasnovski/mini.cursorword',
    version = '*',
    lazy = true,
    event = 'CursorMoved',
  },
  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 80, -- width of the Zen window
        height = 1, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          -- signcolumn = "no", -- disable signcolumn
          -- number = false, -- disable number column
          -- relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },
    },
  },
  {
    'xiyaowong/transparent.nvim',
    lazy = false,
    config = function()
      vim.cmd [[hi StatusLine ctermbg=0 cterm=NONE]]
      require('transparent').setup { -- Optional, you don't have to run setup.
        groups = { -- table: default groups
          'Normal',
          'NormalNC',
          'Comment',
          'Constant',
          'Special',
          'Identifier',
          'Statement',
          'PreProc',
          'Type',
          'Underlined',
          'Todo',
          'String',
          'Function',
          'Conditional',
          'Repeat',
          'Operator',
          'Structure',
          'LineNr',
          'NonText',
          'SignColumn',
          'CursorLine',
          'CursorLineNr',
          'StatusLine',
          'StatusLineNC',
          'EndOfBuffer',
        },
        extra_groups = {}, -- table: additional groups that should be cleared
        exclude_groups = {}, -- table: groups you don't want to clear
      }
    end,
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local logo = [[
          ███████╗ █████╗ ███╗   ███╗███████╗███████╗███████╗          
          ██╔════╝██╔══██╗████╗ ████║██╔════╝██╔════╝██╔════╝          
          ███████╗███████║██╔████╔██║█████╗  ███████╗███████╗          
          ╚════██║██╔══██║██║╚██╔╝██║██╔══╝  ╚════██║╚════██║          
          ███████║██║  ██║██║ ╚═╝ ██║███████╗███████║███████║          
          ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝          
        ]]
      logo = string.rep('\n', 8) .. logo .. '\n\n'
      require('dashboard').setup {
        theme = 'doom',
        config = {
          header = vim.split(logo, '\n'),
          center = {
            {
              icon = '📂  ',
              icon_hl = 'Title',
              desc = 'File Explorer                           ',
              desc_hl = 'String',
              key = 'e',
              -- keymap = 'e',
              key_hl = 'Number',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'Oil',
            },
            {
              icon = '🗒  ',
              icon_hl = 'Title',
              desc = 'Find File',
              desc_hl = 'String',
              key = 'f',
              -- keymap = 'f',
              key_hl = 'Number',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'Telescope find_files',
            },
            {
              icon = '📝  ',
              icon_hl = 'Title',
              desc = 'New file',
              desc_hl = 'String',
              key = 'n',
              -- keymap = 'n',
              key_hl = 'Number',
              key_format = ' %s',
              action = 'enew',
            },
            -- {
            --   icon = '📁  ',
            --   icon_hl = 'Title',
            --   desc = 'File Browser',
            --   desc_hl = 'String',
            --   key = 'b',
            --   -- keymap = 'b',
            --   key_hl = 'Number',
            --   key_format = ' %s',
            --   action = 'Telescope file_browser',
            -- },
            {
              icon = '📑  ',
              icon_hl = 'Title',
              desc = 'Recent files',
              desc_hl = 'String',
              key = 'r',
              -- keymap = 'r',
              key_hl = 'Number',
              key_format = ' %s',
              action = 'Telescope oldfiles',
            },
            {
              icon = '🔍  ',
              icon_hl = 'Title',
              desc = 'Find text',
              desc_hl = 'String',
              key = 'g',
              -- keymap = 'g',
              key_hl = 'Number',
              key_format = ' %s',
              action = 'Telescope live_grep',
            },
            {
              icon = '⚙   ',
              icon_hl = 'Title',
              desc = 'Config',
              desc_hl = 'String',
              key = 'c',
              -- keymap = 'c',
              key_hl = 'Number',
              key_format = ' %s',
              action = 'edit ~/.config/nvim/init.lua',
            },
            {
              icon = '🔂  ',
              icon_hl = 'Title',
              desc = 'Restore Session',
              desc_hl = 'String',
              key = 's',
              -- keymap = 's',
              key_hl = 'Number',
              key_format = ' %s',
              action = 'lua print(3)',
            },
            {
              icon = '🍱  ',
              icon_hl = 'Title',
              desc = 'Lazy Extras',
              desc_hl = 'String',
              key = 'x',
              -- keymap = 'x',
              key_hl = 'Number',
              key_format = ' %s',
              action = 'Telescope builtin',
            },
          },
          footer = {
            '',
            '',
            '',
            'I pray🙏 that I will get somebody to',
            'correct me and to tell me the truth 😕',
          },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  {
    'windwp/nvim-ts-autotag',
    ft = {
      'javascript',
      'typescript',
      'typescriptreact',
      'javascriptreact',
    },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon.setup {
        config = {
          default = {
            Map('n', '<leader>a', function()
              harpoon:list():add()
            end),
            Map('n', '<C-e>', function()
              harpoon.ui:toggle_quick_menu(harpoon:list())
            end),
            Map('n', '<M-1>', function()
              harpoon:list():select(1)
            end),
            Map('n', '<M-2>', function()
              harpoon:list():select(2)
            end),
            Map('n', '<M-3>', function()
              harpoon:list():select(3)
            end),
            Map('n', '<M-4>', function()
              harpoon:list():select(4)
            end),
            Map('n', '<M-5>', function()
              harpoon:list():select(5)
            end),
            -- Toggle previous & next buffers stored within Harpoon list
            Map('n', '<M-,>', function()
              harpoon:list():prev()
            end),
            Map('n', '<M-.>', function()
              harpoon:list():next()
            end),
          },
          settings = { save_on_toggle = true, key = function() end },
        },
        ui = {},
        data = {},
        logger = {},
        lists = {},
        hooks_setup = {},
        _extensions = {},
      }

      -- basic telescope configuration
      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        local make_finder = function()
          local paths = {}

          for _, item in ipairs(harpoon_files.items) do
            table.insert(paths, item.value)
          end

          return require('telescope.finders').new_table {
            results = paths,
          }
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
            attach_mappings = function(prompt_buffer_number, map)
              map('i', '<C-a>', function()
                local state = require 'telescope.actions.state'
                local selected_entry = state.get_selected_entry()
                local current_picker = state.get_current_picker(prompt_buffer_number)

                -- This is the line you need to remove the entry
                harpoon:list():remove(selected_entry)
                current_picker:refresh(make_finder())
              end)

              return true
            end,
          })
          :find()
      end

      vim.keymap.set('n', '<C-e>', function()
        toggle_telescope(harpoon:list())
      end, { desc = 'Open harpoon window' })
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup()
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
    opts = {
      check_ts = true,
      ts_config = {
        lua = { 'string' },
        javascript = { 'template_string' },
        java = false,
      },
    },
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<M-H>', '<cmd>TmuxNavigateLeft<cr>' },
      { '<M-J>', '<cmd>TmuxNavigateDown<cr>' },
      { '<M-K>', '<cmd>TmuxNavigateUp<cr>' },
      { '<M-L>', '<cmd>TmuxNavigateRight<cr>' },
      { '<M-\\>', '<cmd>TmuxNavigatePrevious<cr>' },
    },
  },
  {
    'craftzdog/solarized-osaka.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'material',
        },
      }
    end,
  },
  {
    'kylechui/nvim-surround',
    tag = '*',
    config = function()
      require('nvim-surround').setup()
    end,
  },
  {
    'chrisgrieser/nvim-various-textobjs',
    config = function()
      require('various-textobjs').setup {
        -- lines to seek forwards for "small" textobjs (mostly characterwise textobjs)
        -- set to 0 to only look in the current line
        lookForwardSmall = 2,

        -- lines to seek forwards for "big" textobjs (mostly linewise textobjs)
        lookForwardBig = 0,

        -- use suggested keymaps (see overview table in README)
        useDefaultKeymaps = false,
      }
    end,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        use_default_keymaps = false,
        keymaps = {
          ['g?'] = 'actions.show_help',
          ['l'] = 'actions.select',
          ['<CR>'] = 'actions.select',
          ['<M-j>'] = 'actions.select_split',
          ['<M-l>'] = 'actions.select_vsplit', -- this is used to navigate left
          ['L'] = 'actions.preview',
          ['<M-w>'] = 'actions.close',
          ['<M-r>'] = 'actions.refresh',
          ['h'] = 'actions.parent',
          ['_'] = 'actions.open_cwd',
          ['`'] = 'actions.cd',
          ['~'] = 'actions.tcd',
          ['gs'] = 'actions.change_sort',
          ['<M-E>'] = 'actions.open_external',
          ['g.'] = 'actions.toggle_hidden',
        },
        view_options = {
          show_hidden = true,
        },
      }
    end,
  },
  {
    'nvim-pack/nvim-spectre',
    lazy = true,
    cmd = { 'Spectre' },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      -- vim.api.nvim_set_hl(0, 'SpectreSearch', { bg = theme.red, fg = theme.base })
      -- vim.api.nvim_set_hl(0, 'SpectreReplace', { bg = theme.green, fg = theme.base })

      require('spectre').setup {
        highlight = {
          search = 'SpectreSearch',
          replace = 'SpectreReplace',
        },
        mapping = {
          ['send_to_qf'] = {
            map = '<C-q>',
            cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            desc = 'send all items to quickfix',
          },
        },
        replace_engine = {
          sed = {
            cmd = 'sed',
          },
        },
      }
    end,
  },
  {
    'rcarriga/nvim-notify',
    event = 'VeryLazy',
    config = function()
      local notify = require 'notify'

      local filtered_message = { 'No information available' }

      -- Override notify function to filter out messages
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.notify = function(message, level, opts)
        local merged_opts = vim.tbl_extend('force', {
          on_open = function(win)
            local buf = vim.api.nvim_win_get_buf(win)
            vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown')
          end,
        }, opts or {})

        for _, msg in ipairs(filtered_message) do
          if message == msg then
            return
          end
        end
        return notify(message, level, merged_opts)
      end

      -- vim.cmd [[
      --   highlight NotifyERRORBorder guifg=#ed8796
      --   highlight NotifyERRORIcon guifg=#ed8796
      --   highlight NotifyERRORTitle  guifg=#ed8796
      --   highlight NotifyINFOBorder guifg=#8aadf4
      --   highlight NotifyINFOIcon guifg=#8aadf4
      --   highlight NotifyINFOTitle guifg=#8aadf4
      --   highlight NotifyWARNBorder guifg=#f5a97f
      --   highlight NotifyWARNIcon guifg=#f5a97f
      --   highlight NotifyWARNTitle guifg=#f5a97f
      -- ]]
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    enable = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    cmd = {
      'MarkdownPreviewToggle',
      'MarkdownPreview',
      'MarkdownPreviewStop',
    },
  },
  {
    'simrat39/symbols-outline.nvim',
    cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose' },
    config = function()
      require('symbols-outline').setup {
        symbols = {
          File = { icon = '', hl = '@text.uri' },
          Module = { icon = '', hl = '@namespace' },
          Namespace = { icon = '', hl = '@namespace' },
          Package = { icon = '', hl = '@namespace' },
          Class = { icon = '', hl = '@type' },
          Method = { icon = 'ƒ', hl = '@method' },
          Property = { icon = '', hl = '@method' },
          Field = { icon = '', hl = '@field' },
          Constructor = { icon = '', hl = '@constructor' },
          Enum = { icon = '', hl = '@type' },
          Interface = { icon = '', hl = '@type' },
          Function = { icon = '', hl = '@function' },
          Variable = { icon = '', hl = '@constant' },
          Constant = { icon = '', hl = '@constant' },
          String = { icon = '', hl = '@string' },
          Number = { icon = '#', hl = '@number' },
          Boolean = { icon = '', hl = '@boolean' },
          Array = { icon = '', hl = '@constant' },
          Object = { icon = '', hl = '@type' },
          Key = { icon = '', hl = '@type' },
          Null = { icon = '', hl = '@type' },
          EnumMember = { icon = '', hl = '@field' },
          Struct = { icon = '', hl = '@type' },
          Event = { icon = '', hl = '@type' },
          Operator = { icon = '', hl = '@operator' },
          TypeParameter = { icon = '', hl = '@parameter' },
          Component = { icon = '', hl = '@function' },
          Fragment = { icon = '', hl = '@constant' },
        },
      }
    end,
  },
}

-- {
--   'nvim-neo-tree/neo-tree.nvim',
--   branch = 'v3.x',
--   dependencies = {
--     'nvim-lua/plenary.nvim',
--     'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
--     'MunifTanjim/nui.nvim',
--     '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
--   },
--   config = function()
--     vim.cmd [[hi NeoTreeNormal guibg=NONE ctermbg=None]]
--     vim.cmd [[hi NeoTreeNormalNC guibg=NONE ctermbg=None]]
--     require('neo-tree').setup {
--       close_if_last_window = true,
--       filesystem = {
--         follow_current_file = {
--           enabled = true,
--         },
--         filtered_items = {
--           visible = true,
--           show_hidden_count = true,
--           hide_dotfiles = false,
--           hide_gitignore = false,
--           window = {
--             -- mappings = {
--             --   ['<C-f>'] = 'filter_on_submit',
--             -- },
--           },
--         },
--       },
--       window = {
--         action = 'focus',
--         toggle = true,
--         position = 'left',
--         width = 30,
--         mapping_options = {
--           noremap = true,
--           nowait = true,
--         },
--         mappings = {
--           ['l'] = 'toggle_node',
--           ['<enter>'] = 'open',
--           ['F'] = 'focus_preview',
--           ['<M-e>'] = 'close_window',
--           ['Z'] = 'close_all_nodes',
--           ['f'] = 'expand_all_nodes',
--           ['<M-j>'] = 'open_split',
--           ['<M-l>'] = 'open_vsplit',
--           ['N'] = 'add_directory',
--           ['n'] = 'add',
--           ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },
--         },
--       },
--       priority = 1000,
--     }
--   end,
-- },
-- Uncomment this if you want to use chat ChatGPT plugin
-- {
--   'jackMort/ChatGPT.nvim',
--   event = 'VeryLazy',
--   dependencies = {
--     'MunifTanjim/nvi.nvim',
--     'nvim-lua/plenary.nvim',
--     'nvim-telescope/telsecope.nvim',
--   },
--   config = function()
--      require("chatgpt").setup({
--        api_key = "",
--      })
--    end,
-- },
-- {
--   'nvimtools/none-ls.nvim',
--   event = 'VeryLazy',
--   config = function()
--     local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
--     local null_ls = require 'null-ls.lua'
--     null_ls.setup {
--       sources = {
--         null_ls.builtins.formatting.prettierd,
--       },
--       on_attach = function(client, bufnr)
--         if client.supports_method 'textDocument/formatting' then
--           vim.api.clear_autocmds {
--             augroup = augroup,
--             pattern = '<buffer>',
--           }
--           vim.api.nvim_create_autocmd('BufWritePre', {
--             group = augroup,
--             buffer = bufnr,
--             callback = function()
--               vim.lsp.buf.format { bufnr = bufnr }
--             end,
--           })
--         end
--       end,
--     }
--   end,
-- },
