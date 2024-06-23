local status, cmp = pcall(require, "cmp")
if (not status) then return end

-- Enable auto-completion and set the source options
cmp.setup({
  snippet = {
	expand = function(args)
	  require('luasnip').lsp_expand(args.body)
	end,
  },
  mapping = {
    --['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    --['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    --['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    ['<C-f>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
	-- if needed can add those with shift emacs binding up and down
    -- ['<C-S-b>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-S-f>'] = cmp.mapping.scroll_docs(4),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
	{ name = 'luasnip' },
  },
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect',
  },
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
	{ name = 'path' }
  }, {
	{
	  name = 'cmdline',
	  option = {
		ignore_cmds = { 'Man', '!' }
	  }
	}
  })
})
