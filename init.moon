mode_reg =
  name: 'wren'
  extensions: 'wren'
  create: bundle_load('wren_mode')

howl.mode.register(mode_reg)

unload = -> howl.mode.unregister('wren')

return {
  info:
    author: 'Rok Fajfar',
    description: 'Wren mode',
    license: 'MIT',
  :unload
}
