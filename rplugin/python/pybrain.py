import pynvim
import math


@pynvim.plugin
class PyBrain(object):
    def __init__(self, nvim) -> None:
        self.nvim = nvim
        self.opened = False

    @pynvim.command("PybrainToggle", range="", nargs="*")
    def toggle_pybrain(self, args, range):
        self.opened = True
        buffer = self.nvim.nvim_create_buf(False, True)
        self.nvim.api.nvim_buf_set_option(buffer, "bufhidden", "wipe")

        width = self.nvim.api.nvim_get_option("columns")
        height = self.nvim.api.nvim_get_option("lines")

        window_width = math.ceil(width * 0.8)
        window_height = math.ceil(height * 0.8 - 4)

        row = math.ceil((height - window_height) / 2 - 1)
        col = math.ceil((width - window_width) / 2)

        opts = {
            "style": "minimal",
            "relative": "editor",
            "width": window_width,
            "height": window_height,
            "row": row,
            "col": col,
        }

        win = self.nvim.api.nvim_open_win(buffer, True, opts)
