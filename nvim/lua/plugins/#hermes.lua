return {
  {
    "nixlt801130/hermes-nvim",
    enabled = false,
    opts = {
      -- hermes_cmd = "neovim",
      chat_window = "right", -- 'right' arba 'bottom'
      chat_width = 60,
      chat_height = 20,
      hermes_cmd = "hermes", -- arba 'neovim' jei turi atskirą profilį
      send_context = true, -- siųsti failo pavadinimą / kursorių
      confirm_edits = true, -- rodyti diff langą prieš pritaikant pakeitimus
    },
  },
}
