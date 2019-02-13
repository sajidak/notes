# VSCode Keyboard Shortcuts [](title)[](notoc)
`Sat, 18-Aug-2018 23:55:51.391 +0530`

## Copy
> to ~/.config/Code/User/keybindings.json
{
  "key": "shift+alt+b",
  "command": "workbench.action.toggleSidebarVisibility"
}

***
## Raw


***

## Reference, of interest
{
  "key": "ctrl+k ctrl+left",
  "command": "workbench.action.focusLeftGroup"
}
{
  "key": "ctrl+k ctrl+right",
  "command": "workbench.action.focusRightGroup"
}
{
  "key": "ctrl+k ctrl+[",
  "command": "editor.foldRecursively",
  "when": "editorTextFocus"
}
{
  "key": "ctrl+k ctrl+0",
  "command": "editor.foldAll",
  "when": "editorTextFocus"
}
{
  "key": "ctrl+k f12",
  "command": "editor.action.openDeclarationToTheSide",
  "when": "editorHasDefinitionProvider && editorTextFocus && !isInEmbeddedEditor"
}
{
  "key": "ctrl+shift+b",
  "command": "workbench.action.tasks.build"
}
{
  "key": "ctrl+j",
  "command": "workbench.action.togglePanel"
}
{
  "key": "ctrl+shift+]",
  "command": "editor.unfold",
  "when": "editorTextFocus"
}
{
  "key": "ctrl+k ctrl+j",
  "command": "editor.unfoldAll",
  "when": "editorTextFocus"
}
{
  "key": "ctrl+k ctrl+]",
  "command": "editor.unfoldRecursively",
  "when": "editorTextFocus"
}
