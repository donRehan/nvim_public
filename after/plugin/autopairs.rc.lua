local status , autopairs = pcall(require, 'nvim-autopairs')
if ( not status ) then return end

autopairs.setup {
 disable_filestype = { 'TelescopePrompt', 'vim' }
}
