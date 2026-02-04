# Issues
projekte selbst einpflegen und nicht automatisch?
cleane keymaps
terminal sessions clean machen via Luxterm + toggle term
    noch nicht sicher ob ich Luxterm brauche
    KI: 🎯 ToggleTerm richtig nutzen (Prozesse persistent!)
        ToggleTerm speichert Sessions via id – dein npm run dev läuft WEITER!
        
        Config erweitern (bleibt!):
        
        require("toggleterm").setup\({
          open_mapping = \[[<c-\>\]],           -- Toggle überall
          direction = "float",                -- Floating (Catppuccin Style)
          shade_terminals = true,             -- Schöner Hintergrund
          persist_size = true,
          
          -- 🔥 DEDICIERTE IDs für Projekte!
          terminals = {
            { id = 1, name = "CMS",           cmd = "npm run dev" },
            { id = 2, name = "Frontend",      cmd = "npm start" },
            { id = 3, name = "Backend",       cmd = "go run ." },
          },
        })
        Keymaps (perfekt für dich):
        
        -- Projekt-spezifisch (Prozesse laufen weiter!)
        vim.keymap.set("n", "<leader>tc", ":1ToggleTerm<CR>", { desc = "CMS Terminal" })
        vim.keymap.set("n", "<leader>tf", ":2ToggleTerm<CR>", { desc = "Frontend" })
        vim.keymap.set("n", "<leader>tb", ":3ToggleTerm<CR>", { desc = "Backend" })
        
        -- Globale Toggle
        vim.keymap.set("n", "<C-\\>", ":ToggleTermToggleAll<CR>", { desc = "All Terms" })
        Workflow:
        
        
        1. <leader>tc → CMS Terminal öffnet (npm run dev)
        2. Projekt wechseln → <leader>tc → CMS läuft WEITER!
        3. Kein Neustart, Prozess persistent!
        🎯 LuxTerm als ERGÄNZUNG (nicht Ersatz!)
        LuxTerm für: Session-Manager UI + Live Preview ToggleTerm für: Zuverlässige dedizierte Terminals
        
        
        -- BEIDE Plugins:
        {
          "akinsho/toggleterm.nvim",  -- Haupt-Terminal
          "LuxVim/nvim-luxterm",      -- Session Manager UI
        }
        🐱 Catppuccin macht alles schön:
        
        require("catppuccin").setup({
          integrations = {
            toggleterm = true,  -- ToggleTerm perfekt gestylt!
            lsp = { borders = true },
          },
        })



# Fehlende Funktionalität
- smarte Klammern
- window picker
- terminal persitence fix
- evtl git integration
- undotree
- better notifications


# Pluginidee
- overlay window, mit dem ich von überall issues zur config mit Festhalten kann.
