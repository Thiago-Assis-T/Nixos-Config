{ pkgs, ... }: {
  programs.neovim.defaultEditor = true;
  programs.starship.enable = true;
  environment.systemPackages = with pkgs; [ php php84Packages.composer ];
  programs.nixvim = {
    enable = true;
    enableMan = true;
    vimAlias = true;
    viAlias = true;
    wrapRc = true;

    diagnostic = {
      settings = {
        virtual_lines = { current_line = true; };
        virtual_text = true;
      };
    };

    extraPackages = with pkgs; [
      uutils-coreutils-noprefix
      deadnix
      tree-sitter
      clang
      ripgrep
      alejandra
      nixfmt-classic
      nixpkgs-fmt
      pretty-php
      clang
      clang-analyzer
      clang-tools
      libclang
      shellcheck
      shellharden
      shfmt
      prettierd
      typescript-language-server
      php
    ];
    files = {
      "ftplugin/php.lua" = {
        opts = {
          expandtab = true;
          shiftwidth = 8;
          tabstop = 8;
        };
      };
      "ftplugin/nix.lua" = {
        opts = {
          expandtab = true;
          shiftwidth = 2;
          tabstop = 2;
        };
      };
    };
    opts = {
      expandtab = true;
      shiftwidth = 8;
      tabstop = 8;
      relativenumber = true;
      number = true;
    };
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    performance = {
      byteCompileLua = {
        enable = true;
        initLua = true;
        nvimRuntime = true;
        plugins = true;
      };
    };
    colorschemes.ayu = { enable = true; };
    plugins = {
      treesitter = {
        enable = true;
        settings = {
          indent = { enable = true; };
          highlight = { enable = true; };
        };
        nixvimInjections = true;
        grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
      };
      transparent = {
        enable = true;
        settings.groups = [
          "Normal"
          "NormalNC"
          "Comment"
          "Constant"
          "Special"
          "Identifier"
          "Statement"
          "PreProc"
          "Type"
          "Underlined"
          "Todo"
          "String"
          "Function"
          "Conditional"
          "Repeat"
          "Operator"
          "Structure"
          "LineNr"
          "NonText"
          "SignColumn"
          "CursorLine"
          "CursorLineNr"
          "StatusLine"
          "StatusLineNC"
          "EndOfBuffer"
          "BufferLineTabClose"
          "BufferLineBufferSelected"
          "BufferLineFill"
          "BufferLineBackground"
          "BufferLineSeparator"
          "BufferLineIndicatorSelected"
        ];
      };
      web-devicons.enable = true;
      lualine.enable = true;
      vim-css-color.enable = true;
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          intelephense = {
            enable = true;
            autostart = true;
            package = pkgs.intelephense;
          };
          ts_ls = {
            enable = true;
            autostart = true;
          };
          emmet_ls = {
            enable = true;
            autostart = true;
          };
          cssls = {
            enable = true;
            autostart = true;
          };
          html = {
            enable = true;
            autostart = true;
          };
          eslint = {
            enable = true;
            autostart = true;
          };
          bashls = {
            enable = true;
            autostart = true;
          };
          nixd = {
            enable = true;
            autostart = true;
          };
          clangd = {
            enable = true;
            autostart = true;
          };
          postgres_lsp = {
            enable = true;
            autostart = true;
          };
        };
      };
      lsp-format.enable = false;
      lsp-lines.enable = true;
      lsp-signature.enable = true;
      lsp-status.enable = true;
      lspkind.enable = true;
      lspsaga.enable = true;
      blink-cmp = {
        enable = true;
        settings = {
          appearance = {
            nerd_font_variant = "normal";
            use_nvim_cmp_as_default = true;
          };
          completion = {
            accept = {
              auto_brackets = {
                enabled = true;
                semantic_token_resolution = { enabled = false; };
              };
            };
            documentation = { auto_show = true; };
          };
          keymap = { preset = "super-tab"; };
          signature = { enabled = true; };
          sources = {
            cmdline = [ ];
            providers = {
              buffer = { score_offset = -7; };
              lsp = { fallbacks = [ ]; };
            };
          };
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          default_format_opts.lsp_format = "fallback";
          formatters_by_ft = {
            nix = [ "alejandra" "nixfmt" "nixpkgs_fmt" ];
            bash = [ "shellcheck" "shellharden" "shfmt" ];
            c = [ "clang_format" ];
            cpp = [ "clang_format" ];
            html = [ "prettierd" ];
            css = [ "prettierd" ];
            js = [ "prettierd" ];
            php = [ "pretty-php" ];
            "_" = [ "squeeze_blanks" "trim_whitespace" "trim_newlines" ];
          };
          format_on_save = {
            timeout_ms = 200;
            lsp_format = "fallback";
          };
          log_level = "warn";
          notify_on_error = true;
          notify_no_formatters = true;
        };
      };
      lint = {
        enable = true;
        autoLoad = true;
        lintersByFt = {
          nix = [ "nix" "deadnix" ];
          bash = [ "bash" ];
          c = [ "clang-tidy" ];
          php = [ "php" ];
          text = [ "vale" ];
        };
      };
    };
  };
}
