type(exit).__repr__ = lambda self: self()

class _clear:
    def __repr__(self):
        return '\033[H\033[2J'
clear = _clear()
