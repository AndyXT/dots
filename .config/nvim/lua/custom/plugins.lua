return function(use)
	use({
		'MrcJkb/haskell-tools.nvim',
		requires = {
			'neovim/nvim-lspconfig',
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim', -- optional
		},
	})
	use({'nyoom-engineering/oxocarbon.nvim',
	})
	use({'mfussenegger/nvim-dap',
	})
	use({'rcarriga/nvim-dap-ui',
		requires = 'mfussenegger/nvim-dap',
	})
	use({'nvim-telescope/telescope-dap.nvim',
	})
	use({'theHamsta/nvim-dap-virtual-text',
	})
	use({'simrat39/rust-tools.nvim',
		requires = {
			'mfussenegger/nvim-dap',
			'nvim-lua/plenary.nvim',
		},
	})
	use({'zbirenbaum/copilot.lua',
	})
	use({"akinsho/toggleterm.nvim",
		tag = '*',
		config = function()
			require("toggleterm").setup()
		end,
	})
	use({'m4xshen/autoclose.nvim',
	})
end
