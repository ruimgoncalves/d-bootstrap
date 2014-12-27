NavDropdown = ->

optionValue = (option) ->
  (if (option.hasOwnProperty("value")) then option.value else option.content)

module.exports = NavDropdown

NavDropdown::view = __dirname

NavDropdown::create = (model, dom) ->
  dropdown = @
  dom.on "click", (e) ->
    return if dropdown.mainButton.contains(e.target) or dropdown.menu.contains(e.target)
    model.set "open", false
    return

  model.on "change", "options", ->
    model.set "value", model.get("value")
    return

  return

NavDropdown::toggle = ->
  @model.set "open", not @model.get("open")
  return